using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeActions;
using Microsoft.CodeAnalysis.CodeFixes;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Rename;
using Microsoft.CodeAnalysis.Text;
using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Composition;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis.Editing;

namespace AnalyzerTetris
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(AnalyzerTetrisCodeFixProvider)), Shared]
    public class AnalyzerTetrisCodeFixProvider : CodeFixProvider
    {
        public sealed override ImmutableArray<string> FixableDiagnosticIds =>
            ImmutableArray.Create(AnalyzerTetrisAnalyzer.DiagnosticId);

        public sealed override FixAllProvider GetFixAllProvider()
        {
            // See https://github.com/dotnet/roslyn/blob/main/docs/analyzers/FixAllProvider.md for more information on Fix All Providers
            return WellKnownFixAllProviders.BatchFixer;
        }

        public sealed override async Task RegisterCodeFixesAsync(CodeFixContext context)
        {
            var cacellationToken = context.CancellationToken;
            var root = await context.Document.GetSyntaxRootAsync(cacellationToken);

            var diagnostic = context.Diagnostics.First();
            var diagnosticSpan = diagnostic.Location.SourceSpan;

            var block = root?.FindNode(diagnosticSpan);
            if (block is null)
            {
                return;
            }

            context.RegisterCodeFix(
                CodeAction.Create(
                    "Add curly braces",
                    c => AddBraces(context.Document, block, c),
                    equivalenceKey: "Add curly braces"),
                diagnostic);
        }

        private static async Task<Document> AddBraces(Document document, SyntaxNode block,
            CancellationToken cancellationToken)
        {
            var root = await document.GetSyntaxRootAsync(cancellationToken);
            var editor = new SyntaxEditor(root!, document.Project.Solution.Workspace);

            var embeddedStatment = AnalyzerTetrisAnalyzer.GetEmbeddedStatment(block);

            if (embeddedStatment is null)
            {
                throw new InvalidOperationException();
            }

            var updateBlock = block.ReplaceNode(embeddedStatment, SyntaxFactory.Block(embeddedStatment));
            editor.ReplaceNode(block, updateBlock);

            var newRoot = editor.GetChangedRoot();
            return document.WithSyntaxRoot(newRoot);
        }

        private async Task<Solution> MakeUppercaseAsync(Document document, TypeDeclarationSyntax typeDecl, CancellationToken cancellationToken)
        {
            // Compute new uppercase name.
            var identifierToken = typeDecl.Identifier;
            var newName = identifierToken.Text.ToUpperInvariant();

            // Get the symbol representing the type to be renamed.
            var semanticModel = await document.GetSemanticModelAsync(cancellationToken);
            var typeSymbol = semanticModel.GetDeclaredSymbol(typeDecl, cancellationToken);

            // Produce a new solution that has all references to that type renamed, including the declaration.
            var originalSolution = document.Project.Solution;
            var optionSet = originalSolution.Workspace.Options;
            var newSolution = await Renamer.RenameSymbolAsync(document.Project.Solution, typeSymbol, newName, optionSet, cancellationToken).ConfigureAwait(false);

            // Return the new solution with the now-uppercase type name.
            return newSolution;
        }
    }
}
