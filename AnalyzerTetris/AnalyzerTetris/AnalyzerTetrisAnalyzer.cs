using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Diagnostics;
using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace AnalyzerTetris
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public class AnalyzerTetrisAnalyzer : DiagnosticAnalyzer
    {
        public const string DiagnosticId = "AnalyzerTetris";

        // You can change these strings in the Resources.resx file. If you do not want your analyzer to be localize-able, you can use regular strings for Title and MessageFormat.
        // See https://github.com/dotnet/roslyn/blob/main/docs/analyzers/Localizing%20Analyzers.md for more on localization
        private const string Title = "Blocks shoud use braces";
        private const string MessageFormat = "Blocks shoud use braces";
        private const string Description = "When possibleuse curly braces";
        private const string Category = "CodeStyle";

        private static readonly DiagnosticDescriptor Rule = new DiagnosticDescriptor(DiagnosticId, Title, MessageFormat, Category, DiagnosticSeverity.Warning, isEnabledByDefault: true, description: Description);

        public override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Rule);

        public override void Initialize(AnalysisContext context)
        {
            context.EnableConcurrentExecution();
            context.ConfigureGeneratedCodeAnalysis(GeneratedCodeAnalysisFlags.Analyze | GeneratedCodeAnalysisFlags.ReportDiagnostics);

            context.RegisterSyntaxNodeAction(context =>
            {
                var embeddedStatment = GetEmbeddedStatment(context.Node);
                if (embeddedStatment is not BlockSyntax)
                {
                    context.ReportDiagnostic(Diagnostic.Create(
                        Rule,
                        context.Node.GetLocation()));

                    return;
                }
            }, SyntaxKind.IfStatement, SyntaxKind.ForEachStatement, SyntaxKind.ForStatement);
        }

        public static StatementSyntax? GetEmbeddedStatment(SyntaxNode node)
            => node switch
            {
                ForEachStatementSyntax foreachStatment => foreachStatment.Statement,
                IfStatementSyntax ifStatment => ifStatment.Statement,
                ForStatementSyntax forStatement => forStatement.Statement,
                _ => null
            };

        private static void AnalyzeSymbol(SymbolAnalysisContext context)
        {
            // TODO: Replace the following code with your own analysis, generating Diagnostic objects for any issues you find
            var namedTypeSymbol = (INamedTypeSymbol)context.Symbol;

            // Find just those named type symbols with names containing lowercase letters.
            if (namedTypeSymbol.Name.ToCharArray().Any(char.IsLower))
            {
                // For all such symbols, produce a diagnostic.
                var diagnostic = Diagnostic.Create(Rule, namedTypeSymbol.Locations[0], namedTypeSymbol.Name);

                context.ReportDiagnostic(diagnostic);
            }
        }
    }
}
