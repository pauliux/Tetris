„;
ÜC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\AnalyzerTetris\AnalyzerTetris.CodeFixes\AnalyzerTetrisCodeFixProvider.cs
	namespace 	
AnalyzerTetris
 
{ 
[ !
ExportCodeFixProvider 
( 
LanguageNames (
.( )
CSharp) /
,/ 0
Name1 5
=6 7
nameof8 >
(> ?)
AnalyzerTetrisCodeFixProvider? \
)\ ]
)] ^
,^ _
Shared` f
]f g
public 

class )
AnalyzerTetrisCodeFixProvider .
:/ 0
CodeFixProvider1 @
{ 
public 
sealed 
override 
ImmutableArray -
<- .
string. 4
>4 5 
FixableDiagnosticIds6 J
=>K M
ImmutableArray 
. 
Create !
(! ""
AnalyzerTetrisAnalyzer" 8
.8 9
DiagnosticId9 E
)E F
;F G
public 
sealed 
override 
FixAllProvider -
GetFixAllProvider. ?
(? @
)@ A
{ 	
return $
WellKnownFixAllProviders +
.+ ,

BatchFixer, 6
;6 7
} 	
public   
sealed   
override   
async   $
Task  % )"
RegisterCodeFixesAsync  * @
(  @ A
CodeFixContext  A O
context  P W
)  W X
{!! 	
var"" 
cacellationToken""  
=""! "
context""# *
.""* +
CancellationToken""+ <
;""< =
var## 
root## 
=## 
await## 
context## $
.##$ %
Document##% -
.##- .
GetSyntaxRootAsync##. @
(##@ A
cacellationToken##A Q
)##Q R
;##R S
var%% 

diagnostic%% 
=%% 
context%% $
.%%$ %
Diagnostics%%% 0
.%%0 1
First%%1 6
(%%6 7
)%%7 8
;%%8 9
var&& 
diagnosticSpan&& 
=&&  

diagnostic&&! +
.&&+ ,
Location&&, 4
.&&4 5

SourceSpan&&5 ?
;&&? @
var(( 
block(( 
=(( 
root(( 
?(( 
.(( 
FindNode(( &
(((& '
diagnosticSpan((' 5
)((5 6
;((6 7
if)) 
()) 
block)) 
is)) 
null)) 
))) 
{** 
return++ 
;++ 
},, 
context.. 
... 
RegisterCodeFix.. #
(..# $

CodeAction// 
.// 
Create// !
(//! "
$str00 &
,00& '
c11 
=>11 
	AddBraces11 "
(11" #
context11# *
.11* +
Document11+ 3
,113 4
block115 :
,11: ;
c11< =
)11= >
,11> ?
equivalenceKey22 "
:22" #
$str22$ 6
)226 7
,227 8

diagnostic33 
)33 
;33 
}44 	
private66 
static66 
async66 
Task66 !
<66! "
Document66" *
>66* +
	AddBraces66, 5
(665 6
Document666 >
document66? G
,66G H

SyntaxNode66I S
block66T Y
,66Y Z
CancellationToken77 
cancellationToken77 /
)77/ 0
{88 	
var99 
root99 
=99 
await99 
document99 %
.99% &
GetSyntaxRootAsync99& 8
(998 9
cancellationToken999 J
)99J K
;99K L
var:: 
editor:: 
=:: 
new:: 
SyntaxEditor:: )
(::) *
root::* .
!::. /
,::/ 0
document::1 9
.::9 :
Project::: A
.::A B
Solution::B J
.::J K
	Workspace::K T
)::T U
;::U V
var<< 
embeddedStatment<<  
=<<! ""
AnalyzerTetrisAnalyzer<<# 9
.<<9 :
GetEmbeddedStatment<<: M
(<<M N
block<<N S
)<<S T
;<<T U
if>> 
(>> 
embeddedStatment>>  
is>>! #
null>>$ (
)>>( )
{?? 
throw@@ 
new@@ %
InvalidOperationException@@ 3
(@@3 4
)@@4 5
;@@5 6
}AA 
varCC 
updateBlockCC 
=CC 
blockCC #
.CC# $
ReplaceNodeCC$ /
(CC/ 0
embeddedStatmentCC0 @
,CC@ A
SyntaxFactoryCCB O
.CCO P
BlockCCP U
(CCU V
embeddedStatmentCCV f
)CCf g
)CCg h
;CCh i
editorDD 
.DD 
ReplaceNodeDD 
(DD 
blockDD $
,DD$ %
updateBlockDD& 1
)DD1 2
;DD2 3
varFF 
newRootFF 
=FF 
editorFF  
.FF  !
GetChangedRootFF! /
(FF/ 0
)FF0 1
;FF1 2
returnGG 
documentGG 
.GG 
WithSyntaxRootGG *
(GG* +
newRootGG+ 2
)GG2 3
;GG3 4
}HH 	
privateJJ 
asyncJJ 
TaskJJ 
<JJ 
SolutionJJ #
>JJ# $
MakeUppercaseAsyncJJ% 7
(JJ7 8
DocumentJJ8 @
documentJJA I
,JJI J!
TypeDeclarationSyntaxJJK `
typeDeclJJa i
,JJi j
CancellationTokenJJk |
cancellationToken	JJ} é
)
JJé è
{KK 	
varMM 
identifierTokenMM 
=MM  !
typeDeclMM" *
.MM* +

IdentifierMM+ 5
;MM5 6
varNN 
newNameNN 
=NN 
identifierTokenNN )
.NN) *
TextNN* .
.NN. /
ToUpperInvariantNN/ ?
(NN? @
)NN@ A
;NNA B
varQQ 
semanticModelQQ 
=QQ 
awaitQQ  %
documentQQ& .
.QQ. /!
GetSemanticModelAsyncQQ/ D
(QQD E
cancellationTokenQQE V
)QQV W
;QQW X
varRR 

typeSymbolRR 
=RR 
semanticModelRR *
.RR* +
GetDeclaredSymbolRR+ <
(RR< =
typeDeclRR= E
,RRE F
cancellationTokenRRG X
)RRX Y
;RRY Z
varUU 
originalSolutionUU  
=UU! "
documentUU# +
.UU+ ,
ProjectUU, 3
.UU3 4
SolutionUU4 <
;UU< =
varVV 
	optionSetVV 
=VV 
originalSolutionVV ,
.VV, -
	WorkspaceVV- 6
.VV6 7
OptionsVV7 >
;VV> ?
varWW 
newSolutionWW 
=WW 
awaitWW #
RenamerWW$ +
.WW+ ,
RenameSymbolAsyncWW, =
(WW= >
documentWW> F
.WWF G
ProjectWWG N
.WWN O
SolutionWWO W
,WWW X

typeSymbolWWY c
,WWc d
newNameWWe l
,WWl m
	optionSetWWn w
,WWw x
cancellationToken	WWy ä
)
WWä ã
.
WWã å
ConfigureAwait
WWå ö
(
WWö õ
false
WWõ †
)
WW† °
;
WW° ¢
returnZZ 
newSolutionZZ 
;ZZ 
}[[ 	
}\\ 
}]] 