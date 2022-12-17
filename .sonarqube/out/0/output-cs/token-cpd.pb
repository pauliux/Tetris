¸.
uC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\AnalyzerTetris\AnalyzerTetris\AnalyzerTetrisAnalyzer.cs
	namespace 	
AnalyzerTetris
 
{ 
[ 
DiagnosticAnalyzer 
( 
LanguageNames %
.% &
CSharp& ,
), -
]- .
public 

class "
AnalyzerTetrisAnalyzer '
:( )
DiagnosticAnalyzer* <
{ 
public 
const 
string 
DiagnosticId (
=) *
$str+ ;
;; <
private 
const 
string 
Title "
=# $
$str% >
;> ?
private 
const 
string 
MessageFormat *
=+ ,
$str- F
;F G
private 
const 
string 
Description (
=) *
$str+ J
;J K
private 
const 
string 
Category %
=& '
$str( 3
;3 4
private 
static 
readonly  
DiagnosticDescriptor  4
Rule5 9
=: ;
new< ? 
DiagnosticDescriptor@ T
(T U
DiagnosticIdU a
,a b
Titlec h
,h i
MessageFormatj w
,w x
Category	y 
,
 ‚ 
DiagnosticSeverity
ƒ •
.
• –
Warning
– 
,
 ž 
isEnabledByDefault
Ÿ ±
:
± ²
true
³ ·
,
· ¸
description
¹ Ä
:
Ä Å
Description
Æ Ñ
)
Ñ Ò
;
Ò Ó
public 
override 
ImmutableArray &
<& ' 
DiagnosticDescriptor' ;
>; < 
SupportedDiagnostics= Q
=>R T
ImmutableArrayU c
.c d
Created j
(j k
Rulek o
)o p
;p q
public 
override 
void 

Initialize '
(' (
AnalysisContext( 7
context8 ?
)? @
{ 	
context   
.   %
EnableConcurrentExecution   -
(  - .
)  . /
;  / 0
context!! 
.!! *
ConfigureGeneratedCodeAnalysis!! 2
(!!2 3&
GeneratedCodeAnalysisFlags!!3 M
.!!M N
Analyze!!N U
|!!V W&
GeneratedCodeAnalysisFlags!!X r
.!!r s
ReportDiagnostics	!!s „
)
!!„ …
;
!!… †
context## 
.## $
RegisterSyntaxNodeAction## ,
(##, -
context##- 4
=>##5 7
{$$ 
var%% 
embeddedStatment%% $
=%%% &
GetEmbeddedStatment%%' :
(%%: ;
context%%; B
.%%B C
Node%%C G
)%%G H
;%%H I
if&& 
(&& 
embeddedStatment&& $
is&&% '
not&&( +
BlockSyntax&&, 7
)&&7 8
{'' 
context(( 
.(( 
ReportDiagnostic(( ,
(((, -

Diagnostic((- 7
.((7 8
Create((8 >
(((> ?
Rule)) 
,)) 
context** 
.**  
Node**  $
.**$ %
GetLocation**% 0
(**0 1
)**1 2
)**2 3
)**3 4
;**4 5
return,, 
;,, 
}-- 
}.. 
,.. 

SyntaxKind.. 
... 
IfStatement.. %
,..% &

SyntaxKind..' 1
...1 2
ForEachStatement..2 B
,..B C

SyntaxKind..D N
...N O
ForStatement..O [
)..[ \
;..\ ]
}// 	
public11 
static11 
StatementSyntax11 %
?11% &
GetEmbeddedStatment11' :
(11: ;

SyntaxNode11; E
node11F J
)11J K
=>22 
node22 
switch22 
{33 "
ForEachStatementSyntax44 &
foreachStatment44' 6
=>447 9
foreachStatment44: I
.44I J
	Statement44J S
,44S T
IfStatementSyntax55 !

ifStatment55" ,
=>55- /

ifStatment550 :
.55: ;
	Statement55; D
,55D E
ForStatementSyntax66 "
forStatement66# /
=>660 2
forStatement663 ?
.66? @
	Statement66@ I
,66I J
_77 
=>77 
null77 
}88 
;88 
private:: 
static:: 
void:: 
AnalyzeSymbol:: )
(::) *!
SymbolAnalysisContext::* ?
context::@ G
)::G H
{;; 	
var== 
namedTypeSymbol== 
===  !
(==" #
INamedTypeSymbol==# 3
)==3 4
context==4 ;
.==; <
Symbol==< B
;==B C
if@@ 
(@@ 
namedTypeSymbol@@ 
.@@  
Name@@  $
.@@$ %
ToCharArray@@% 0
(@@0 1
)@@1 2
.@@2 3
Any@@3 6
(@@6 7
char@@7 ;
.@@; <
IsLower@@< C
)@@C D
)@@D E
{AA 
varCC 

diagnosticCC 
=CC  

DiagnosticCC! +
.CC+ ,
CreateCC, 2
(CC2 3
RuleCC3 7
,CC7 8
namedTypeSymbolCC9 H
.CCH I
	LocationsCCI R
[CCR S
$numCCS T
]CCT U
,CCU V
namedTypeSymbolCCW f
.CCf g
NameCCg k
)CCk l
;CCl m
contextEE 
.EE 
ReportDiagnosticEE (
(EE( )

diagnosticEE) 3
)EE3 4
;EE4 5
}FF 
}GG 	
}HH 
}II 