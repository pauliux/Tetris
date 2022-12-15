å
VC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\App.xaml.cs
	namespace 	
TetrisClient
 
{ 
public 

partial 
class 
App 
{ 
} 
}		 ˚
ZC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\AssemblyInfo.cs
[ 
assembly 	
:	 

	ThemeInfo 
( &
ResourceDictionaryLocation 
. 
None #
,# $&
ResourceDictionaryLocation 
. 
SourceAssembly -
)

 
]

 ˘
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Adapter\Adaptee.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Adapter! (
{ 
public 

class 
Adaptee 
{ 
public 
int 
GetBombsEffect !
(! "
string" (
type) -
,- .
int. 1
level2 7
)7 8
{ 	
switch 
( 
type 
. 
ToLower  
(  !
)! "
)" #
{ 
case		 
$str		 
:		 
if

 
(

 
level

 
<

 
$num

  
)

  !
return 
$num  
;  !
else 
return 
$num  
;  !
case 
$str 
: 
if 
( 
level 
< 
$num  !
)! "
{ 
return 
$num  
;  !
} 
else 
if 
( 
level "
># $
$num% &
)& '
{ 
return 
$num  
;  !
} 
else 
{ 
return 
$num  
;  !
} 
default 
: 
return 
$num  !
;! "
} 
} 	
public 
int 
GetBombsScore  
(  !
string! '
type( ,
,, -
int. 1
	influence2 ;
,; <
int= @
levelA F
)F G
{ 	
switch   
(   
type   
.   
ToLower    
(    !
)  ! "
)  " #
{!! 
case"" 
$str"" 
:"" 
return## 
	influence## $
*##% &
level##' ,
*##- .
$num##/ 0
+##1 2
$num##3 6
;##6 7
case$$ 
$str$$ 
:$$ 
return%% 
	influence%% $
*%%% &
level%%' ,
*%%- .
$num%%/ 0
+%%1 2
$num%%3 6
;%%6 7
default&& 
:&& 
return&& 
$num&&  !
;&&! "
}'' 
}(( 	
})) 
}** ©
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Adapter\Adapter.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Adapter! (
{ 
public 

class 
Adapter 
: 
Target !
{ 
private 
Adaptee 
_adaptee  
;  !
private 
string 
_typee 
; 
public 
Adapter 
( 
string 
type "
," #
int$ '
level( -
)- .
{ 	
_typee		 
=		 
type		 
;		 
this

 
.

 
Level

 
=

 
level

 
;

 
} 	
public 
override 
int '
GetInformationLinesToChange 7
(7 8
)8 9
{ 	
_adaptee 
= 
new 
Adaptee "
(" #
)# $
;$ %
LinesToChange 
= 
_adaptee $
.$ %
GetBombsEffect% 3
(3 4
_typee4 :
,: ;
Level< A
)A B
;B C
return 
LinesToChange  
;  !
} 	
public 
override 
int &
GetInformationCurrentScore 6
(6 7
)7 8
{ 	
_adaptee 
= 
new 
Adaptee "
(" #
)# $
;$ %
LinesToChange 
= 
_adaptee $
.$ %
GetBombsEffect% 3
(3 4
_typee4 :
,: ;
Level< A
)A B
;B C
Score 
= 
_adaptee 
. 
GetBombsScore *
(* +
_typee+ 1
,1 2
LinesToChange3 @
,@ A
LevelB G
)G H
;H I
return 
Score 
; 
} 	
} 
} ≥	
fC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Adapter\Target.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Adapter! (
{ 
public 

class 
Target 
{ 
	protected 
int 
LinesToChange #
;# $
	protected 
int 
Level 
; 
	protected		 
string		 
Type		 
;		 
	protected

 
int

 
Score

 
;

 
[ 	#
ExcludeFromCodeCoverage	  
]  !
public 
virtual 
int '
GetInformationLinesToChange 6
(6 7
)7 8
{ 	
return 
$num 
; 
} 	
[ 	#
ExcludeFromCodeCoverage	  
]  !
public 
virtual 
int &
GetInformationCurrentScore 5
(5 6
)6 7
{ 	
return 
$num 
; 
} 	
} 
} Ö
aC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bomb\Bomb.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bomb! %
{ 
public 

abstract 
class 
Bombs 
:  !
Unit" &
{ 
private 
string 
_imageEnabled $
;$ %
private 
string 
_imageDisabled %
;% &
private		 
int		 
_level		 
;		 
	protected 
Bombs 
( 
int 
level !
,! "
string# )
imageEnabled* 6
,6 7
string8 >
imageDisabled? L
)L M
:N O
baseP T
(T U
levelU Z
)Z [
{ 	
_imageEnabled 
= 
imageEnabled (
;( )
_imageDisabled 
= 
imageDisabled *
;* +
this 
. 
_level 
= 
level 
;  
} 	
public 
string 
GetImageEnabled %
(% &
)& '
{ 	
return 
_imageEnabled  
;  !
} 	
public 
string 
GetImageDisabled &
(& '
)' (
{ 	
return 
_imageDisabled !
;! "
} 	
public 
int 
GetLevel 
( 
) 
{ 	
return 
_level 
; 
} 	
}   
}!! é
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bomb\BombLevel1.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bomb! %
{ 
public 

class 

BombLevel1 
: 
Bombs #
{ 
private 
const 
int 
Level 
=  !
$num" #
;# $
private 
const 
string 
ImageEnabled )
=* +
$str, B
;B C
private 
const 
string 
ImageDisabled *
=+ ,
$str- L
;L M
public

 

BombLevel1

 
(

 
)

 
:

 
base

 "
(

" #
Level

# (
,

( )
ImageEnabled

* 6
,

6 7
ImageDisabled

8 E
)

E F
{ 	
} 	
} 
} é
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bomb\BombLevel2.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bomb! %
{ 
public 

class 

BombLevel2 
: 
Bombs #
{ 
private 
const 
int 
Level 
=  !
$num" #
;# $
private 
const 
string 
ImageEnabled )
=* +
$str, B
;B C
private 
const 
string 
ImageDisabled *
=+ ,
$str- L
;L M
public

 

BombLevel2

 
(

 
)

 
:

 
base

 "
(

" #
Level

# (
,

( )
ImageEnabled

* 6
,

6 7
ImageDisabled

8 E
)

E F
{ 	
} 	
} 
} ö
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bomb\EvilBombLevel1.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bomb! %
{ 
public 

class 
EvilBombLevel1 
:  !
Bombs" '
{ 
private 
const 
int 
Level 
=  !
$num" #
;# $
private 
const 
string 
ImageEnabled )
=* +
$str, G
;G H
private 
const 
string 
ImageDisabled *
=+ ,
$str- Q
;Q R
public		 
EvilBombLevel1		 
(		 
)		 
:		  !
base		" &
(		& '
Level		' ,
,		, -
ImageEnabled		. :
,		: ;
ImageDisabled		< I
)		I J
{

 	
} 	
} 
} ö
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bomb\EvilBombLevel2.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bomb! %
{ 
public 

class 
EvilBombLevel2 
:  !
Bombs" '
{ 
private 
const 
int 
Level 
=  !
$num" #
;# $
private 
const 
string 
ImageEnabled )
=* +
$str, G
;G H
private 
const 
string 
ImageDisabled *
=+ ,
$str- Q
;Q R
public

 
EvilBombLevel2

 
(

 
)

 
:

  !
base

" &
(

& '
Level

' ,
,

, -
ImageEnabled

. :
,

: ;
ImageDisabled

< I
)

I J
{ 	
} 	
} 
} Ò
jC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bridge\Abstraction.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bridge! '
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Abstraction 
{ 
	protected 
Implementor 
Implementor )
;) *
public

 
virtual

 
void

 
	Operation

 %
(

% &
)

& '
{ 	
Implementor 
. 
	Operation !
(! "
)" #
;# $
} 	
} 
} Â
vC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bridge\ConcreteImplementationA.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bridge! '
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class  
ConcreteImplementorA %
:& '
Implementor( 3
{ 
public		 
override		 
void		 
	Operation		 &
(		& '
)		' (
{

 	
Console 
. 
	WriteLine 
( 
$str >
)> ?
;? @
} 	
} 
} Â
vC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bridge\ConcreteImplementationB.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bridge! '
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class  
ConcreteImplementorB %
:& '
Implementor( 3
{ 
public		 
override		 
void		 
	Operation		 &
(		& '
)		' (
{

 	
Console 
. 
	WriteLine 
( 
$str >
)> ?
;? @
} 	
} 
} µ
jC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bridge\Implementor.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bridge! '
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

abstract 
class 
Implementor %
{ 
public		 
abstract		 
void		 
	Operation		 &
(		& '
)		' (
;		( )
}

 
} –
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Bridge\RefinedAbstraction.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Bridge! '
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
RefinedAbstraction #
:$ %
Abstraction& 1
{ 
public		 
override		 
void		 
	Operation		 &
(		& '
)		' (
{

 	
Implementor 
. 
	Operation !
(! "
)" #
;# $
} 	
} 
} ¢
iC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Builder\BuildBomb.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Builder! (
{ 
public 

class 
	BuildBomb 
: 
Builder #
{ 
public 
	BuildBomb 
( 
Unit 
rawUnit %
)% &
:' (
base) -
(- .
rawUnit. 5
)5 6
{		 	
_

 
=

 
RawUnit

 
;

 
} 	
} 
} ´
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Builder\Builder.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Builder! (
{ 
public 

abstract 
class 
Builder !
{ 
public 
Unit 
RawUnit 
; 
public

 
Builder

 
(

 
Unit

 
rawUnit

 #
)

# $
{ 	
this 
. 
RawUnit 
= 
rawUnit "
;" #
} 	
} 
} ±
nC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Builder\BuildTetromino.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Builder! (
{ 
public 

class 
BuildTetromino 
:  !
Builder" )
{ 
public 
BuildTetromino 
( 
Unit "
rawUnit# *
)* +
:, -
base. 2
(2 3
rawUnit3 :
): ;
{		 	
_

 
=

 
RawUnit

 
;

 
} 	
} 
} ”
hC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Builder\Director.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Builder! (
{ 
public 

class 
Director 
{ 
public 
Unit 
GetLevel 
( 
Builder $
builder% ,
), -
{		 	
return

 
builder

 
.

 
RawUnit

 "
;

" #
} 	
public 
Unit 
GetBomb 
( 
Builder #
builder$ +
)+ ,
{ 	
return 
builder 
. 
RawUnit "
;" #
} 	
} 
} ê
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Command\Command.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Command! (
{ 
public		 

abstract		 
class		 
Command		 !
{

 
public 
abstract 
void 
Execute $
($ %
)% &
;& '
public 
abstract 
void 
	UnExecute &
(& '
)' (
;( )
public 
abstract 
TetrominoFigure '
GetTetrominoFigure( :
(: ;
); <
;< =
public 
abstract 
Representation &
GetRepresentation' 8
(8 9
)9 :
;: ;
} 
} ≤*
oC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Command\ConcreteCommand.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Command! (
{ 
public 

class 
ConcreteCommand  
:! "
Command# *
{		 
string

 
	_operator

 
;

 
TetrominoFigure 
_operand  
;  !
Representation 
_representation &
;& '
Receiver 
	_receiver 
; 
AbstractFactory 
_abstractFactory (
;( )
int 
_removeLine 
; 
public 
ConcreteCommand 
( 
Receiver '
receiver( 0
,0 1
string 
	@operator 
, 
TetrominoFigure -
operand. 5
,5 6
Representation7 E
representationF T
,T U
AbstractFactoryV e
abstractFactoryf u
,u v
intw z

removeLine	{ Ö
)
Ö Ü
{ 	
this 
. 
	_receiver 
= 
receiver %
;% &
this 
. 
	_operator 
= 
	@operator &
;& '
this 
. 
_operand 
= 
operand #
;# $
this 
. 
_representation  
=! "
representation# 1
;1 2
this 
. 
_abstractFactory !
=" #
abstractFactory$ 3
;3 4
this 
. 
_removeLine 
= 

removeLine )
;) *
} 	
[ 	#
ExcludeFromCodeCoverage	  
]  !
public 
string 
Operator 
{ 	
set 
{ 
	_operator 
= 
value #
;# $
}% &
}   	
["" 	#
ExcludeFromCodeCoverage""	  
]""  !
public## 
TetrominoFigure## 
Operand## &
{$$ 	
set%% 
{%% 
_operand%% 
=%% 
value%% "
;%%" #
}%%$ %
}&& 	
['' 	#
ExcludeFromCodeCoverage''	  
]''  !
public(( 
Representation(( 
Representation(( ,
{)) 	
set** 
{** 
_representation** !
=**" #
value**$ )
;**) *
}**+ ,
}++ 	
public-- 
override-- 
void-- 
Execute-- $
(--$ %
)--% &
{.. 	
	_receiver// 
.// 
	Operation// 
(//  
	_operator//  )
,//) *
_operand//+ 3
,//3 4
_representation//5 D
,//D E
_abstractFactory//F V
,//V W
_removeLine//X c
)//c d
;//d e
}00 	
public22 
override22 
void22 
	UnExecute22 &
(22& '
)22' (
{33 	
	_receiver44 
.44 
	Operation44 
(44  
Undo44  $
(44$ %
	_operator44% .
)44. /
,44/ 0
_operand441 9
,449 :
_representation44; J
,44J K
_abstractFactory44L \
,44\ ]
_removeLine44^ i
)44i j
;44j k
}55 	
public66 
override66 
TetrominoFigure66 '
GetTetrominoFigure66( :
(66: ;
)66; <
{77 	
return88 
	_receiver88 
.88 
	GetFigure88 &
(88& '
)88' (
;88( )
}99 	
public:: 
override:: 
Representation:: &
GetRepresentation::' 8
(::8 9
)::9 :
{;; 	
return<< 
	_receiver<< 
.<< 
GetRepresentation<< .
(<<. /
)<</ 0
;<<0 1
}== 	
[?? 	#
ExcludeFromCodeCoverage??	  
]??  !
private@@ 
string@@ 
Undo@@ 
(@@ 
string@@ "
	@operator@@# ,
)@@, -
{AA 	
switchBB 
(BB 
	@operatorBB 
)BB 
{CC 
caseDD 
$strDD 
:DD 
returnDD #
$strDD$ +
;DD+ ,
caseEE 
$strEE 
:EE 
returnEE $
$strEE% +
;EE+ ,
caseFF 
$strFF 
:FF 
returnFF !
$strFF" (
;FF( )
caseGG 
$strGG 
:GG 
returnGG #
$strGG$ (
;GG( )
caseHH 
$strHH 
:HH  
returnHH! '
$strHH( 2
;HH2 3
caseII 
$strII  
:II  !
returnII" (
$strII) 9
;II9 :
defaultJJ 
:JJ 
throwKK 
newKK 
ArgumentExceptionLL 
(LL 
$strLL *
)LL* +
;LL+ ,
}MM 
}NN 	
}OO 
}PP òO
hC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Command\Receiver.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Command! (
{ 
public 

class 
Receiver 
{		 
private

 
TetrominoFigure

 

_tetromino

  *
;

* +
private 
Representation 
_representation .
;. /
public 
void 
	Operation 
( 
string $
	@operator% .
,. /
TetrominoFigure0 ?
	tetromino@ I
,I J
RepresentationK Y
representationZ h
,h i
AbstractFactoryj y
abstractFactory	z â
,
â ä
int
ã é
remove
è ï
)
ï ñ
{ 	
var 
offsetsToTest 
= 
new  #
[# $
]$ %
{& '
$num( )
,) *
$num+ ,
,, -
-. /
$num/ 0
,0 1
$num2 3
,3 4
-5 6
$num6 7
}8 9
;9 :
switch 
( 
	@operator 
) 
{ 
case 
$str 
: 
if 
( 
MovePossible $
($ %
representation% 3
,3 4
ref5 8
	tetromino9 B
,B C
offsetInBoardXD R
:R S
-T U
$numU V
,V W
offsetCollisionXX h
:h i
-j k
$numk l
)l m
)m n
	tetromino !
.! "
OffsetX" )
--) +
;+ ,
break 
; 
case 
$str 
: 
if 
( 
MovePossible $
($ %
representation% 3
,3 4
ref5 8
	tetromino9 B
,B C
offsetInBoardXD R
:R S
$numT U
,U V
offsetCollisionXW g
:g h
$numi j
)j k
)k l
	tetromino !
.! "
OffsetX" )
++) +
;+ ,
break 
; 
case 
$str 
: 
foreach 
( 
var  
offset! '
in( *
offsetsToTest+ 8
)8 9
{ 
if 
( 

_tetromino &
==' )
null* .
). /
{ 

_tetromino &
=' (
	tetromino) 2
;2 3
} 
var   
testTetromino   )
=  * +
(  , -
TetrominoFigure  - <
)  < =
abstractFactory  = L
.  L M
GetTetromino  M Y
(  Y Z

_tetromino  Z d
.  d e
OffsetX  e l
,  l m

_tetromino  n x
.  x y
OffsetY	  y Ä
,
  Ä Å

_tetromino
  Ç å
.
  å ç
Matrix
  ç ì
)
  ì î
;
  î ï
if!! 
(!! 
representation!! *
.!!* +
CheckTurnCollision!!+ =
(!!= >
testTetromino!!> K
,!!K L
	@operator!!M V
,!!V W
offset!!X ^
)!!^ _
)!!_ `
continue!!a i
;!!i j
	tetromino"" !
.""! "
OffsetX""" )
+=""* ,
offset""- 3
;""3 4
	tetromino## !
.##! "
Matrix##" (
=##) *
	@operator##+ 4
switch##5 ;
{$$ 
$str%%  
=>%%! #
	tetromino%%$ -
.%%- .
Matrix%%. 4
.%%4 5
Rotate90%%5 =
(%%= >
)%%> ?
,%%? @
_&& 
=>&&  
throw&&! &
new&&' *'
ArgumentOutOfRangeException&&+ F
(&&F G
nameof&&G M
(&&M N
	@operator&&N W
)&&W X
,&&X Y
	@operator&&Z c
,&&c d
null&&e i
)&&i j
}'' 
;'' 
break(( 
;(( 
})) 
break** 
;** 
case++ 
$str++ 
:++ 
foreach,, 
(,, 
var,,  
offset,,! '
in,,( *
offsetsToTest,,+ 8
),,8 9
{-- 
if.. 
(.. 

_tetromino.. &
==..' )
null..* .
)... /
{// 

_tetromino00 &
=00' (
	tetromino00) 2
;002 3
}11 
var22 
testTetromino22 )
=22* +
(22, -
TetrominoFigure22- <
)22< =
abstractFactory22= L
.22L M
GetTetromino22M Y
(22Y Z

_tetromino22Z d
.22d e
OffsetX22e l
,22l m

_tetromino22n x
.22x y
OffsetY	22y Ä
,
22Ä Å

_tetromino
22Ç å
.
22å ç
Matrix
22ç ì
)
22ì î
;
22î ï
if33 
(33 
representation33 *
.33* +
CheckTurnCollision33+ =
(33= >
testTetromino33> K
,33K L
	@operator33M V
,33V W
offset33X ^
)33^ _
)33_ `
continue33a i
;33i j
	tetromino44 !
.44! "
OffsetX44" )
+=44* ,
offset44- 3
;443 4
	tetromino55 !
.55! "
Matrix55" (
=55) *
	@operator55+ 4
switch555 ;
{66 
$str77 "
=>77# %
	tetromino77& /
.77/ 0
Matrix770 6
.776 7$
Rotate90CounterClockwise777 O
(77O P
)77P Q
,77Q R
_88 
=>88  
throw88! &
new88' *'
ArgumentOutOfRangeException88+ F
(88F G
nameof88G M
(88M N
	@operator88N W
)88W X
,88X Y
	@operator88Z c
,88c d
null88e i
)88i j
}99 
;99 
break:: 
;:: 
};; 
break<< 
;<< 
case== 
$str== 
:==  
while>> 
(>> 
SoftDrop>> #
(>># $
representation>>$ 2
,>>2 3
ref>>4 7
	tetromino>>8 A
)>>A B
)>>B C
{?? 
}AA 
breakBB 
;BB 
caseCC 
$strCC  
:CC  !
ICollectionDD 
<DD  
intDD  #
>DD# $
temp2DD% *
=DD+ ,
newDD- 0
ListDD1 5
<DD5 6
intDD6 9
>DD9 :
(DD: ;
)DD; <
;DD< =
forEE 
(EE 
intEE 
iEE 
=EE  
$numEE! #
;EE# $
iEE% &
>EE' (
$numEE) +
-EE, -
removeEE. 4
;EE4 5
iEE6 7
--EE7 9
)EE9 :
{FF 
temp2GG 
.GG 
AddGG !
(GG! "
iGG" #
)GG# $
;GG$ %
}HH 
representationII "
.II" #
	DeleteRowII# ,
(II, -
temp2II- 2
)II2 3
;II3 4
breakJJ 
;JJ 
}KK 

_tetrominoMM 
=MM 
	tetrominoMM "
;MM" #
_representationNN 
=NN 
representationNN ,
;NN, -
}OO 	
privatePP 
boolPP 
SoftDropPP 
(PP 
RepresentationPP ,
representationPP- ;
,PP; <
refPP= @
TetrominoFigurePPA P
	tetrominoPPQ Z
)PPZ [
{QQ 	
ifRR 
(RR 
!RR 
MovePossibleRR 
(RR 
representationRR ,
,RR, -
refRR. 1
	tetrominoRR2 ;
,RR; <
offsetInBoardXRR= K
:RRK L
$numRRM N
,RRN O
offsetInBoardYRRP ^
:RR^ _
$numRR` a
,RRa b
offsetCollisionYRRc s
:RRs t
$numRRu v
)RRv w
)RRw x
returnRRy 
false
RRÄ Ö
;
RRÖ Ü
	tetrominoSS 
.SS 
OffsetYSS 
++SS 
;SS  
returnTT 
trueTT 
;TT 
}UU 	
privateVV 
boolVV 
MovePossibleVV !
(VV! "
RepresentationVV" 0
representationVV1 ?
,VV? @
refVVA D
TetrominoFigureVVE T
	tetrominoVVU ^
,VV^ _
intVV` c
offsetInBoardXVVd r
=VVs t
$numVVu v
,VVv w
intVVx {
offsetInBoardY	VV| ä
=
VVã å
$num
VVç é
,
VVé è
int
VVê ì
offsetCollisionX
VVî §
=
VV• ¶
$num
VVß ®
,
VV® ©
intWW 
offsetCollisionYWW 
=WW 
$numWW 
)WW 
{XX 	
returnYY 
representationYY !
.YY! "
IsInRangeOfBoardYY" 2
(YY2 3
	tetrominoYY3 <
,YY< =
offsetInBoardXYY> L
,YYL M
offsetInBoardYYYN \
)YY\ ]
&&ZZ 
!ZZ 
representationZZ %
.ZZ% &
CheckCollisionZZ& 4
(ZZ4 5
	tetrominoZZ5 >
,ZZ> ?
offsetCollisionXZZ@ P
,ZZP Q
offsetCollisionYZZR b
)ZZb c
;ZZc d
}[[ 	
public]] 
TetrominoFigure]] 
	GetFigure]] (
(]]( )
)]]) *
{^^ 	
return__ 

_tetromino__ 
;__ 
}`` 	
publicaa 
Representationaa 
GetRepresentationaa /
(aa/ 0
)aa0 1
{bb 	
returncc 
_representationcc "
;cc" #
}dd 	
}ee 
}ff Ú"
dC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Command\User.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Command! (
{ 
public 

class 
User 
{		 
Receiver

 
	_receiver

 
=

 
new

  
Receiver

! )
(

) *
)

* +
;

+ ,
List 
< 
Command 
> 
	_commands 
=  !
new" %
List& *
<* +
Command+ 2
>2 3
(3 4
)4 5
;5 6
int 
_current 
; 
public 
void 
Undo 
( 
int 
levels #
)# $
{ 	
Console 
. 
	WriteLine 
( 
$str 7
,7 8
levels9 ?
)? @
;@ A
for 
( 
int 
i 
= 
$num 
; 
i 
< 
levels  &
;& '
i( )
++) +
)+ ,
{ 
if 
( 
_current 
> 
$num  
)  !
{ 
Command 
command #
=$ %
	_commands& /
[/ 0
--0 2
_current2 :
]: ;
;; <
command 
. 
	UnExecute %
(% &
)& '
;' (
} 
} 
} 	
public 
void 
Compute 
( 
string "
	@operator# ,
,, -
TetrominoFigure. =
operand> E
,E F
RepresentationG U
representationV d
,d e
AbstractFactoryf u
abstractFactory	v Ö
,
Ö Ü
int
á ä

removeLine
ã ï
)
ï ñ
{ 	
Command   
command   
=   
new   !
ConcreteCommand  " 1
(  1 2
	_receiver  2 ;
,  ; <
	@operator  = F
,  F G
operand  H O
,  O P
representation  Q _
,  _ `
abstractFactory  a p
,  p q

removeLine  r |
)  | }
;  } ~
command!! 
.!! 
Execute!! 
(!! 
)!! 
;!! 
	_commands## 
.## 
Insert## 
(## 
_current## %
,##% &
command##& -
)##- .
;##. /
_current$$ 
++$$ 
;$$ 
}%% 	
public'' 
TetrominoFigure'' 
GetTetraminoFigure'' 1
(''1 2
TetrominoFigure''2 A
	tetramino''B K
)''K L
{(( 	
if)) 
()) 
_current)) 
!=)) 
$num)) 
&&)) 
	_commands))  )
.))) *
Count))* /
>))0 1
$num))2 3
)))3 4
{** 
Command++ 
command++ 
=++  !
	_commands++" +
[+++ ,
_current++, 4
-++4 5
$num++5 6
]++6 7
;++7 8
return,, 
command,, 
.,, 
GetTetrominoFigure,, 1
(,,1 2
),,2 3
;,,3 4
}-- 
return.. 
	tetramino.. 
;.. 
}// 	
public00 
Representation00 
GetRepresentation00 /
(00/ 0
Representation000 >
representation00? M
)00M N
{11 	
if22 
(22 
_current22 
!=22 
$num22 
&&22  
	_commands22! *
.22* +
Count22+ 0
>221 2
$num223 4
)224 5
{33 
Command44 
command44 
=44  !
	_commands44" +
[44+ ,
_current44, 4
-444 5
$num445 6
]446 7
;447 8
return55 
command55 
.55 
GetRepresentation55 0
(550 1
)551 2
;552 3
}66 
return77 
representation77 !
;77! "
}88 	
}99 
}:: Ë	
|C:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Decorator\ConcreteTetrominoComponent.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Decorator! *
{ 
public 

class &
ConcreteTetrominoComponent +
:+ ,
TetrominoComponent- ?
{ 
public 
override 

Dictionary "
<" #
char# '
,' (
Matrix) /
>/ 0
GetTetrominos1 >
(> ?
)? @
{		 	
return

 
new

 

Dictionary

 !
<

! "
char

" &
,

& '
Matrix

( .
>

. /
{

/ 0
{

0 1
$char

2 5
,

5 6
new

7 :
Matrix

; A
(

A B
new

B E
[

E F
,

F G
]

G H
{

I J
{

K L
$num

M N
,

N O
$num

P Q
}

R S
,

S T
{

U V
$num

W X
,

X Y
$num

Z [
}

\ ]
}

^ _
)

_ `
}

a b
}

b c
;

c d
} 	
} 
} ‰
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Decorator\Decorator.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Decorator! *
{ 
public 

class 
	Decorator 
: 
TetrominoComponent /
{ 
private 
TetrominoComponent "

_component# -
;- .
public

 
	Decorator

 
(

 
TetrominoComponent

 +
	component

, 5
)

5 6
{ 	
this 
. 

_component 
= 
	component '
;' (
} 	
public 
override 

Dictionary "
<" #
char# '
,' (
Matrix) /
>/ 0
GetTetrominos1 >
(> ?
)? @
{ 	
return 

_component 
. 
GetTetrominos +
(+ ,
), -
;- .
} 	
} 
} „
tC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Decorator\TetrominoComponent.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Decorator! *
{ 
public 

abstract 
class 
TetrominoComponent ,
{ 
public 
abstract 

Dictionary "
<" #
char# '
,' (
Matrix) /
>/ 0
GetTetrominos1 >
(> ?
)? @
;@ A
} 
} ˘
zC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Decorator\TetrominoDecoratorLevel1.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Decorator! *
{ 
public 

class $
TetrominoDecoratorLevel1 )
:* +
	Decorator, 5
{ 
public 
override 

Dictionary "
<" #
char# '
,' (
Matrix) /
>/ 0
GetTetrominos1 >
(> ?
)? @
{		 	
var

 
	tetromino

 
=

 
base

  
.

  !
GetTetrominos

! .
(

. /
)

/ 0
;

0 1
	tetromino 
. 
Add 
( 
$char 
, 
new "
Matrix# )
() *
new* -
[- .
,. /
]/ 0
{1 2
{3 4
$num5 6
,6 7
$num8 9
,9 :
$num; <
,< =
$num> ?
}@ A
,A B
{C D
$numE F
,F G
$numH I
,I J
$numK L
,L M
$numN O
}P Q
,Q R
{S T
$numU V
,V W
$numX Y
,Y Z
$num[ \
,\ ]
$num^ _
}` a
,a b
{c d
$nume f
,f g
$numh i
,i j
$numk l
,l m
$numn o
}p q
}r s
)s t
)t u
;u v
return 
	tetromino 
; 
} 	
public $
TetrominoDecoratorLevel1 '
(' (
TetrominoComponent( :
c; <
)< =
:> ?
base@ D
(D E
cE F
)F G
{ 	
} 	
} 
} Ù
zC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Decorator\TetrominoDecoratorLevel2.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Decorator! *
{ 
public 

class $
TetrominoDecoratorLevel2 )
:) *
	Decorator+ 4
{ 
public 
override 

Dictionary "
<" #
char# '
,' (
Matrix) /
>/ 0
GetTetrominos1 >
(> ?
)? @
{		 	
var

 
	tetromino

 
=

 
base

  
.

  !
GetTetrominos

! .
(

. /
)

/ 0
;

0 1
	tetromino 
. 
Add 
( 
$char 
, 
new "
Matrix# )
() *
new* -
[- .
,. /
]/ 0
{1 2
{3 4
$num5 6
,6 7
$num8 9
,9 :
$num; <
}= >
,> ?
{@ A
$numB C
,C D
$numE F
,F G
$numH I
}J K
,K L
{M N
$numO P
,P Q
$numR S
,S T
$numU V
}W X
}Y Z
)Z [
)[ \
;\ ]
return 
	tetromino 
; 
} 	
public $
TetrominoDecoratorLevel2 '
(' (
TetrominoComponent( :
c; <
)< =
:> ?
base@ D
(D E
cE F
)F G
{ 	
} 	
} 
} ê
eC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Facade\Facade.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Facade! '
{ 
public 

class 
Facade 
{ 
	protected		 
Bombs		 
Bombs		 
;		 
	protected

 
Representation

  
Representation

! /
;

/ 0
	protected 
TetrominoFigure !
	Tetromino" +
;+ ,
public 
Facade 
( 
Representation $
representation% 3
)3 4
{ 	
this 
. 
Representation 
=  !
representation" 0
;0 1
} 	
public 
Facade 
( 
Bombs 
bombs !
)! "
{ 	
this 
. 
Bombs 
= 
bombs 
; 
} 	
public 
Bombs 
GetBomb 
( 
) 
{ 	
return 
Bombs 
; 
} 	
public 
Representation 
GetRepresentation /
(/ 0
)0 1
{ 	
return 
Representation !
;! "
} 	
public 
void 
PutTetromino  
(  !
TetrominoFigure! 0
	tetromino1 :
): ;
{ 	
Representation 
. 
PutTetrominoInBoard .
(. /
	tetromino/ 8
)8 9
;9 :
}   	
public!! 
string!! 
EnableBombPic!! #
(!!# $
)!!$ %
{"" 	
return## 
Bombs## 
.## 
GetImageEnabled## (
(##( )
)##) *
;##* +
}$$ 	
public&& 
string&& 
DisableBombPic&& $
(&&$ %
)&&% &
{'' 	
return(( 
Bombs(( 
.(( 
GetImageDisabled(( )
((() *
)((* +
;((+ ,
})) 	
}** 
}++ ÷

kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Facade\FacadeClient.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Facade! '
{ 
public 

class 
FacadeClient 
{ 
public 
static 
string 
ClientEnableBomb -
(- .
Facade. 4
facade5 ;
); <
{		 	
return

 
facade

 
.

 
EnableBombPic

 '
(

' (
)

( )
;

) *
} 	
public 
static 
string 
ClientDisableBomb .
(. /
Facade/ 5
facade6 <
)< =
{ 	
return 
facade 
. 
DisableBombPic (
(( )
)) *
;* +
} 	
public 
static 
void 
PutTetromino '
(' (
Facade( .
facade/ 5
,5 6
TetrominoFigure7 F
	tetrominoG P
)P Q
{ 	
facade 
. 
PutTetromino 
(  
	tetromino  )
)) *
;* +
} 	
} 
} ™
oC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\AbstractFactory.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public 

abstract 
class 
AbstractFactory )
{ 
	protected 
Director 
Director #
=$ %
new& )
Director* 2
(2 3
)3 4
;4 5
public		 
abstract		 
Unit		 
GetTetromino		 )
(		) *
int		* -
offsetX		. 5
,		5 6
int		7 :
offsetY		; B
,		B C
Random		D J
random		K Q
)		Q R
;		R S
public

 
abstract

 
Unit

 
GetTetromino

 )
(

) *
int

* -
offsetX

. 5
,

5 6
int

7 :
offsetY

; B
)

B C
;

C D
public 
abstract 
Unit 
GetTetromino )
() *
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
MatrixD J
matrixK Q
)Q R
;R S
public 
abstract 
Unit 
GetBomb $
($ %
)% &
;& '
public 
abstract 
Unit 
GetEvilBomb (
(( )
)) *
;* +
} 
} ≤
gC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\Creator.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public 

abstract 
class 
Creator !
{ 
public 
abstract 
Level 
. 
Level #
GetLevel$ ,
(, -
int- 0
level1 6
)6 7
;7 8
} 
} ˝
mC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\Level1Factory.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public		 

class		 
Level1Factory		 
:		  
LevelTemplate		! .
{

 
private 
TetrominoComponent "

_component# -
=. /
new0 3$
TetrominoDecoratorLevel14 L
(L M
newM P&
ConcreteTetrominoComponentQ k
(k l
)l m
)m n
;n o
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
,G H
RandomI O
randomP V
)V W
{ 	
return 
new 
TetrominoLevel1 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;
random< B
,B C

_componentD N
)N O
;O P
} 	
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
,G H
MatrixI O
matrixP V
)V W
{ 	
return 
new 
TetrominoLevel1 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;
matrix< B
,B C

_componentD N
)N O
;O P
} 	
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
)G H
{ 	
return 
new 
TetrominoLevel1 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;

_component< F
)F G
;G H
} 	
public 
override 
Unit 
GetLevelBomb )
() *
)* +
{ 	
return 
new 

BombLevel1 !
(! "
)" #
;# $
} 	
public!! 
override!! 
Unit!! 
GetLevelEvilBomb!! -
(!!- .
)!!. /
{"" 	
return## 
new## 
EvilBombLevel1## %
(##% &
)##& '
;##' (
}$$ 	
}%% 
}&& “
mC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\Level2Factory.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public		 

class		 
Level2Factory		 
:		  
LevelTemplate		! .
{

 
private 
TetrominoComponent "

_component# -
=. /
new $
TetrominoDecoratorLevel2 (
(( )
new) ,$
TetrominoDecoratorLevel1- E
(E F
newF I&
ConcreteTetrominoComponentJ d
(d e
)e f
)f g
)g h
;h i
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
,G H
RandomI O
randomP V
)V W
{ 	
return 
new 
TetrominoLevel2 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;
random< B
,B C

_componentD N
)N O
;O P
} 	
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
,G H
MatrixI O
matrixP V
)V W
{ 	
return 
new 
TetrominoLevel2 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;
matrix< B
,B C

_componentD N
)N O
;O P
} 	
public 
override 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
)G H
{ 	
return 
new 
TetrominoLevel2 &
(& '
$num' (
,( )
offsetX* 1
,1 2
offsetY3 :
,: ;

_component< F
)F G
;G H
} 	
public 
override 
Unit 
GetLevelBomb )
() *
)* +
{ 	
return 
new 

BombLevel2 !
(! "
)" #
;# $
}   	
public"" 
override"" 
Unit"" 
GetLevelEvilBomb"" -
(""- .
)"". /
{## 	
return$$ 
new$$ 
EvilBombLevel2$$ %
($$% &
)$$& '
;$$' (
}%% 	
}&& 
}'' ó
lC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\LevelCreator.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public 

class 
LevelCreator 
: 
Creator  '
{ 
public 
override 
Level 
. 
Level #
GetLevel$ ,
(, -
int- 0
level1 6
)6 7
{		 	
return

 
level

 
switch

 
{ 
$num 
=> 
new 
Level1 
(  
)  !
,! "
_ 
=> 
new 
Level2 
(  
)  !
} 
; 
} 	
} 
} î
dC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Factory\Unit.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Factory! (
{ 
public 

abstract 
class 
Unit 
:  
Observer! )
,) *

ICloneable+ 5
{		 
private

 
int

 
_level

 
;

 
private 
AbstractStrategy  
_abstractStrategy! 2
;2 3
	protected 
Unit 
( 
int 
level  
)  !
{ 	
this 
. 
_level 
= 
level 
;  
} 	
public 
object 
Clone 
( 
) 
{ 	
return 
( 
Unit 
) 
this 
. 
MemberwiseClone -
(- .
). /
;/ 0
} 	
[ 	#
ExcludeFromCodeCoverage	  
]  !
public 
AbstractStrategy 
GetStrategy  +
(+ ,
), -
{ 	
return 
_abstractStrategy $
;$ %
} 	
public 
void 
SetStrategy 
(  
AbstractStrategy  0
abstractStrategy1 A
)A B
{ 	
this 
. 
_abstractStrategy "
=# $
abstractStrategy% 5
;5 6
}   	
public"" 
void"" 
Action"" 
("" 
)"" 
{## 	
this$$ 
.$$ 
_abstractStrategy$$ "
.$$" #
MoveDifferently$$# 2
($$2 3
)$$3 4
;$$4 5
string%% 

actionName%% 
=%% 
$str%%  =
;%%= >
if'' 
('' 
this'' 
.'' 
Subject'' 
!='' 
null''  $
)''$ %
{(( 
this)) 
.)) 
Subject)) 
.)) 
ReceiveMessage)) +
())+ ,

actionName)), 6
)))6 7
;))7 8
}** 
}++ 	
public-- 
override-- 
void-- 
Update-- #
(--# $
string--$ *
command--+ 2
)--2 3
{.. 	
Console// 
.// 
	WriteLine// 
(// 
$str// ;
)//; <
;//< =
}00 	
}11 
}22 ¯
cC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Level\Level.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Level! &
{ 
public 

abstract 
class 
Level 
{ 
public 
abstract 
AbstractFactory '
GetAbstractFactory( :
(: ;
); <
;< =
}		 
}

 Ç
dC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Level\Level1.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Level! &
{ 
public 

class 
Level1 
: 
Level 
{ 
public 
override 
AbstractFactory '
GetAbstractFactory( :
(: ;
); <
{		 	
return

 
new

 
Level1Factory

 $
(

$ %
)

% &
;

& '
} 	
} 
} Ç
dC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Level\Level2.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Level! &
{ 
public 

class 
Level2 
: 
Level 
{ 
public 
override 
AbstractFactory '
GetAbstractFactory( :
(: ;
); <
{		 	
return

 
new

 
Level2Factory

 $
(

$ %
)

% &
;

& '
} 	
} 
} à 
^C:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Matrix.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
{ 
public		 

readonly		 
struct		 
Matrix		 !
{

 
private 
delegate 
int 
RotationMethod +
(+ ,
int, /
[/ 0
,0 1
]1 2
value3 8
,8 9
int: =
size> B
,B C
intD G
iH I
,I J
intK N
jO P
)P Q
;Q R
public 
int 
[ 
, 
] 
Value 
{ 
get !
;! "
}# $
public 
Matrix 
( 
int 
[ 
, 
] 
value "
)" #
{ 	
if   
(   
value   
.   
	GetLength   
(    
$num    !
)  ! "
!=  # %
value  & +
.  + ,
	GetLength  , 5
(  5 6
$num  6 7
)  7 8
)  8 9
{!! 
throw$$ 
new$$ 
ArgumentException$$ +
($$+ ,
$str$$, q
)$$q r
;$$r s
}%% 
Value'' 
='' 
value'' 
;'' 
}(( 	
[<< 	
Pure<<	 
]<< 
public== 
Matrix== 
Rotate90== 
(== 
)==  
=>==! #
Rotate==$ *
(==* +
(==+ ,
value==, 1
,==1 2
size==3 7
,==7 8
i==9 :
,==: ;
j==< =
)=== >
=>==? A
value==B G
[==G H
size==H L
-==M N
$num==O P
-==Q R
j==S T
,==T U
i==V W
]==W X
)==X Y
;==Y Z
[QQ 	
PureQQ	 
]QQ 
publicRR 
MatrixRR $
Rotate90CounterClockwiseRR .
(RR. /
)RR/ 0
=>RR1 3
RotateRR4 :
(RR: ;
(RR; <
valueRR< A
,RRA B
sizeRRC G
,RRG H
iRRI J
,RRJ K
jRRL M
)RRM N
=>RRO Q
valueRRR W
[RRW X
jRRX Y
,RRY Z
sizeRR[ _
-RR` a
$numRRb c
-RRd e
iRRf g
]RRg h
)RRh i
;RRi j
[YY 	
PureYY	 
]YY 
privateZZ 
MatrixZZ 
RotateZZ 
(ZZ 
RotationMethodZZ ,
rotationMethodZZ- ;
)ZZ; <
{[[ 	
var\\ 
size\\ 
=\\ 
Value\\ 
.\\ 
	GetLength\\ &
(\\& '
$num\\' (
)\\( )
;\\) *
var]] 
rotatedValue]] 
=]] 
new]] "
int]]# &
[]]& '
size]]' +
,]]+ ,
size]]- 1
]]]1 2
;]]2 3
for^^ 
(^^ 
var^^ 
i^^ 
=^^ 
$num^^ 
;^^ 
i^^ 
<^^ 
size^^  $
;^^$ %
i^^& '
++^^' )
)^^) *
for__ 
(__ 
var__ 
j__ 
=__ 
$num__ 
;__ 
j__ 
<__ 
size__  $
;__$ %
j__& '
++__' )
)__) *
rotatedValue`` 
[`` 
i`` 
,`` 
j``  !
]``! "
=``# $
rotationMethod``% 3
.``3 4
Invoke``4 :
(``: ;
Value``; @
,``@ A
size``B F
,``F G
i``H I
,``I J
j``K L
)``L M
;``M N
returnbb 
newbb 
Matrixbb 
(bb 
rotatedValuebb *
)bb* +
;bb+ ,
}cc 	
}dd 
}ee ª"
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Observers\ConcreteSubject.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Observers! *
{ 
public 

class 
ConcreteSubject  
:! "
Subject# *
{ 
private		 
	Singleton		 
.		 
	Singleton		 #

_singleton		$ .
=		/ 0
	Singleton		1 :
.		: ;
	Singleton		; D
.		D E
GetInstance		E P
(		P Q
)		Q R
;		R S
private

 
TetrisEngine

 
_engine

 $
;

$ %
public 
ConcreteSubject 
( 
TetrisEngine +
engine, 2
)2 3
{ 	
this 
. 
_engine 
= 
engine !
;! "
} 	
public 
override 
void 
Send !
(! "
string" (
command) 0
)0 1
{ 	
foreach 
( 
Observer 
observer &
in' )
List* .
). /
{ 
observer 
. 
Update 
(  
command  '
)' (
;( )
} 
} 	
public 
override 
void 
ReceiveMessage +
(+ ,
string, 2
message3 :
): ;
{ 	
Task 
. 
Run 
( 
async 
( 
) 
=>  
await 

_singleton  
.  !
GetConnection! .
(. /
)/ 0
.0 1
InvokeAsync1 <
(< =
$str= H
,H I
JsonConvertJ U
.U V
SerializeObjectV e
(e f
_enginef m
.m n
Scoren s
)s t
)t u
)u v
;v w
Task 
. 
Run 
( 
async 
( 
) 
=>  
await 

_singleton  
.  !
GetConnection! .
(. /
)/ 0
.0 1
InvokeAsync1 <
(< =
$str= H
,H I
JsonConvertJ U
.U V
SerializeObjectV e
(e f
_enginef m
.m n
Representationn |
.| }
Board	} Ç
)
Ç É
)
É Ñ
)
Ñ Ö
;
Ö Ü
Task 
. 
Run 
( 
async 
( 
) 
=>  
await   

_singleton    
.    !
GetConnection  ! .
(  . /
)  / 0
.  0 1
InvokeAsync  1 <
(  < =
$str  = L
,  L M
JsonConvert  N Y
.  Y Z
SerializeObject  Z i
(  i j
_engine  j q
.  q r
	Tetromino  r {
)  { |
)  | }
)  } ~
;  ~ 
Task!! 
.!! 
Run!! 
(!! 
async!! 
(!! 
)!! 
=>!!  
await"" 

_singleton""  
.""  !
GetConnection""! .
("". /
)""/ 0
.""0 1
InvokeAsync""1 <
(""< =
$str""= M
,""M N
_engine""O V
.""V W
GameOver""W _
)""_ `
)""` a
;""a b
Task## 
.## 
Run## 
(## 
async## 
(## 
)## 
=>##  
await$$ 

_singleton$$  
.$$  !
GetConnection$$! .
($$. /
)$$/ 0
.$$0 1
InvokeAsync$$1 <
($$< =
$str$$= P
,$$P Q
JsonConvert$$R ]
.$$] ^
SerializeObject$$^ m
($$m n
_engine$$n u
.$$u v
NextTetromino	$$v É
)
$$É Ñ
)
$$Ñ Ö
)
$$Ö Ü
;
$$Ü á
this%% 
.%% 
Send%% 
(%% 
message%% 
)%% 
;%% 
}&& 	
}'' 
}(( À
jC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Observers\Observer.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Observers! *
{ 
public 

abstract 
class 
Observer "
{ 
	protected 
Subject 
Subject !
;! "
public 
abstract 
void 
Update #
(# $
string$ *
command+ 2
)2 3
;3 4
public

 
Subject

 

GetSubject

 !
(

! "
)

" #
{ 	
return 
this 
. 
Subject 
;  
} 	
public 
void 

SetSubject 
( 
Subject &
subject' .
). /
{ 	
this 
. 
Subject 
= 
subject "
;" #
} 	
} 
} °
iC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Observers\Subject.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Observers! *
{ 
public 

abstract 
class 
Subject !
{ 
public 
List 
< 
Observer 
> 
List "
=# $
new% (
List) -
<- .
Observer. 6
>6 7
(7 8
)8 9
;9 :
public

 
abstract

 
void

 
Send

 !
(

! "
string

" (
command

) 0
)

0 1
;

1 2
public 
abstract 
void 
ReceiveMessage +
(+ ,
string, 2
message3 :
): ;
;; <
public 
void 
	Subscribe 
( 
Observer &
observer' /
)/ 0
{ 	
List 
. 
Add 
( 
observer 
) 
; 
observer 
. 

SetSubject 
(  
this  $
)$ %
;% &
} 	
public 
void 
Unsubscribe 
(  
Observer  (
observer) 1
)1 2
{ 	
int 
index 
= 
List 
. 
IndexOf $
($ %
observer% -
)- .
;. /
List 
. 
RemoveAt 
( 
index 
)  
;  !
} 	
} 
} µ©
fC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Representation.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
{ 
public		 

class		 
Representation		 
{

 
public 
readonly 
int 
[ 
, 
] 
Board $
;$ %
public 
Representation 
( 
) 
=>  "
Board# (
=) *
GenerateEmptyBoard+ =
(= >
)> ?
;? @
private 
static 
int 
[ 
, 
] 
GenerateEmptyBoard 0
(0 1
)1 2
{ 	
return 
new 
[ 
, 
] 
{ 
{ 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num  !
,! "
$num# $
,$ %
$num& '
,' (
$num) *
,* +
$num, -
}- .
,. /
{ 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num  !
,! "
$num# $
,$ %
$num& '
,' (
$num) *
,* +
$num, -
}- .
,. /
{ 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num  !
,! "
$num# $
,$ %
$num& '
,' (
$num) *
,* +
$num, -
}- .
,. /
{ 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num 
, 
$num  !
,! "
$num# $
,$ %
$num& '
,' (
$num) *
,* +
$num, -
}- .
,. /
{   
$num   
,   
$num   
,   
$num   
,   
$num   
,   
$num   
,   
$num    !
,  ! "
$num  # $
,  $ %
$num  & '
,  ' (
$num  ) *
,  * +
$num  , -
}  - .
,  . /
{!! 
$num!! 
,!! 
$num!! 
,!! 
$num!! 
,!! 
$num!! 
,!! 
$num!! 
,!! 
$num!!  !
,!!! "
$num!!# $
,!!$ %
$num!!& '
,!!' (
$num!!) *
,!!* +
$num!!, -
}!!- .
,!!. /
{"" 
$num"" 
,"" 
$num"" 
,"" 
$num"" 
,"" 
$num"" 
,"" 
$num"" 
,"" 
$num""  !
,""! "
$num""# $
,""$ %
$num""& '
,""' (
$num"") *
,""* +
$num"", -
}""- .
,"". /
{## 
$num## 
,## 
$num## 
,## 
$num## 
,## 
$num## 
,## 
$num## 
,## 
$num##  !
,##! "
$num### $
,##$ %
$num##& '
,##' (
$num##) *
,##* +
$num##, -
}##- .
,##. /
{$$ 
$num$$ 
,$$ 
$num$$ 
,$$ 
$num$$ 
,$$ 
$num$$ 
,$$ 
$num$$ 
,$$ 
$num$$  !
,$$! "
$num$$# $
,$$$ %
$num$$& '
,$$' (
$num$$) *
,$$* +
$num$$, -
}$$- .
,$$. /
{%% 
$num%% 
,%% 
$num%% 
,%% 
$num%% 
,%% 
$num%% 
,%% 
$num%% 
,%% 
$num%%  !
,%%! "
$num%%# $
,%%$ %
$num%%& '
,%%' (
$num%%) *
,%%* +
$num%%, -
}%%- .
,%%. /
{&& 
$num&& 
,&& 
$num&& 
,&& 
$num&& 
,&& 
$num&& 
,&& 
$num&& 
,&& 
$num&&  !
,&&! "
$num&&# $
,&&$ %
$num&&& '
,&&' (
$num&&) *
,&&* +
$num&&, -
}&&- .
,&&. /
{'' 
$num'' 
,'' 
$num'' 
,'' 
$num'' 
,'' 
$num'' 
,'' 
$num'' 
,'' 
$num''  !
,''! "
$num''# $
,''$ %
$num''& '
,''' (
$num'') *
,''* +
$num'', -
}''- .
,''. /
{(( 
$num(( 
,(( 
$num(( 
,(( 
$num(( 
,(( 
$num(( 
,(( 
$num(( 
,(( 
$num((  !
,((! "
$num((# $
,(($ %
$num((& '
,((' (
$num(() *
,((* +
$num((, -
}((- .
,((. /
{)) 
$num)) 
,)) 
$num)) 
,)) 
$num)) 
,)) 
$num)) 
,)) 
$num)) 
,)) 
$num))  !
,))! "
$num))# $
,))$ %
$num))& '
,))' (
$num))) *
,))* +
$num)), -
}))- .
,)). /
{** 
$num** 
,** 
$num** 
,** 
$num** 
,** 
$num** 
,** 
$num** 
,** 
$num**  !
,**! "
$num**# $
,**$ %
$num**& '
,**' (
$num**) *
,*** +
$num**, -
}**- .
,**. /
{++ 
$num++ 
,++ 
$num++ 
,++ 
$num++ 
,++ 
$num++ 
,++ 
$num++ 
,++ 
$num++  !
,++! "
$num++# $
,++$ %
$num++& '
,++' (
$num++) *
,++* +
$num++, -
}++- .
},, 
;,, 
}-- 	
public77 
bool77 
IsInRangeOfBoard77 $
(77$ %
TetrominoFigure77% 4
	tetromino775 >
,77> ?
int77@ C
givenXOffset77D P
=77Q R
$num77S T
,77T U
int77V Y
givenYOffset77Z f
=77g h
$num77i j
)77j k
{88 	
for:: 
(:: 
var:: 
y:: 
=:: 
$num:: 
;:: 
y:: 
<:: 
	tetromino::  )
.::) *
Matrix::* 0
.::0 1
Value::1 6
.::6 7
	GetLength::7 @
(::@ A
$num::A B
)::B C
;::C D
y::E F
++::F H
)::H I
for;; 
(;; 
var;; 
x;; 
=;; 
$num;; 
;;; 
x;; 
<;; 
	tetromino;;  )
.;;) *
Matrix;;* 0
.;;0 1
Value;;1 6
.;;6 7
	GetLength;;7 @
(;;@ A
$num;;A B
);;B C
;;;C D
x;;E F
++;;F H
);;H I
{<< 
if>> 
(>> 
	tetromino>> 
.>> 
Matrix>> $
.>>$ %
Value>>% *
[>>* +
y>>+ ,
,>>, -
x>>. /
]>>/ 0
==>>1 3
$num>>4 5
)>>5 6
continue>>7 ?
;>>? @
var@@ 
yWithOffset@@ 
=@@  !
y@@" #
+@@$ %
	tetromino@@& /
.@@/ 0
OffsetY@@0 7
+@@8 9
givenYOffset@@: F
;@@F G
varAA 
xWithOffsetAA 
=AA  !
xAA" #
+AA$ %
	tetrominoAA& /
.AA/ 0
OffsetXAA0 7
+AA8 9
givenXOffsetAA: F
;AAF G
ifCC 
(CC 
yWithOffsetCC 
>CC  !
BoardCC" '
.CC' (
	GetLengthCC( 1
(CC1 2
$numCC2 3
)CC3 4
-CC5 6
$numCC7 8
)CC8 9
returnDD 
falseDD  
;DD  !
ifEE 
(EE 
xWithOffsetEE 
>EE  !
BoardEE" '
.EE' (
	GetLengthEE( 1
(EE1 2
$numEE2 3
)EE3 4
-EE5 6
$numEE7 8
||EE9 ;
xWithOffsetEE< G
<EEH I
$numEEJ K
)EEK L
returnEEM S
falseEET Y
;EEY Z
}FF 
returnGG 
trueGG 
;GG 
}HH 	
[RR 	#
ExcludeFromCodeCoverageRR	  
]RR  !
publicSS 
boolSS 
CheckCollisionSS "
(SS" #
TetrominoFigureSS# 2
	tetrominoSS3 <
,SS< =
intSS> A
givenXOffsetSSB N
=SSO P
$numSSQ R
,SSR S
intSST W
givenYOffsetSSX d
=SSe f
$numSSg h
)SSh i
{TT 	
varUU 
collidedUU 
=UU 
falseUU  
;UU  !
forVV 
(VV 
varVV 
yVV 
=VV 
$numVV 
;VV 
yVV 
<VV 
BoardVV  %
.VV% &
	GetLengthVV& /
(VV/ 0
$numVV0 1
)VV1 2
;VV2 3
yVV4 5
++VV5 7
)VV7 8
forWW 
(WW 
varWW 
xWW 
=WW 
$numWW 
;WW 
xWW 
<WW 
BoardWW  %
.WW% &
	GetLengthWW& /
(WW/ 0
$numWW0 1
)WW1 2
;WW2 3
xWW4 5
++WW5 7
)WW7 8
{XX 
ifYY 
(YY 
BoardYY 
[YY 
yYY 
,YY 
xYY 
]YY 
!=YY  "
$numYY# $
)YY$ %
	tetrominoZZ 
.ZZ 
CalculatePositionsZZ 0
(ZZ0 1
)ZZ1 2
.ZZ2 3
ForEachZZ3 :
(ZZ: ;

coordinateZZ; E
=>ZZF H
{[[ 
var\\ 
(\\ 

tetrominoY\\ '
,\\' (

tetrominoX\\) 3
)\\3 4
=\\5 6

coordinate\\7 A
;\\A B
if]] 
(]] 

tetrominoY]] &
==]]' )
y]]* +
-]], -
givenYOffset]]. :
&&]]; =

tetrominoX]]> H
==]]I K
x]]L M
-]]N O
givenXOffset]]P \
)]]\ ]
collided^^ $
=^^% &
true^^' +
;^^+ ,
}__ 
)__ 
;__ 
}`` 
returnaa 
collidedaa 
;aa 
}bb 	
publicll 
boolll 
CheckTurnCollisionll &
(ll& '
TetrominoFigurell' 6
testTetrominoll7 D
,llD E
stringllF L
typellM Q
,llQ R
intllS V
givenXOffsetllW c
=lld e
$numllf g
)llg h
{mm 	
ifnn 
(nn 
typenn 
isnn 
notnn 
$strnn  
andnn! $
notnn% (
$strnn) /
)nn0 1
returnnn2 8
falsenn9 >
;nn> ?
testTetrominopp 
.pp 
OffsetXpp !
+=pp" $
givenXOffsetpp% 1
;pp1 2
testTetrominoqq 
.qq 
Matrixqq  
=qq! "
typeqq# '
switchqq( .
{rr 
$strss 
=>ss 
testTetrominoss %
.ss% &
Matrixss& ,
.ss, -
Rotate90ss- 5
(ss5 6
)ss6 7
,ss7 8
$strtt 
=>tt 
testTetrominott '
.tt' (
Matrixtt( .
.tt. /$
Rotate90CounterClockwisett/ G
(ttG H
)ttH I
,ttI J
_uu 
=>uu 
throwuu 
newuu '
ArgumentOutOfRangeExceptionuu :
(uu: ;
nameofuu; A
(uuA B
typeuuB F
)uuF G
,uuG H
typeuuI M
,uuM N
nulluuO S
)uuS T
}vv 
;vv 
returnxx 
!xx 
IsInRangeOfBoardxx $
(xx$ %
testTetrominoxx% 2
)xx2 3
||xx4 6
CheckCollisionxx7 E
(xxE F
testTetrominoxxF S
)xxS T
;xxT U
}yy 	
public 
void 
PutTetrominoInBoard '
(' (
TetrominoFigure( 7
	tetromino8 A
)A B
{
ÄÄ 	
for
ÉÉ 
(
ÉÉ 
var
ÉÉ 
y
ÉÉ 
=
ÉÉ 
$num
ÉÉ 
;
ÉÉ 
y
ÉÉ 
<
ÉÉ 
	tetromino
ÉÉ  )
.
ÉÉ) *
Matrix
ÉÉ* 0
.
ÉÉ0 1
Value
ÉÉ1 6
.
ÉÉ6 7
	GetLength
ÉÉ7 @
(
ÉÉ@ A
$num
ÉÉA B
)
ÉÉB C
;
ÉÉC D
y
ÉÉE F
++
ÉÉF H
)
ÉÉH I
for
ÑÑ 
(
ÑÑ 
var
ÑÑ 
x
ÑÑ 
=
ÑÑ 
$num
ÑÑ 
;
ÑÑ 
x
ÑÑ  !
<
ÑÑ" #
	tetromino
ÑÑ$ -
.
ÑÑ- .
Matrix
ÑÑ. 4
.
ÑÑ4 5
Value
ÑÑ5 :
.
ÑÑ: ;
	GetLength
ÑÑ; D
(
ÑÑD E
$num
ÑÑE F
)
ÑÑF G
;
ÑÑG H
x
ÑÑI J
++
ÑÑJ L
)
ÑÑL M
{
ÖÖ 
if
áá 
(
áá 
	tetromino
áá !
.
áá! "
Matrix
áá" (
.
áá( )
Value
áá) .
[
áá. /
y
áá/ 0
,
áá0 1
x
áá2 3
]
áá3 4
==
áá5 7
$num
áá8 9
)
áá9 :
continue
áá; C
;
ááC D
Board
ää 
[
ää 
y
ää 
+
ää 
	tetromino
ää '
.
ää' (
OffsetY
ää( /
,
ää/ 0
x
ää1 2
+
ää3 4
	tetromino
ää5 >
.
ää> ?
OffsetX
ää? F
]
ääF G
=
ääH I
	tetromino
ääJ S
.
ääS T
Matrix
ääT Z
.
ääZ [
Value
ää[ `
[
ää` a
y
ääa b
,
ääb c
x
ääd e
]
ääe f
;
ääf g
}
ãã 
}
åå 	
[
íí 	%
ExcludeFromCodeCoverage
íí	  
]
íí  !
public
ìì 
int
ìì 
HandleRowDeletion
ìì $
(
ìì$ %
)
ìì% &
=>
ìì' )
DeleteFullRows
ìì* 8
(
ìì8 9
FullRows
ìì9 A
(
ììA B
)
ììB C
)
ììC D
;
ììD E
[
öö 	%
ExcludeFromCodeCoverage
öö	  
]
öö  !
private
õõ 
List
õõ 
<
õõ 
int
õõ 
>
õõ 
FullRows
õõ "
(
õõ" #
)
õõ# $
{
úú 	
var
ùù 
fullRows
ùù 
=
ùù 
new
ùù 
List
ùù #
<
ùù# $
int
ùù$ '
>
ùù' (
(
ùù( )
)
ùù) *
;
ùù* +
for
ûû 
(
ûû 
var
ûû 
yAxis
ûû 
=
ûû 
$num
ûû 
;
ûû 
yAxis
ûû  %
<
ûû& '
Board
ûû( -
.
ûû- .
	GetLength
ûû. 7
(
ûû7 8
$num
ûû8 9
)
ûû9 :
;
ûû: ;
yAxis
ûû< A
++
ûûA C
)
ûûC D
if
üü 
(
üü 
Range
üü 
(
üü 
$num
üü 
,
üü 
Board
üü "
.
üü" #
	GetLength
üü# ,
(
üü, -
$num
üü- .
)
üü. /
)
üü/ 0
.
üü0 1
Select
üü1 7
(
üü7 8
x
üü8 9
=>
üü: <
Board
üü= B
[
üüB C
yAxis
üüC H
,
üüH I
x
üüJ K
]
üüK L
)
üüL M
.
üüM N
ToList
üüN T
(
üüT U
)
üüU V
.
üüV W
FindAll
üüW ^
(
üü^ _
x
üü_ `
=>
üüa c
x
üüd e
>
üüf g
$num
üüh i
)
üüi j
.
üüj k
Count
üük p
==
üüq s
$num
üüt v
)
üüv w
fullRows
†† 
.
†† 
Add
††  
(
††  !
yAxis
††! &
)
††& '
;
††' (
return
°° 
fullRows
°° 
;
°° 
}
¢¢ 	
[
®® 	%
ExcludeFromCodeCoverage
®®	  
]
®®  !
private
©© 
int
©© 
DeleteFullRows
©© "
(
©©" #
ICollection
©©# .
<
©©. /
int
©©/ 2
>
©©2 3
fullRows
©©4 <
)
©©< =
{
™™ 	
var
´´ 
rowsDeleted
´´ 
=
´´ 
$num
´´ 
;
´´  
for
¨¨ 
(
¨¨ 
var
¨¨ 
y
¨¨ 
=
¨¨ 
$num
¨¨ 
;
¨¨ 
y
¨¨ 
<
¨¨ 
Board
¨¨  %
.
¨¨% &
	GetLength
¨¨& /
(
¨¨/ 0
$num
¨¨0 1
)
¨¨1 2
;
¨¨2 3
y
¨¨4 5
++
¨¨5 7
)
¨¨7 8
{
≠≠ 
if
ÆÆ 
(
ÆÆ 
!
ÆÆ 
fullRows
ÆÆ 
.
ÆÆ 
Contains
ÆÆ &
(
ÆÆ& '
y
ÆÆ' (
)
ÆÆ( )
)
ÆÆ) *
continue
ÆÆ+ 3
;
ÆÆ3 4
for
ØØ 
(
ØØ 
var
ØØ 
x
ØØ 
=
ØØ 
$num
ØØ 
;
ØØ 
x
ØØ  !
<
ØØ" #
Board
ØØ$ )
.
ØØ) *
	GetLength
ØØ* 3
(
ØØ3 4
$num
ØØ4 5
)
ØØ5 6
;
ØØ6 7
x
ØØ8 9
++
ØØ9 ;
)
ØØ; <
Board
∞∞ 
[
∞∞ 
y
∞∞ 
,
∞∞ 
x
∞∞ 
]
∞∞ 
=
∞∞  !
$num
∞∞" #
;
∞∞# $$
DropFloatingTetrominos
≤≤ &
(
≤≤& '
y
≤≤' (
)
≤≤( )
;
≤≤) *
rowsDeleted
≥≥ 
++
≥≥ 
;
≥≥ 
fullRows
¥¥ 
.
¥¥ 
Remove
¥¥ 
(
¥¥  
y
¥¥  !
)
¥¥! "
;
¥¥" #
}
µµ 
return
∑∑ 
rowsDeleted
∑∑ 
;
∑∑ 
}
∏∏ 	
public
∫∫ 
void
∫∫ 
	DeleteRow
∫∫ 
(
∫∫ 
ICollection
∫∫ )
<
∫∫) *
int
∫∫* -
>
∫∫- .
fullRows
∫∫/ 7
)
∫∫7 8
{
ªª 	
for
ºº 
(
ºº 
var
ºº 
y
ºº 
=
ºº 
$num
ºº 
;
ºº 
y
ºº 
<
ºº 
Board
ºº  %
.
ºº% &
	GetLength
ºº& /
(
ºº/ 0
$num
ºº0 1
)
ºº1 2
;
ºº2 3
y
ºº4 5
++
ºº5 7
)
ºº7 8
{
ΩΩ 
if
ææ 
(
ææ 
!
ææ 
fullRows
ææ 
.
ææ 
Contains
ææ &
(
ææ& '
y
ææ' (
)
ææ( )
)
ææ) *
continue
ææ+ 3
;
ææ3 4
for
øø 
(
øø 
var
øø 
x
øø 
=
øø 
$num
øø 
;
øø 
x
øø  !
<
øø" #
Board
øø$ )
.
øø) *
	GetLength
øø* 3
(
øø3 4
$num
øø4 5
)
øø5 6
;
øø6 7
x
øø8 9
++
øø9 ;
)
øø; <
Board
¿¿ 
[
¿¿ 
y
¿¿ 
,
¿¿ 
x
¿¿ 
]
¿¿ 
=
¿¿  !
$num
¿¿" #
;
¿¿# $$
DropFloatingTetrominos
¬¬ &
(
¬¬& '
y
¬¬' (
)
¬¬( )
;
¬¬) *
fullRows
√√ 
.
√√ 
Remove
√√ 
(
√√  
y
√√  !
)
√√! "
;
√√" #
}
ƒƒ 
}
≈≈ 	
private
ÀÀ 
void
ÀÀ $
DropFloatingTetrominos
ÀÀ +
(
ÀÀ+ ,
int
ÀÀ, /

deletedRow
ÀÀ0 :
)
ÀÀ: ;
{
ÃÃ 	
for
ÕÕ 
(
ÕÕ 
var
ÕÕ 
y
ÕÕ 
=
ÕÕ 

deletedRow
ÕÕ #
;
ÕÕ# $
y
ÕÕ% &
>
ÕÕ' (
$num
ÕÕ) *
;
ÕÕ* +
y
ÕÕ, -
--
ÕÕ- /
)
ÕÕ/ 0
for
ŒŒ 
(
ŒŒ 
var
ŒŒ 
x
ŒŒ 
=
ŒŒ 
$num
ŒŒ 
;
ŒŒ 
x
ŒŒ 
<
ŒŒ 
Board
ŒŒ  %
.
ŒŒ% &
	GetLength
ŒŒ& /
(
ŒŒ/ 0
$num
ŒŒ0 1
)
ŒŒ1 2
;
ŒŒ2 3
x
ŒŒ4 5
++
ŒŒ5 7
)
ŒŒ7 8
Board
œœ 
[
œœ 
y
œœ 
,
œœ 
x
œœ 
]
œœ 
=
œœ 
Board
œœ #
[
œœ# $
y
œœ$ %
-
œœ& '
$num
œœ( )
,
œœ) *
x
œœ+ ,
]
œœ, -
;
œœ- .
}
–– 	
}
—— 
}““ ≤
]C:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Score.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
{ 
public 

class 
Score 
{ 
private 
const 
int  
NumOfRowsForLeveling .
=/ 0
$num1 2
;2 3
public 
bool 
ForceLevelUpdate $
;$ %
public		 
int		 
Level		 
;		 
public 
int 
Points 
; 
public 
int 
Rows 
; 
private 
int 
_rowsForLeveling $
;$ %
public 
Score 
( 
) 
{ 	
Level 
= 
$num 
; 
Points 
= 
$num 
; 
Rows 
= 
$num 
; 
ForceLevelUpdate 
= 
false $
;$ %
} 	
public"" 
void"" 
HandleScore"" 
(""  
int""  #
rows""$ (
)""( )
{## 	
if$$ 
($$ 
rows$$ 
==$$ 
$num$$ 
)$$ 
return$$ !
;$$! "
var&& 

multiplier&& 
=&& 
rows&& !
switch&&" (
{'' 
$num(( 
=>(( 
$num(( 
,(( 
$num)) 
=>)) 
$num)) 
,)) 
$num** 
=>** 
$num** 
,** 
_++ 
=>++ 
$num++ 
,++ 
},, 
;,, 
Points.. 
+=.. 
Level.. 
*.. 

multiplier.. (
+..) *

multiplier..+ 5
;..5 6
Rows// 
+=// 
rows// 
;// 
_rowsForLeveling00 
+=00 
rows00  $
;00$ %
}11 	
public77 
bool77 
HandleLevel77 
(77  
)77  !
{88 	
if99 
(99 
ForceLevelUpdate99  
)99  !
{:: 
ForceLevelUpdate;;  
=;;! "
false;;# (
;;;( )
}<< 
else== 
if== 
(== 
_rowsForLeveling== %
<==& ' 
NumOfRowsForLeveling==( <
)==< =
return==> D
false==E J
;==J K
_rowsForLeveling?? 
=?? 
$num??  
;??  !
Level@@ 
++@@ 
;@@ 
returnAA 
trueAA 
;AA 
}BB 	
}CC 
}DD ¨
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Singleton\Singleton.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Singleton! *
{ 
public 

sealed 
class 
	Singleton !
{ 
private 
	Singleton 
( 
) 
{ 
} 
private		 
static		 
	Singleton		  
	_instance		! *
;		* +
private

 
static

 
HubConnection

 $
_connection

% 0
;

0 1
private 
const 
string 
Url  
=! "
$str# D
;D E
public 
static 
	Singleton 
GetInstance  +
(+ ,
), -
{ 	
if 
( 
	_instance 
== 
null !
)! "
{ 
	_instance 
= 
new 
	Singleton  )
() *
)* +
;+ ,
} 
return 
	_instance 
; 
} 	
public 
HubConnection 
GetConnection *
(* +
)+ ,
{ 	
if 
( 
_connection 
== 
null "
)" #
{ 
_connection 
= 
new ! 
HubConnectionBuilder" 6
(6 7
)7 8
. 
WithUrl 
( 
Url 
) 
. "
WithAutomaticReconnect '
(' (
)( )
. 
Build 
( 
) 
; 
} 
return 
_connection 
; 
}   	
}!! 
}"" ⁄)
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\AbstractStrategy.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

abstract 
class 
AbstractStrategy *
{ 
	protected 
AbstractFactory !
AbstractFactory" 1
;1 2
	protected		 
TetrominoFigure		 !
	Tetromino		" +
;		+ ,
	protected

 
Representation

  
Representation

! /
;

/ 0
public 
AbstractStrategy 
(  
AbstractFactory  /
abstractFactory0 ?
,? @
TetrominoFigureA P
	tetrominoQ Z
,Z [
Representation\ j
representationk y
)y z
{ 	
this 
. 
AbstractFactory  
=! "
abstractFactory# 2
;2 3
this 
. 
	Tetromino 
= 
	tetromino &
;& '
this 
. 
Representation 
=  !
representation" 0
;0 1
} 	
public 
abstract 
void 
MoveDifferently ,
(, -
)- .
;. /
public 
bool 
MovePossible  
(  !
int! $
offsetInBoardX% 3
=4 5
$num6 7
,7 8
int9 <
offsetInBoardY= K
=L M
$numN O
,O P
intQ T
offsetCollisionXU e
=f g
$numh i
,i j
int	 
offsetCollisionY 
= 
$num  !
)! "
{ 	
return 
Representation !
.! "
IsInRangeOfBoard" 2
(2 3
	Tetromino3 <
,< =
offsetInBoardX> L
,L M
offsetInBoardYN \
)\ ]
&&^ `
! 
Representation 
. 
CheckCollision ,
(, -
	Tetromino- 6
,6 7
offsetCollisionX8 H
,H I
offsetCollisionYJ Z
)Z [
;[ \
} 	
public 
bool 
CheckIfPossible #
(# $
)$ %
{ 	
if 
( 
! 
MovePossible 
( 
offsetInBoardX ,
:, -
$num. /
,/ 0
offsetInBoardY1 ?
:? @
$numA B
,B C
offsetCollisionYD T
:T U
$numV W
)W X
)X Y
returnZ `
falsea f
;f g
return   
true   
;   
}!! 	
public(( 
void(( 
HandleRotation(( "
(((" #
string((# )
type((* .
)((. /
{)) 	
if** 
(** 
type** 
is** 
not** 
$str**  
and**! $
not**% (
$str**) /
)**/ 0
return**1 7
;**7 8
var,, 
offsetsToTest,, 
=,, 
new,,  #
[,,# $
],,$ %
{,,& '
$num,,( )
,,,) *
$num,,+ ,
,,,, -
-,,. /
$num,,/ 0
,,,0 1
$num,,2 3
,,,3 4
-,,5 6
$num,,6 7
},,8 9
;,,9 :
foreach-- 
(-- 
var-- 
offset-- 
in--  "
offsetsToTest--# 0
)--0 1
{.. 
var// 
testTetromino// !
=//" #
(//$ %
TetrominoFigure//% 4
)//4 5
AbstractFactory//5 D
.//D E
GetTetromino//E Q
(//Q R
	Tetromino//R [
.//[ \
OffsetX//\ c
,//c d
	Tetromino//e n
.//n o
OffsetY//o v
,//v w
	Tetromino	//x Å
.
//Å Ç
Matrix
//Ç à
)
//à â
;
//â ä
if00 
(00 
Representation00 "
.00" #
CheckTurnCollision00# 5
(005 6
testTetromino006 C
,00C D
type00E I
,00I J
offset00K Q
)00Q R
)00R S
continue00T \
;00\ ]
	Tetromino11 
.11 
OffsetX11 !
+=11" $
offset11% +
;11+ ,
	Tetromino22 
.22 
Matrix22  
=22! "
type22# '
switch22( .
{33 
$str44 
=>44 
	Tetromino44 %
.44% &
Matrix44& ,
.44, -
Rotate9044- 5
(445 6
)446 7
,447 8
$str55 
=>55 
	Tetromino55 '
.55' (
Matrix55( .
.55. /$
Rotate90CounterClockwise55/ G
(55G H
)55H I
,55I J
_66 
=>66 
	Tetromino66 "
.66" #
Matrix66# )
}77 
;77 
break88 
;88 
}99 
}:: 	
};; 
}<< ◊	
iC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\HardDrop.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 
HardDrop 
: 
AbstractStrategy ,
{ 
public		 
HardDrop		 
(		 
AbstractFactory		 '
abstractFactory		( 7
,		7 8
TetrominoFigure		9 H
	tetromino		I R
,		R S
Representation		T b
representation		c q
)		q r
:

 
base

 
(

 
abstractFactory

 "
,

" #
	tetromino

$ -
,

- .
representation

/ =
)

= >
{ 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
while 
( 
CheckIfPossible "
(" #
)# $
)$ %
{ 
	Tetromino 
. 
OffsetY !
++! #
;# $
} 
} 	
} 
} ‹

iC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\MoveLeft.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 
MoveLeft 
: 
AbstractStrategy ,
{ 
public 
MoveLeft 
( 
AbstractFactory '
abstractFactory( 7
,7 8
TetrominoFigure9 H
	tetrominoI R
,R S
RepresentationT b
representationc q
)q r
:		 
base		 
(		 
abstractFactory		 "
,		" #
	tetromino		$ -
,		- .
representation		/ =
)		= >
{

 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
if 
( 
MovePossible 
( 
offsetInBoardX +
:+ ,
-- .
$num. /
,/ 0
offsetCollisionX1 A
:A B
-C D
$numD E
)E F
)F G
	Tetromino 
. 
OffsetX !
--! #
;# $
} 	
} 
} ¡

jC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\MoveRight.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 
	MoveRight 
: 
AbstractStrategy -
{ 
public		 
	MoveRight		 
(		 
AbstractFactory		 (
abstractFactory		) 8
,		8 9
TetrominoFigure		: I
	tetromino		J S
,		S T
Representation		U c
representation		d r
)		r s
:

 
base

 
(

 
abstractFactory

 "
,

" #
	tetromino

$ -
,

- .
representation

/ =
)

= >
{ 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
if 
( 
MovePossible 
( 
offsetInBoardX +
:+ ,
$num- .
,. /
offsetCollisionX0 @
:@ A
$numB C
)C D
)D E
	Tetromino 
. 
OffsetX !
++! #
;# $
} 	
} 
} ⁄
mC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\RotationDown.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 
RotationDown 
: 
AbstractStrategy  0
{ 
public		 
RotationDown		 
(		 
AbstractFactory		 +
abstractFactory		, ;
,		; <
TetrominoFigure		= L
	tetromino		M V
,		V W
Representation		X f
representation		g u
)		u v
:

 
base

 
(

 
abstractFactory

 "
,

" #
	tetromino

$ -
,

- .
representation

/ =
)

= >
{ 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
HandleRotation 
( 
$str !
)! "
;" #
} 	
} 
} ‘
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\RotationUp.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 

RotationUp 
: 
AbstractStrategy .
{ 
public		 

RotationUp		 
(		 
AbstractFactory		 )
abstractFactory		* 9
,		9 :
TetrominoFigure		; J
	tetromino		K T
,		T U
Representation		V d
representation		e s
)		s t
:

 
base

 
(

 
abstractFactory

 "
,

" #
	tetromino

$ -
,

- .
representation

/ =
)

= >
{ 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
HandleRotation 
( 
$str 
)  
;  !
} 	
} 
} ‘	
iC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Strategy\SoftDrop.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
Strategy! )
{ 
public 

class 
SoftDrop 
: 
AbstractStrategy ,
{ 
public		 
SoftDrop		 
(		 
AbstractFactory		 '
abstractFactory		( 7
,		7 8
TetrominoFigure		9 H
	tetromino		I R
,		R S
Representation		T b
representation		c q
)		q r
:

 
base

 
(

 
abstractFactory

 "
,

" #
	tetromino

$ -
,

- .
representation

/ =
)

= >
{ 	
} 	
public 
override 
void 
MoveDifferently ,
(, -
)- .
{ 	
if 
( 
CheckIfPossible 
(  
)  !
)! "
{ 
	Tetromino 
. 
OffsetY !
++! #
;# $
} 
} 	
} 
} È*
nC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\template\LevelTemplate.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
template! )
{ 
public 

abstract 
class 
LevelTemplate '
:( )
AbstractFactory* 9
{ 
public		 
abstract		 
Unit		 
GetLevelTetromino		 .
(		. /
int		/ 2
offsetX		3 :
,		: ;
int		< ?
offsetY		@ G
,		G H
Random		I O
random		P V
)		V W
;		W X
public

 
abstract

 
Unit

 
GetLevelTetromino

 .
(

. /
int

/ 2
offsetX

3 :
,

: ;
int

< ?
offsetY

@ G
,

G H
Matrix

I O
matrix

P V
)

V W
;

W X
public 
abstract 
Unit 
GetLevelTetromino .
(. /
int/ 2
offsetX3 :
,: ;
int< ?
offsetY@ G
)G H
;H I
public 
abstract 
Unit 
GetLevelBomb )
() *
)* +
;+ ,
public 
abstract 
Unit 
GetLevelEvilBomb -
(- .
). /
;/ 0
public 
override 
Unit 
GetTetromino )
() *
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
RandomD J
randomK Q
)Q R
{ 	
Unit 
rawUnit 
= 
GetLevelTetromino ,
(, -
offsetX- 4
,4 5
offsetY6 =
,= >
random? E
)E F
;F G
Builder 
. 
Builder 
builder #
=$ %
new& )
BuildTetromino* 8
(8 9
(9 :
Unit: >
)> ?
rawUnit? F
.F G
CloneG L
(L M
)M N
)N O
;O P
return 
this 
. 
Director  
.  !
GetLevel! )
() *
builder* 1
)1 2
;2 3
} 	
public 
override 
Unit 
GetTetromino )
() *
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
)B C
{ 	
Unit 
rawUnit 
= 
GetLevelTetromino ,
(, -
offsetX- 4
,4 5
offsetY6 =
)= >
;> ?
Builder 
. 
Builder 
builder #
=$ %
new& )
BuildTetromino* 8
(8 9
rawUnit9 @
)@ A
;A B
return 
this 
. 
Director  
.  !
GetLevel! )
() *
builder* 1
)1 2
;2 3
} 	
public 
override 
Unit 
GetTetromino )
() *
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
MatrixD J
matrixK Q
)Q R
{ 	
Unit 
rawUnit 
= 
GetLevelTetromino ,
(, -
offsetX- 4
,4 5
offsetY6 =
,= >
matrix? E
)E F
;F G
Builder   
.   
Builder   
builder   #
=  $ %
new  & )
BuildTetromino  * 8
(  8 9
rawUnit  9 @
)  @ A
;  A B
return!! 
this!! 
.!! 
Director!!  
.!!  !
GetLevel!!! )
(!!) *
builder!!* 1
)!!1 2
;!!2 3
}"" 	
public$$ 
override$$ 
Unit$$ 
GetBomb$$ $
($$$ %
)$$% &
{%% 	
Unit&& 
rawUnit&& 
=&& 
GetLevelBomb&& '
(&&' (
)&&( )
;&&) *
Builder'' 
.'' 
Builder'' 
builder'' #
=''$ %
new''& )
	BuildBomb''* 3
(''3 4
rawUnit''4 ;
)''; <
;''< =
return(( 
this(( 
.(( 
Director((  
.((  !
GetBomb((! (
(((( )
builder(() 0
)((0 1
;((1 2
})) 	
public++ 
override++ 
Unit++ 
GetEvilBomb++ (
(++( )
)++) *
{,, 	
Unit-- 
rawUnit-- 
=-- 
GetLevelEvilBomb-- +
(--+ ,
)--, -
;--- .
Builder.. 
... 
Builder.. 
builder.. #
=..$ %
new..& )
	BuildBomb..* 3
(..3 4
rawUnit..4 ;
)..; <
;..< =
return// 
this// 
.// 
Director//  
.//  !
GetBomb//! (
(//( )
builder//) 0
)//0 1
;//1 2
}00 	
}11 
}22 ‚ë
dC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\TetrisEngine.cs
	namespace

 	
TetrisClient


 
.

 
	gameLogic

  
{ 
public 

class 
TetrisEngine 
{ 
public 
Representation 
Representation ,
;, -
public 
TetrominoFigure 
	Tetromino (
;( )
public 
TetrominoFigure 
NextTetromino ,
;, -
public 
Score 
Score 
; 
public 
DispatcherTimer 
	GameTimer (
;( )
public 
bool 
GameOver 
; 
private 
Random 
_random 
; 
private 
User 
_user 
; 
private 
Level 
. 
Level 
_level "
;" #
private 
Creator 
_creator  
;  !
public 
AbstractFactory 
AbstractFactory .
;. /
public 
TetrisEngine 
( 
User  
user! %
,% &
LevelCreator' 3
creator4 ;
,; <
Representation= K
representationL Z
,Z [
Score\ a
scoreb g
)g h
{ 	
this 
. 
_user 
= 
user 
; 
this 
. 
_creator 
= 
creator #
;# $
this 
. 
Representation 
=  !
representation" 0
;0 1
this   
.   
Score   
=   
score   
;   
}!! 	
public## 
TetrisEngine## 
(## 
)## 
{$$ 	
this%% 
.%% 
_user%% 
=%% 
new%% 
User%% !
(%%! "
)%%" #
;%%# $
this&& 
.&& 
_creator&& 
=&& 
new&& 
LevelCreator&&  ,
(&&, -
)&&- .
;&&. /
this'' 
.'' 
Representation'' 
=''  !
new''" %
Representation''& 4
(''4 5
)''5 6
;''6 7
this(( 
.(( 
Score(( 
=(( 
new(( 
Score(( "
(((" #
)((# $
;(($ %
})) 	
public// 
void// 
	StartGame// 
(// 
int// !
?//! "
seed//# '
=//( )
null//* .
)//. /
{00 	
_level11 
=11 
_creator11 
.11 
GetLevel11 &
(11& '
$num11' (
)11( )
;11) *
AbstractFactory22 
=22 
_level22 $
.22$ %
GetAbstractFactory22% 7
(227 8
)228 9
;229 :
if33 
(33 
seed33 
!=33 
null33 
)33 
_random33 %
=33& '
new33( +
Random33, 2
(332 3
(333 4
int334 7
)337 8
seed338 <
)33< =
;33= >
GameOver44 
=44 
false44 
;44 
NextTetromino77 
=77 
_random77 #
==77$ &
null77' +
?77, -
(77. /
TetrominoFigure77/ >
)77> ?
AbstractFactory77? N
.77N O
GetTetromino77O [
(77[ \
$num77\ ]
,77] ^
$num77_ `
)77` a
:77b c
(77d e
TetrominoFigure77e t
)77t u
AbstractFactory	77u Ñ
.
77Ñ Ö
GetTetromino
77Ö ë
(
77ë í
$num
77í ì
,
77ì î
$num
77ï ñ
,
77ñ ó
_random
77ò ü
)
77ü †
;
77† °
Timer88 
(88 
)88 
;88 
NewTetromino99 
(99 
)99 
;99 
}:: 	
[<< 	#
ExcludeFromCodeCoverage<<	  
]<<  !
public== 
Bombs== 
GetBomb== 
(== 
)== 
{>> 	
return?? 
(?? 
Bombs?? 
)?? 
AbstractFactory?? )
.??) *
GetBomb??* 1
(??1 2
)??2 3
;??3 4
}@@ 	
[BB 	#
ExcludeFromCodeCoverageBB	  
]BB  !
publicCC 
BombsCC 
GetEvilBombCC  
(CC  !
)CC! "
{DD 	
returnEE 
(EE 
BombsEE 
)EE 
AbstractFactoryEE )
.EE) *
GetEvilBombEE* 5
(EE5 6
)EE6 7
;EE7 8
}FF 	
publicHH 
voidHH 
StopGameHH 
(HH 
)HH 
{II 	
	GameTimerJJ 
.JJ 
	IsEnabledJJ 
=JJ  !
falseJJ" '
;JJ' (
}KK 	
privateQQ 
voidQQ 
TimerQQ 
(QQ 
)QQ 
{RR 	
	GameTimerSS 
=SS 
newSS 
DispatcherTimerSS +
(SS+ ,
)SS, -
;SS- .
	GameTimerTT 
.TT 
TickTT 
+=TT  
dispatcherTimer_TickTT 2
;TT2 3
	GameTimerUU 
.UU 
IntervalUU 
=UU  
newUU! $
TimeSpanUU% -
(UU- .
$numUU. /
,UU/ 0
$numUU1 2
,UU2 3
$numUU4 5
,UU5 6
$numUU7 8
,UU8 9
$numUU: =
)UU= >
;UU> ?
	GameTimerVV 
.VV 
StartVV 
(VV 
)VV 
;VV 
}WW 	
[__ 	#
ExcludeFromCodeCoverage__	  
]__  !
private`` 
void``  
dispatcherTimer_Tick`` )
(``) *
object``* 0
sender``1 7
,``7 8
	EventArgs``9 B
e``C D
)``D E
{aa 	
ifbb 
(bb 
DropTetrominobb 
(bb 
)bb 
&&bb  "
!bb# $
Scorebb$ )
.bb) *
ForceLevelUpdatebb* :
)bb: ;
returnbb< B
;bbB C
ifcc 
(cc 
HandleScorecc 
(cc 
)cc 
)cc 
{dd 
_levelee 
=ee 
_creatoree !
.ee! "
GetLevelee" *
(ee* +
Scoreee+ 0
.ee0 1
Levelee1 6
)ee6 7
;ee7 8
AbstractFactoryff 
=ff  !
_levelff" (
.ff( )
GetAbstractFactoryff) ;
(ff; <
)ff< =
;ff= >
	GameTimergg 
.gg 
Intervalgg "
=gg# $
newgg% (
TimeSpangg) 1
(gg1 2
$numgg2 3
,gg3 4
$numgg5 6
,gg6 7
$numgg8 9
,gg9 :
$numgg; <
,gg< =
Convertgg> E
.ggE F
ToInt32ggF M
(ggM N
	GameTimerggN W
.ggW X
IntervalggX `
.gg` a
Millisecondsgga m
*ggn o
$numggp s
)ggs t
)ggt u
;ggu v
}hh 
NewTetrominojj 
(jj 
)jj 
;jj 
}kk 	
[ss 	#
ExcludeFromCodeCoveragess	  
]ss  !
privatett 
booltt 
DropTetrominott "
(tt" #
)tt# $
{uu 	
Facadevv 
.vv 
Facadevv 
facadevv  
=vv! "
newvv# &
Facadevv' -
.vv- .
Facadevv. 4
(vv4 5
Representationvv5 C
)vvC D
;vvD E
ifww 
(ww 
MovePossibleww 
(ww 
offsetInBoardYww +
:ww+ ,
$numww- .
,ww. /
offsetCollisionYww0 @
:ww@ A
$numwwB C
)wwC D
)wwD E
{xx 
	Tetrominoyy 
.yy 
OffsetYyy !
++yy! #
;yy# $
returnzz 
truezz 
;zz 
}{{ 
facade|| 
.|| 
PutTetromino|| 
(||  
	Tetromino||  )
)||) *
;||* +
return~~ 
false~~ 
;~~ 
} 	
[
ÅÅ 	%
ExcludeFromCodeCoverage
ÅÅ	  
]
ÅÅ  !
public
ÇÇ 
void
ÇÇ 
	AngelBomb
ÇÇ 
(
ÇÇ 
)
ÇÇ 
{
ÉÉ 	
Target
ÑÑ 
	angelBomb
ÑÑ 
=
ÑÑ 
new
ÑÑ "
Adapter
ÑÑ# *
.
ÑÑ* +
Adapter
ÑÑ+ 2
(
ÑÑ2 3
$str
ÑÑ3 :
,
ÑÑ: ;
Score
ÑÑ< A
.
ÑÑA B
Level
ÑÑB G
)
ÑÑG H
;
ÑÑH I
if
ÖÖ 
(
ÖÖ 
Score
ÖÖ 
.
ÖÖ 
Points
ÖÖ 
>=
ÖÖ 
	angelBomb
ÖÖ  )
.
ÖÖ) *(
GetInformationCurrentScore
ÖÖ* D
(
ÖÖD E
)
ÖÖE F
)
ÖÖF G
{
ÜÜ 
Score
áá 
.
áá 
Points
áá 
=
áá 
Score
áá $
.
áá$ %
Points
áá% +
-
áá, -
	angelBomb
áá. 7
.
áá7 8(
GetInformationCurrentScore
áá8 R
(
ááR S
)
ááS T
;
ááT U
_user
àà 
.
àà 
Compute
àà 
(
àà 
$str
àà )
,
àà) *
	Tetromino
àà+ 4
,
àà4 5
Representation
àà6 D
,
ààD E
AbstractFactory
ààF U
,
ààU V
	angelBomb
ààW `
.
àà` a)
GetInformationLinesToChange
ààa |
(
àà| }
)
àà} ~
)
àà~ 
;àà Ä
Representation
ââ 
=
ââ  
_user
ââ! &
.
ââ& '
GetRepresentation
ââ' 8
(
ââ8 9
Representation
ââ9 G
)
ââG H
;
ââH I
}
ää 
}
ãã 	
[
ìì 	%
ExcludeFromCodeCoverage
ìì	  
]
ìì  !
private
îî 
void
îî 
NewTetromino
îî !
(
îî! "
)
îî" #
{
ïï 	
	Tetromino
ññ 
=
ññ 
NextTetromino
ññ %
;
ññ% &
if
óó 
(
óó 
Representation
óó 
.
óó 
CheckCollision
óó -
(
óó- .
	Tetromino
óó. 7
)
óó7 8
)
óó8 9
{
òò 
StopGame
ôô 
(
ôô 
)
ôô 
;
ôô 
GameOver
öö 
=
öö 
true
öö 
;
öö  
}
õõ 
NextTetromino
ùù 
=
ùù 
_random
ùù #
==
ùù$ &
null
ùù' +
?
ùù, -
(
ùù. /
TetrominoFigure
ùù/ >
)
ùù> ?
AbstractFactory
ùù? N
.
ùùN O
GetTetromino
ùùO [
(
ùù[ \
$num
ùù\ ]
,
ùù] ^
$num
ùù_ `
)
ùù` a
:
ùùb c
(
ùùd e
TetrominoFigure
ùùe t
)
ùùt u
AbstractFactoryùùu Ñ
.ùùÑ Ö
GetTetrominoùùÖ ë
(ùùë í
$numùùí ì
,ùùì î
$numùùï ñ
,ùùñ ó
_randomùùò ü
)ùùü †
;ùù† °
}
ûû 	
[
•• 	%
ExcludeFromCodeCoverage
••	  
]
••  !
public
¶¶ 
TetrominoFigure
¶¶ "
CreateGhostTetromino
¶¶ 3
(
¶¶3 4
)
¶¶4 5
{
ßß 	
var
®® 
ghostTetromino
®® 
=
®®  
(
®®! "
TetrominoFigure
®®" 1
)
®®1 2
AbstractFactory
®®2 A
.
®®A B
GetTetromino
®®B N
(
®®N O
	Tetromino
®®O X
.
®®X Y
OffsetX
®®Y `
,
®®` a
	Tetromino
©© 
.
©© 
OffsetY
©© 
,
©©  
	Tetromino
™™ 
.
™™ 
Matrix
™™ 
)
™™ 
;
™™  
while
´´ 
(
´´ 
Representation
´´ !
.
´´! "
IsInRangeOfBoard
´´" 2
(
´´2 3
ghostTetromino
´´3 A
,
´´A B
$num
´´C D
,
´´D E
$num
´´F G
)
´´G H
&&
´´I K
!
¨¨ 
Representation
¨¨ 
.
¨¨ 
CheckCollision
¨¨ ,
(
¨¨, -
ghostTetromino
¨¨- ;
,
¨¨; <
givenYOffset
¨¨= I
:
¨¨I J
$num
¨¨K L
)
¨¨L M
)
¨¨M N
ghostTetromino
≠≠ 
.
≠≠ 
OffsetY
≠≠ &
++
≠≠& (
;
≠≠( )
return
ØØ 
ghostTetromino
ØØ !
;
ØØ! "
}
∞∞ 	
[
≤≤ 	%
ExcludeFromCodeCoverage
≤≤	  
]
≤≤  !
public
¥¥ 
void
¥¥ 
	MoveRight
¥¥ 
(
¥¥ 
)
¥¥ 
{
µµ 	
_user
∂∂ 
.
∂∂ 
Compute
∂∂ 
(
∂∂ 
$str
∂∂ !
,
∂∂! "
	Tetromino
∂∂# ,
,
∂∂, -
Representation
∂∂. <
,
∂∂< =
AbstractFactory
∂∂> M
,
∂∂M N
$num
∂∂O P
)
∂∂P Q
;
∂∂Q R
Representation
∑∑ 
=
∑∑ 
_user
∑∑ "
.
∑∑" #
GetRepresentation
∑∑# 4
(
∑∑4 5
Representation
∑∑5 C
)
∑∑C D
;
∑∑D E
	Tetromino
∏∏ 
=
∏∏ 
_user
∏∏ 
.
∏∏  
GetTetraminoFigure
∏∏ 0
(
∏∏0 1
	Tetromino
∏∏1 :
)
∏∏: ;
;
∏∏; <
}
ππ 	
[
ªª 	%
ExcludeFromCodeCoverage
ªª	  
]
ªª  !
public
ΩΩ 
void
ΩΩ 
MoveLeft
ΩΩ 
(
ΩΩ 
)
ΩΩ 
{
ææ 	
_user
øø 
.
øø 
Compute
øø 
(
øø 
$str
øø  
,
øø  !
	Tetromino
øø" +
,
øø+ ,
Representation
øø- ;
,
øø; <
AbstractFactory
øø= L
,
øøL M
$num
øøN O
)
øøO P
;
øøP Q
Representation
¿¿ 
=
¿¿ 
_user
¿¿ "
.
¿¿" #
GetRepresentation
¿¿# 4
(
¿¿4 5
Representation
¿¿5 C
)
¿¿C D
;
¿¿D E
	Tetromino
¡¡ 
=
¡¡ 
_user
¡¡ 
.
¡¡  
GetTetraminoFigure
¡¡ 0
(
¡¡0 1
	Tetromino
¡¡1 :
)
¡¡: ;
;
¡¡; <
}
¬¬ 	
[
ƒƒ 	%
ExcludeFromCodeCoverage
ƒƒ	  
]
ƒƒ  !
public
≈≈ 
void
≈≈ 
Undo
≈≈ 
(
≈≈ 
)
≈≈ 
{
∆∆ 	
_user
«« 
.
«« 
Undo
«« 
(
«« 
$num
«« 
)
«« 
;
«« 
Representation
»» 
=
»» 
_user
»» "
.
»»" #
GetRepresentation
»»# 4
(
»»4 5
Representation
»»5 C
)
»»C D
;
»»D E
	Tetromino
…… 
=
…… 
_user
…… 
.
……  
GetTetraminoFigure
…… 0
(
……0 1
	Tetromino
……1 :
)
……: ;
;
……; <
}
   	
[
‘‘ 	%
ExcludeFromCodeCoverage
‘‘	  
]
‘‘  !
public
’’ 
bool
’’ 
MovePossible
’’  
(
’’  !
int
’’! $
offsetInBoardX
’’% 3
=
’’4 5
$num
’’6 7
,
’’7 8
int
’’9 <
offsetInBoardY
’’= K
=
’’L M
$num
’’N O
,
’’O P
int
’’Q T
offsetCollisionX
’’U e
=
’’f g
$num
’’h i
,
’’i j
int
÷÷
 
offsetCollisionY
÷÷ 
=
÷÷  
$num
÷÷! "
)
÷÷" #
{
◊◊ 	
return
ÿÿ 
Representation
ÿÿ !
.
ÿÿ! "
IsInRangeOfBoard
ÿÿ" 2
(
ÿÿ2 3
	Tetromino
ÿÿ3 <
,
ÿÿ< =
offsetInBoardX
ÿÿ> L
,
ÿÿL M
offsetInBoardY
ÿÿN \
)
ÿÿ\ ]
&&
ÿÿ^ `
!
ŸŸ 
Representation
ŸŸ 
.
ŸŸ 
CheckCollision
ŸŸ ,
(
ŸŸ, -
	Tetromino
ŸŸ- 6
,
ŸŸ6 7
offsetCollisionX
ŸŸ8 H
,
ŸŸH I
offsetCollisionY
ŸŸJ Z
)
ŸŸZ [
;
ŸŸ[ \
}
⁄⁄ 	
[
‡‡ 	%
ExcludeFromCodeCoverage
‡‡	  
]
‡‡  !
private
·· 
bool
·· 
HandleScore
··  
(
··  !
)
··! "
{
‚‚ 	
var
„„ 
deletedRows
„„ 
=
„„ 
Representation
„„ ,
.
„„, -
HandleRowDeletion
„„- >
(
„„> ?
)
„„? @
;
„„@ A
if
‰‰ 
(
‰‰ 
!
‰‰ 
Score
‰‰ 
.
‰‰ 
ForceLevelUpdate
‰‰ '
)
‰‰' (
{
ÂÂ 
if
ÊÊ 
(
ÊÊ 
deletedRows
ÊÊ 
==
ÊÊ  "
$num
ÊÊ# $
)
ÊÊ$ %
return
ÊÊ& ,
false
ÊÊ- 2
;
ÊÊ2 3
Score
ÁÁ 
.
ÁÁ 
HandleScore
ÁÁ !
(
ÁÁ! "
deletedRows
ÁÁ" -
)
ÁÁ- .
;
ÁÁ. /
}
ËË 
return
ÍÍ 
Score
ÍÍ 
.
ÍÍ 
HandleLevel
ÍÍ $
(
ÍÍ$ %
)
ÍÍ% &
;
ÍÍ& '
}
ÎÎ 	
[
ÚÚ 	%
ExcludeFromCodeCoverage
ÚÚ	  
]
ÚÚ  !
public
ÛÛ 
void
ÛÛ 
Restart
ÛÛ 
(
ÛÛ 
)
ÛÛ 
{
ÙÙ 	
	GameTimer
ıı 
.
ıı 
Stop
ıı 
(
ıı 
)
ıı 
;
ıı 
	StartGame
ˆˆ 
(
ˆˆ 
)
ˆˆ 
;
ˆˆ 
NewTetromino
˜˜ 
(
˜˜ 
)
˜˜ 
;
˜˜ 
}
¯¯ 	
public
˝˝ 
void
˝˝ 
TogglePause
˝˝ 
(
˝˝  
)
˝˝  !
=>
˝˝" $
	GameTimer
˝˝% .
.
˝˝. /
	IsEnabled
˝˝/ 8
=
˝˝9 :
!
˝˝; <
	GameTimer
˝˝< E
.
˝˝E F
	IsEnabled
˝˝F O
;
˝˝O P
}
˛˛ 
}ˇˇ ú	
rC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Tetromino\TetrominoBrushes.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Tetromino! *
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

static 
class 
TetrominoBrushes (
{		 
public

 
static

 
Brush

 
[

 
]

 

BrushArray

 (
=

) *
{ 	
Brushes 
. 
Black 
, 
Brushes 
. 
Yellow 
, 
Brushes 
. 

BlueViolet 
, 
Brushes 
. 
Aqua 
, 
Brushes 
. 

DarkOrange 
, 
Brushes 
. 
	LimeGreen 
, 
Brushes 
. 
Red 
, 
Brushes 
. 
Blue 
} 	
;	 

} 
} ˘-
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Tetromino\TetrominoFigure.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Tetromino! *
{		 
public 

abstract 
class 
TetrominoFigure )
:* +
Unit, 0
{ 
public 
Matrix 
Matrix 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
OffsetX 
; 
public 
int 
OffsetY 
; 
private 
readonly 
TetrominoComponent +

_component, 6
;6 7
public 
TetrominoFigure 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
RandomD J
randomK Q
,Q R
TetrominoComponentS e
	componentf o
)o p
:q r
bases w
(w x
levelx }
)} ~
{ 	
this 
. 

_component 
= 
	component '
;' (
Matrix 
= 
CreateShape  
(  !
random! '
)' (
;( )
OffsetX 
= 
offsetX 
; 
OffsetY 
= 
offsetY 
; 
}   	
public)) 
TetrominoFigure)) 
()) 
int)) "
level))# (
,))( )
int))* -
offsetX)). 5
,))5 6
int))7 :
offsetY)); B
,))B C
TetrominoComponent))D V
	component))W `
)))` a
:))b c
base))d h
())h i
level))i n
)))n o
{** 	
this++ 
.++ 

_component++ 
=++ 
	component++ '
;++' (
Matrix,, 
=,, 
CreateShape,,  
(,,  !
),,! "
;,," #
OffsetX-- 
=-- 
offsetX-- 
;-- 
OffsetY.. 
=.. 
offsetY.. 
;.. 
}// 	
public99 
TetrominoFigure99 
(99 
int99 "
level99# (
,99( )
int99* -
offsetX99. 5
,995 6
int997 :
offsetY99; B
,99B C
Matrix99D J
matrix99K Q
,99Q R
TetrominoComponent99S e
	component99f o
)99o p
:99q r
base99s w
(99w x
level99x }
)99} ~
{:: 	
this;; 
.;; 

_component;; 
=;; 
	component;; '
;;;' (
Matrix<< 
=<< 
matrix<< 
;<< 
OffsetX== 
=== 
offsetX== 
;== 
OffsetY>> 
=>> 
offsetY>> 
;>> 
}?? 	
[EE 	#
ExcludeFromCodeCoverageEE	  
]EE  !
publicFF 
ListFF 
<FF 
(FF 
intFF 
,FF 
intFF 
)FF 
>FF 
CalculatePositionsFF  2
(FF2 3
)FF3 4
{GG 	
varHH 
coordinatesHH 
=HH 
newHH !
ListHH" &
<HH& '
(HH' (
intHH( +
,HH+ ,
intHH- 0
)HH0 1
>HH1 2
(HH2 3
)HH3 4
;HH4 5
forII 
(II 
varII 
yII 
=II 
$numII 
;II 
yII 
<II 
MatrixII  &
.II& '
ValueII' ,
.II, -
	GetLengthII- 6
(II6 7
$numII7 8
)II8 9
;II9 :
yII; <
++II< >
)II> ?
forJJ 
(JJ 
varJJ 
xJJ 
=JJ 
$numJJ 
;JJ 
xJJ  !
<JJ" #
MatrixJJ$ *
.JJ* +
ValueJJ+ 0
.JJ0 1
	GetLengthJJ1 :
(JJ: ;
$numJJ; <
)JJ< =
;JJ= >
xJJ? @
++JJ@ B
)JJB C
{KK 
ifLL 
(LL 
MatrixLL 
.LL 
ValueLL $
[LL$ %
yLL% &
,LL& '
xLL( )
]LL) *
==LL+ -
$numLL. /
)LL/ 0
continueMM  
;MM  !
coordinatesNN 
.NN  
AddNN  #
(NN# $
(NN$ %
yNN% &
+NN' (
OffsetYNN) 0
,NN0 1
xNN2 3
+NN4 5
OffsetXNN6 =
)NN= >
)NN> ?
;NN? @
}OO 
returnQQ 
coordinatesQQ 
;QQ 
}RR 	
publicZZ 
MatrixZZ 
CreateShapeZZ !
(ZZ! "
RandomZZ" (
randZZ) -
=ZZ. /
nullZZ0 4
)ZZ4 5
{[[ 	
Random\\ 
random\\ 
=\\ 
rand\\  
??\\! #
new\\$ '
Random\\( .
(\\. /
)\\/ 0
;\\0 1
return]] 

_component]] 
.]] 
GetTetrominos]] +
(]]+ ,
)]], -
.]]- .
	ElementAt]]. 7
(]]7 8
random]]8 >
.]]> ?
Next]]? C
(]]C D
$num]]D E
,]]E F

_component]]G Q
.]]Q R
GetTetrominos]]R _
(]]_ `
)]]` a
.]]a b
Count]]b g
)]]g h
)]]h i
.]]i j
Value]]j o
;]]o p
}^^ 	
}__ 
}`` ∫	
uC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Tetromino\TetrominoJsonObject.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Tetromino! *
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
TetrominoJsonObject $
{ 
public		 
Matrix		 
Matrix		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
OffsetX

 
;

 
public 
int 
OffsetY 
; 
public 
TetrominoJsonObject "
(" #
int# &
offsetX' .
,. /
int0 3
offsetY4 ;
,; <
Matrix= C
matrixD J
)J K
{ 	
OffsetX 
= 
offsetX 
; 
OffsetY 
= 
offsetY 
; 
Matrix 
= 
matrix 
; 
} 	
} 
} Ú
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Tetromino\TetrominoLevel1.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Tetromino! *
{ 
public 

class 
TetrominoLevel1  
:! "
TetrominoFigure# 2
{ 
public 
TetrominoLevel1 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
RandomD J
randomK Q
,Q R
TetrominoComponentS e
	componentf o
)o p
:q r
bases w
(w x
levelx }
,} ~
offsetX	 Ü
,
Ü á
offsetY
à è
,
è ê
random
ë ó
,
ó ò
	component
ô ¢
)
¢ £
{		 	
}

 	
public 
TetrominoLevel1 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
TetrominoComponentD V
	componentW `
)` a
:b c
based h
(h i
leveli n
,n o
offsetXp w
,w x
offsetY	y Ä
,
Ä Å
	component
Ç ã
)
ã å
{ 	
} 	
public 
TetrominoLevel1 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
MatrixD J
matrixK Q
,Q R
TetrominoComponentS e
	componentf o
)o p
:q r
bases w
(w x
levelx }
,} ~
offsetX	 Ü
,
Ü á
offsetY
à è
,
è ê
matrix
ë ó
,
ó ò
	component
ô ¢
)
¢ £
{ 	
} 	
} 
} Ú
qC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\gameLogic\Tetromino\TetrominoLevel2.cs
	namespace 	
TetrisClient
 
. 
	gameLogic  
.  !
	Tetromino! *
{ 
public 

class 
TetrominoLevel2  
:! "
TetrominoFigure# 2
{ 
public 
TetrominoLevel2 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
RandomD J
randomK Q
,Q R
TetrominoComponentS e
	componentf o
)o p
:q r
bases w
(w x
levelx }
,} ~
offsetX	 Ü
,
Ü á
offsetY
à è
,
è ê
random
ë ó
,
ó ò
	component
ô ¢
)
¢ £
{		 	
}

 	
public 
TetrominoLevel2 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
TetrominoComponentD V
	componentW `
)` a
:b c
based h
(h i
leveli n
,n o
offsetXp w
,w x
offsetY	y Ä
,
Ä Å
	component
Ç ã
)
ã å
{ 	
} 	
public 
TetrominoLevel2 
( 
int "
level# (
,( )
int* -
offsetX. 5
,5 6
int7 :
offsetY; B
,B C
MatrixD J
matrixK Q
,Q R
TetrominoComponentS e
	componentf o
)o p
:q r
bases w
(w x
levelx }
,} ~
offsetX	 Ü
,
Ü á
offsetY
à è
,
è ê
matrix
ë ó
,
ó ò
	component
ô ¢
)
¢ £
{ 	
} 	
} 
} µñ
kC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\userInterface\MainWindow.xaml.cs
	namespace 	
TetrisClient
 
. 
userInterface $
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

partial 
class 

MainWindow #
{ 
private 
readonly 
TetrisEngine %
_engine& -
=. /
new0 3
(3 4
)4 5
;5 6
private 
DispatcherTimer 
_renderTimer  ,
;, -
private 
readonly 
SoundPlayer $
_gameOverTune% 2
=3 4
new5 8
(8 9
	Resource19 B
.B C
GameOverC K
)K L
;L M
private 
readonly 
SoundPlayer $
_sound1% ,
=- .
new/ 2
(2 3
	Resource13 <
.< =
Sound1= C
)C D
;D E
private 
readonly 
SoundPlayer $
_sound2% ,
=- .
new/ 2
(2 3
	Resource13 <
.< =
Sound2= C
)C D
;D E
public 

MainWindow 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "
_engine 
. 
	StartGame 
( 
) 
;  
Timer   
(   
)   
;   
}!! 	
private'' 
void'' 
Timer'' 
('' 
)'' 
{(( 	
_renderTimer)) 
=)) 
new)) 
DispatcherTimer)) .
()). /
)))/ 0
;))0 1
_renderTimer** 
.** 
Tick** 
+=**   
dispatcherTimer_Tick**! 5
;**5 6
_renderTimer++ 
.++ 
Interval++ !
=++" #
_engine++$ +
.+++ ,
	GameTimer++, 5
.++5 6
Interval++6 >
;++> ?
_renderTimer,, 
.,, 
Start,, 
(,, 
),,  
;,,  !
}-- 	
private66 
void66  
dispatcherTimer_Tick66 )
(66) *
object66* 0
sender661 7
,667 8
	EventArgs669 B
e66C D
)66D E
=>66F H

UpdateGame66I S
(66S T
)66T U
;66U V
private;; 
void;; 

RenderGrid;; 
(;;  
);;  !
{<< 	

TetrisGrid== 
.== 
Children== 
.==  
Clear==  %
(==% &
)==& '
;==' ("
RenderLandedTetrominos?? "
(??" #
)??# $
;??$ %
RenderTetrominoAA 
(AA 
_engineAA #
.AA# $
	TetrominoAA$ -
,AA- .

TetrisGridAA/ 9
)AA9 :
;AA: ;
RenderTetrominoBB 
(BB 
_engineBB #
.BB# $ 
CreateGhostTetrominoBB$ 8
(BB8 9
)BB9 :
,BB: ;

TetrisGridBB< F
,BBF G
$numBBH L
)BBL M
;BBM N
NextGridDD 
.DD 
ChildrenDD 
.DD 
ClearDD #
(DD# $
)DD$ %
;DD% &
RenderTetrominoEE 
(EE 
_engineEE #
.EE# $
NextTetrominoEE$ 1
,EE1 2
NextGridEE3 ;
)EE; <
;EE< =
}FF 	
privatePP 
voidPP 
RenderTetrominoPP $
(PP$ %
TetrominoFigurePP% 4
	tetrominoPP5 >
,PP> ?
PanelPP@ E
gridPPF J
,PPJ K
doublePPL R
opacityPPS Z
=PP[ \
$numPP] ^
)PP^ _
{QQ 	
	tetrominoRR 
.RR 
CalculatePositionsRR (
(RR( )
)RR) *
.RR* +
ForEachRR+ 2
(RR2 3

coordinateRR3 =
=>RR> @
{SS 
varTT 
(TT 
yTT 
,TT 
xTT 
)TT 
=TT 

coordinateTT '
;TT' (
varUU 
shapeRectangleUU "
=UU# $
	tetrominoUU% .
.UU. /
MatrixUU/ 5
.UU5 6
ValueUU6 ;
[UU; <
yUU< =
-UU> ?
	tetrominoUU@ I
.UUI J
OffsetYUUJ Q
,UUQ R
xUUS T
-UUU V
	tetrominoUUW `
.UU` a
OffsetXUUa h
]UUh i
;UUi j
varVV 
	rectangleVV 
=VV 
CreateRectangleVV  /
(VV/ 0
TetrominoBrushesVV0 @
.VV@ A

BrushArrayVVA K
[VVK L
shapeRectangleVVL Z
]VVZ [
,VV[ \
opacityVV] d
)VVd e
;VVe f
gridWW 
.WW 
ChildrenWW 
.WW 
AddWW !
(WW! "
	rectangleWW" +
)WW+ ,
;WW, -
GridYY 
.YY 
SetRowYY 
(YY 
	rectangleYY %
,YY% &
yYY' (
)YY( )
;YY) *
GridZZ 
.ZZ 
	SetColumnZZ 
(ZZ 
	rectangleZZ (
,ZZ( )
gridZZ* .
==ZZ/ 1

TetrisGridZZ2 <
?ZZ= >
xZZ? @
:ZZA B
xZZC D
-ZZE F
$numZZG H
)ZZH I
;ZZI J
}[[ 
)[[ 
;[[ 
}\\ 	
privateaa 
voidaa "
RenderLandedTetrominosaa +
(aa+ ,
)aa, -
{bb 	
varcc 
boardcc 
=cc 
_enginecc 
.cc  
Representationcc  .
.cc. /
Boardcc/ 4
;cc4 5
foree 
(ee 
varee 
yee 
=ee 
$numee 
;ee 
yee 
<ee 
boardee  %
.ee% &
	GetLengthee& /
(ee/ 0
$numee0 1
)ee1 2
;ee2 3
yee4 5
++ee5 7
)ee7 8
forff 
(ff 
varff 
xff 
=ff 
$numff 
;ff 
xff  !
<ff" #
boardff$ )
.ff) *
	GetLengthff* 3
(ff3 4
$numff4 5
)ff5 6
;ff6 7
xff8 9
++ff9 ;
)ff; <
{gg 
varhh 
blockhh 
=hh 
boardhh  %
[hh% &
yhh& '
,hh' (
xhh) *
]hh* +
;hh+ ,
ifii 
(ii 
blockii 
==ii  
$numii! "
)ii" #
continueii$ ,
;ii, -
varkk 
	rectanglekk !
=kk" #
CreateRectanglekk$ 3
(kk3 4
TetrominoBrusheskk4 D
.kkD E

BrushArraykkE O
[kkO P
boardkkP U
[kkU V
ykkV W
,kkW X
xkkY Z
]kkZ [
]kk[ \
)kk\ ]
;kk] ^

TetrisGridll 
.ll 
Childrenll '
.ll' (
Addll( +
(ll+ ,
	rectanglell, 5
)ll5 6
;ll6 7
Gridnn 
.nn 
SetRownn 
(nn  
	rectanglenn  )
,nn) *
ynn+ ,
)nn, -
;nn- .
Gridoo 
.oo 
	SetColumnoo "
(oo" #
	rectangleoo# ,
,oo, -
xoo. /
)oo/ 0
;oo0 1
}pp 
}qq 	
privatezz 
voidzz 

UpdateGamezz 
(zz  
)zz  !
{{{ 	
if|| 
(|| 
_engine|| 
.|| 
GameOver||  
)||  !
{}} 
_renderTimer~~ 
.~~ 
	IsEnabled~~ &
=~~' (
false~~) .
;~~. /
GameOverText 
. 

Visibility '
=( )

Visibility* 4
.4 5
Visible5 <
;< =
_gameOverTune
ÄÄ 
.
ÄÄ 
Play
ÄÄ "
(
ÄÄ" #
)
ÄÄ# $
;
ÄÄ$ %
return
ÅÅ 
;
ÅÅ 
}
ÇÇ 
_renderTimer
ÑÑ 
.
ÑÑ 
Interval
ÑÑ !
=
ÑÑ" #
_engine
ÑÑ$ +
.
ÑÑ+ ,
	GameTimer
ÑÑ, 5
.
ÑÑ5 6
Interval
ÑÑ6 >
;
ÑÑ> ?
LevelTextBlock
ÜÜ 
.
ÜÜ 
Text
ÜÜ 
=
ÜÜ  !
$"
ÜÜ" $
{
ÜÜ$ %
_engine
ÜÜ% ,
.
ÜÜ, -
Score
ÜÜ- 2
.
ÜÜ2 3
Level
ÜÜ3 8
}
ÜÜ8 9
"
ÜÜ9 :
;
ÜÜ: ;
ScoreTextBlock
áá 
.
áá 
Text
áá 
=
áá  !
$"
áá" $
{
áá$ %
_engine
áá% ,
.
áá, -
Score
áá- 2
.
áá2 3
Points
áá3 9
}
áá9 :
"
áá: ;
;
áá; <
LinesTextBlock
àà 
.
àà 
Text
àà 
=
àà  !
$"
àà" $
{
àà$ %
_engine
àà% ,
.
àà, -
Score
àà- 2
.
àà2 3
Rows
àà3 7
}
àà7 8
"
àà8 9
;
àà9 :

RenderGrid
ää 
(
ää 
)
ää 
;
ää 
}
ãã 	
	protected
íí 
override
íí 
void
íí 
	OnKeyDown
íí  )
(
íí) *
KeyEventArgs
íí* 6
e
íí7 8
)
íí8 9
{
ìì 	
switch
ïï 
(
ïï 
e
ïï 
.
ïï 
Key
ïï 
)
ïï 
{
ññ 
case
óó 
Key
óó 
.
óó 
Enter
óó 
:
óó 
Restart
òò 
(
òò 
)
òò 
;
òò 
break
ôô 
;
ôô 
case
öö 
Key
öö 
.
öö 
P
öö 
:
öö 
TogglePause
õõ 
(
õõ  
null
õõ  $
,
õõ$ %
null
õõ& *
)
õõ* +
;
õõ+ ,
break
úú 
;
úú 
case
ùù 
Key
ùù 
.
ùù 
Escape
ùù 
:
ùù  
Quit
ûû 
(
ûû 
null
ûû 
,
ûû 
null
ûû #
)
ûû# $
;
ûû$ %
break
üü 
;
üü 
}
†† 
if
¢¢ 
(
¢¢ 
!
¢¢ 
_renderTimer
¢¢ 
.
¢¢ 
	IsEnabled
¢¢ '
)
¢¢' (
return
¢¢) /
;
¢¢/ 0
switch
•• 
(
•• 
e
•• 
.
•• 
Key
•• 
)
•• 
{
¶¶ 
case
ßß 
Key
ßß 
.
ßß 
Right
ßß 
:
ßß 
_engine
®® 
.
®® 
	Tetromino
®® %
.
®®% &
SetStrategy
®®& 1
(
®®1 2
new
®®2 5
	MoveRight
®®6 ?
(
®®? @
_engine
®®@ G
.
®®G H
AbstractFactory
®®H W
,
®®W X
_engine
®®Y `
.
®®` a
	Tetromino
®®a j
,
®®j k
_engine
®®l s
.
®®s t
Representation®®t Ç
)®®Ç É
)®®É Ñ
;®®Ñ Ö
_engine
©© 
.
©© 
	Tetromino
©© %
.
©©% &
Action
©©& ,
(
©©, -
)
©©- .
;
©©. /
_sound2
´´ 
.
´´ 
Play
´´  
(
´´  !
)
´´! "
;
´´" #
break
¨¨ 
;
¨¨ 
case
≠≠ 
Key
≠≠ 
.
≠≠ 
Left
≠≠ 
:
≠≠ 
_engine
ÆÆ 
.
ÆÆ 
	Tetromino
ÆÆ %
.
ÆÆ% &
SetStrategy
ÆÆ& 1
(
ÆÆ1 2
new
ÆÆ2 5
MoveLeft
ÆÆ6 >
(
ÆÆ> ?
_engine
ÆÆ? F
.
ÆÆF G
AbstractFactory
ÆÆG V
,
ÆÆV W
_engine
ÆÆX _
.
ÆÆ_ `
	Tetromino
ÆÆ` i
,
ÆÆi j
_engine
ÆÆk r
.
ÆÆr s
RepresentationÆÆs Å
)ÆÆÅ Ç
)ÆÆÇ É
;ÆÆÉ Ñ
_engine
ØØ 
.
ØØ 
	Tetromino
ØØ %
.
ØØ% &
Action
ØØ& ,
(
ØØ, -
)
ØØ- .
;
ØØ. /
_sound2
±± 
.
±± 
Play
±±  
(
±±  !
)
±±! "
;
±±" #
break
≤≤ 
;
≤≤ 
case
≥≥ 
Key
≥≥ 
.
≥≥ 
Up
≥≥ 
:
≥≥ 
_sound2
¥¥ 
.
¥¥ 
Play
¥¥  
(
¥¥  !
)
¥¥! "
;
¥¥" #
_engine
µµ 
.
µµ 
	Tetromino
µµ %
.
µµ% &
SetStrategy
µµ& 1
(
µµ1 2
new
µµ2 5

RotationUp
µµ6 @
(
µµ@ A
_engine
µµA H
.
µµH I
AbstractFactory
µµI X
,
µµX Y
_engine
µµZ a
.
µµa b
	Tetromino
µµb k
,
µµk l
_engine
µµm t
.
µµt u
Representationµµu É
)µµÉ Ñ
)µµÑ Ö
;µµÖ Ü
_engine
∂∂ 
.
∂∂ 
	Tetromino
∂∂ %
.
∂∂% &
Action
∂∂& ,
(
∂∂, -
)
∂∂- .
;
∂∂. /
break
∏∏ 
;
∏∏ 
case
ππ 
Key
ππ 
.
ππ 
Down
ππ 
:
ππ 
_sound2
∫∫ 
.
∫∫ 
Play
∫∫  
(
∫∫  !
)
∫∫! "
;
∫∫" #
_engine
ªª 
.
ªª 
	Tetromino
ªª %
.
ªª% &
SetStrategy
ªª& 1
(
ªª1 2
new
ªª2 5
RotationDown
ªª6 B
(
ªªB C
_engine
ªªC J
.
ªªJ K
AbstractFactory
ªªK Z
,
ªªZ [
_engine
ªª\ c
.
ªªc d
	Tetromino
ªªd m
,
ªªm n
_engine
ªªo v
.
ªªv w
Representationªªw Ö
)ªªÖ Ü
)ªªÜ á
;ªªá à
_engine
ºº 
.
ºº 
	Tetromino
ºº %
.
ºº% &
Action
ºº& ,
(
ºº, -
)
ºº- .
;
ºº. /
break
ææ 
;
ææ 
case
øø 
Key
øø 
.
øø 
Space
øø 
:
øø 
_engine
¿¿ 
.
¿¿ 
	Tetromino
¿¿ %
.
¿¿% &
SetStrategy
¿¿& 1
(
¿¿1 2
new
¿¿2 5
HardDrop
¿¿6 >
(
¿¿> ?
_engine
¿¿? F
.
¿¿F G
AbstractFactory
¿¿G V
,
¿¿V W
_engine
¿¿X _
.
¿¿_ `
	Tetromino
¿¿` i
,
¿¿i j
_engine
¿¿k r
.
¿¿r s
Representation¿¿s Å
)¿¿Å Ç
)¿¿Ç É
;¿¿É Ñ
_engine
¡¡ 
.
¡¡ 
	Tetromino
¡¡ %
.
¡¡% &
Action
¡¡& ,
(
¡¡, -
)
¡¡- .
;
¡¡. /
_sound1
√√ 
.
√√ 
Play
√√  
(
√√  !
)
√√! "
;
√√" #
break
ƒƒ 
;
ƒƒ 
case
≈≈ 
Key
≈≈ 
.
≈≈ 
	LeftShift
≈≈ "
:
≈≈" #
_engine
∆∆ 
.
∆∆ 
	Tetromino
∆∆ %
.
∆∆% &
SetStrategy
∆∆& 1
(
∆∆1 2
new
∆∆2 5
SoftDrop
∆∆6 >
(
∆∆> ?
_engine
∆∆? F
.
∆∆F G
AbstractFactory
∆∆G V
,
∆∆V W
_engine
∆∆X _
.
∆∆_ `
	Tetromino
∆∆` i
,
∆∆i j
_engine
∆∆k r
.
∆∆r s
Representation∆∆s Å
)∆∆Å Ç
)∆∆Ç É
;∆∆É Ñ
_engine
«« 
.
«« 
	Tetromino
«« %
.
««% &
Action
««& ,
(
««, -
)
««- .
;
««. /
_sound2
…… 
.
…… 
Play
……  
(
……  !
)
……! "
;
……" #
break
   
;
   
default
ÀÀ 
:
ÀÀ 
return
ÃÃ 
;
ÃÃ 
}
ÕÕ 

UpdateGame
ŒŒ 
(
ŒŒ 
)
ŒŒ 
;
ŒŒ 
}
œœ 	
private
ÿÿ 
void
ÿÿ 
Restart
ÿÿ 
(
ÿÿ 
)
ÿÿ 
{
ŸŸ 	
_renderTimer
⁄⁄ 
.
⁄⁄ 
Stop
⁄⁄ 
(
⁄⁄ 
)
⁄⁄ 
;
⁄⁄  
_engine
€€ 
.
€€ 
Restart
€€ 
(
€€ 
)
€€ 
;
€€ 
GameOverText
‹‹ 
.
‹‹ 

Visibility
‹‹ #
=
‹‹$ %

Visibility
‹‹& 0
.
‹‹0 1
Hidden
‹‹1 7
;
‹‹7 8
Timer
›› 
(
›› 
)
›› 
;
›› 

UpdateGame
ﬁﬁ 
(
ﬁﬁ 
)
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
private
ÊÊ 
void
ÊÊ 
TogglePause
ÊÊ  
(
ÊÊ  !
object
ÊÊ! '
sender
ÊÊ( .
,
ÊÊ. /
RoutedEventArgs
ÊÊ0 ?
routedEventArgs
ÊÊ@ O
)
ÊÊO P
{
ÁÁ 	
PauseButton
ËË 
.
ËË 
Content
ËË 
=
ËË  !
(
ËË" #
string
ËË# )
)
ËË) *
PauseButton
ËË* 5
.
ËË5 6
Content
ËË6 =
==
ËË> @
$str
ËËA H
?
ËËI J
$str
ËËK S
:
ËËT U
$str
ËËV ]
;
ËË] ^
_renderTimer
ÈÈ 
.
ÈÈ 
	IsEnabled
ÈÈ "
=
ÈÈ# $
!
ÈÈ% &
_renderTimer
ÈÈ& 2
.
ÈÈ2 3
	IsEnabled
ÈÈ3 <
;
ÈÈ< =
_engine
ÍÍ 
.
ÍÍ 
TogglePause
ÍÍ 
(
ÍÍ  
)
ÍÍ  !
;
ÍÍ! "
}
ÎÎ 	
private
ÚÚ 
void
ÚÚ 
Quit
ÚÚ 
(
ÚÚ 
object
ÚÚ  
sender
ÚÚ! '
,
ÚÚ' (
RoutedEventArgs
ÚÚ) 8
routedEventArgs
ÚÚ9 H
)
ÚÚH I
=>
ÚÚJ L
Application
ÚÚM X
.
ÚÚX Y
Current
ÚÚY `
.
ÚÚ` a
Shutdown
ÚÚa i
(
ÚÚi j
)
ÚÚj k
;
ÚÚk l
private
˙˙ 
static
˙˙ 
	Rectangle
˙˙  
CreateRectangle
˙˙! 0
(
˙˙0 1
Brush
˙˙1 6
color
˙˙7 <
,
˙˙< =
double
˙˙> D
opacity
˙˙E L
=
˙˙M N
$num
˙˙O P
)
˙˙P Q
=>
˙˙R T
new
˙˙U X
(
˙˙X Y
)
˙˙Y Z
{
˚˚ 	
Width
¸¸ 
=
¸¸ 
$num
¸¸ 
,
¸¸ 
Height
˝˝ 
=
˝˝ 
$num
˝˝ 
,
˝˝ 
Stroke
˛˛ 
=
˛˛ 
Brushes
˛˛ 
.
˛˛ 
Black
˛˛ "
,
˛˛" #
StrokeThickness
ˇˇ 
=
ˇˇ 
$num
ˇˇ "
,
ˇˇ" #
Fill
ÄÄ 
=
ÄÄ 
color
ÄÄ 
,
ÄÄ 
Opacity
ÅÅ 
=
ÅÅ 
opacity
ÅÅ 
}
ÇÇ 	
;
ÇÇ	 

}
ÉÉ 
}ÑÑ ∂
rC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\userInterface\MultiplayerWindow.xaml.cs
	namespace 	
TetrisClient
 
. 
userInterface $
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

partial 
class 
MultiplayerWindow *
{ 
private 
static 
TetrisEngine #
_engine$ +
=, -
new. 1
(1 2
)2 3
;3 4
private 
DispatcherTimer 
_renderTimer  ,
;, -
private!! 
readonly!! 
SoundPlayer!! $
_sound1!!% ,
=!!- .
new!!/ 2
(!!2 3
	Resource1!!3 <
.!!< =
Sound1!!= C
)!!C D
;!!D E
private"" 
readonly"" 
SoundPlayer"" $
_sound2""% ,
=""- .
new""/ 2
(""2 3
	Resource1""3 <
.""< =
Sound2""= C
)""C D
;""D E
private$$ 
int$$ 
[$$ 
,$$ 
]$$ 
_enemyBoard$$ "
;$$" #
private%% 
TetrominoJsonObject%% #
_enemyTetromino%%$ 3
;%%3 4
private&& 
TetrominoJsonObject&& #
_enemyNextTetromino&&$ 7
;&&7 8
private'' 
Score'' 
_enemyScore'' !
;''! "
private(( 
bool(( 
_enemyGameOver(( #
;((# $
private** 
readonly** 
Subject**  
_subject**! )
=*** +
new**, /
ConcreteSubject**0 ?
(**? @
_engine**@ G
)**G H
;**H I
public,, 
MultiplayerWindow,,  
(,,  !
),,! "
{-- 	
InitializeComponent.. 
(..  
)..  !
;..! "
	Singleton// 
	singleton// 
=//  !
	Singleton//" +
.//+ ,
GetInstance//, 7
(//7 8
)//8 9
;//9 :
CreateSubscriptions11 
(11  
)11  !
;11! "
Task66 
.66 
Run66 
(66 
async66 
(66 
)66 
=>66  
await66! &
	singleton66' 0
.660 1
GetConnection661 >
(66> ?
)66? @
.66@ A

StartAsync66A K
(66K L
)66L M
)66M N
;66N O
}77 	
private>> 
async>> 
void>> 
StartGame_OnClick>> ,
(>>, -
object>>- 3
sender>>4 :
,>>: ;
RoutedEventArgs>>< K
e>>L M
)>>M N
{?? 	
	Singleton@@ 
	singleton@@ 
=@@  !
	Singleton@@" +
.@@+ ,
GetInstance@@, 7
(@@7 8
)@@8 9
;@@9 :
ifBB 
(BB 
	singletonBB 
.BB 
GetConnectionBB '
(BB' (
)BB( )
.BB) *
StateBB* /
!=BB0 2
HubConnectionStateBB3 E
.BBE F
	ConnectedBBF O
)BBO P
returnBBQ W
;BBW X
varCC 
seedCC 
=CC 
GuidCC 
.CC 
NewGuidCC #
(CC# $
)CC$ %
.CC% &
GetHashCodeCC& 1
(CC1 2
)CC2 3
;CC3 4
awaitFF 
	singletonFF 
.FF 
GetConnectionFF )
(FF) *
)FF* +
.FF+ ,
InvokeAsyncFF, 7
(FF7 8
$strFF8 A
,FFA B
seedFFC G
)FFG H
;FFH I
}GG 	
privateMM 
voidMM 
CreateSubscriptionsMM (
(MM( )
)MM) *
{NN 	
	SingletonOO 
	singletonOO 
=OO  !
	SingletonOO" +
.OO+ ,
GetInstanceOO, 7
(OO7 8
)OO8 9
;OO9 :
	singletonSS 
.SS 
GetConnectionSS #
(SS# $
)SS$ %
.SS% &
OnSS& (
<SS( )
intSS) ,
>SS, -
(SS- .
$strSS. 7
,SS7 8
seedSS9 =
=>SS> @
TaskTT 
.TT 
RunTT 
(TT 
asyncTT 
(TT  
)TT  !
=>TT" $
awaitTT% *
	singletonTT+ 4
.TT4 5
GetConnectionTT5 B
(TTB C
)TTC D
.TTD E
InvokeAsyncTTE P
(TTP Q
$strTTQ \
,TT\ ]
seedTT^ b
)TTb c
)TTc d
)TTd e
;TTe f
	singletonUU 
.UU 
GetConnectionUU #
(UU# $
)UU$ %
.UU% &
OnUU& (
<UU( )
intUU) ,
>UU, -
(UU- .
$strUU. 9
,UU9 :
seedUU; ?
=>UU@ B

DispatcherUUC M
.UUM N
BeginInvokeUUN Y
(UUY Z
newUUZ ]
ActionUU^ d
(UUd e
(UUe f
)UUf g
=>UUh j
	StartGameVV 
(VV 
seedVV 
)VV 
)VV  
)VV  !
)VV! "
;VV" #
	singletonWW 
.WW 
GetConnectionWW #
(WW# $
)WW$ %
.WW% &
OnWW& (
<WW( )
stringWW) /
>WW/ 0
(WW0 1
$strWW1 <
,WW< =
boardWW> C
=>WWD F

DispatcherWWG Q
.WWQ R
BeginInvokeWWR ]
(WW] ^
newWW^ a
ActionWWb h
(WWh i
(WWi j
)WWj k
=>WWl n
_enemyBoardXX 
=XX 
JsonConvertXX )
.XX) *
DeserializeObjectXX* ;
<XX; <
intXX< ?
[XX? @
,XX@ A
]XXA B
>XXB C
(XXC D
boardXXD I
)XXI J
)XXJ K
)XXK L
)XXL M
;XXM N
	singletonYY 
.YY 
GetConnectionYY #
(YY# $
)YY$ %
.YY% &
OnYY& (
<YY( )
stringYY) /
>YY/ 0
(YY0 1
$strYY1 @
,YY@ A
	tetrominoYYB K
=>YYL N

DispatcherYYO Y
.YYY Z
BeginInvokeYYZ e
(YYe f
newYYf i
ActionYYj p
(YYp q
(YYq r
)YYr s
=>YYt v
_enemyTetrominoZZ 
=ZZ  !
JsonConvertZZ" -
.ZZ- .
DeserializeObjectZZ. ?
<ZZ? @
TetrominoJsonObjectZZ@ S
>ZZS T
(ZZT U
	tetrominoZZU ^
)ZZ^ _
)ZZ_ `
)ZZ` a
)ZZa b
;ZZb c
	singleton[[ 
.[[ 
GetConnection[[ #
([[# $
)[[$ %
.[[% &
On[[& (
<[[( )
string[[) /
>[[/ 0
([[0 1
$str[[1 D
,[[D E
	tetromino[[F O
=>[[P R

Dispatcher[[S ]
.[[] ^
BeginInvoke[[^ i
([[i j
new[[j m
Action[[n t
([[t u
([[u v
)[[v w
=>[[x z
_enemyNextTetromino\\ #
=\\$ %
JsonConvert\\& 1
.\\1 2
DeserializeObject\\2 C
<\\C D
TetrominoJsonObject\\D W
>\\W X
(\\X Y
	tetromino\\Y b
)\\b c
)\\c d
)\\d e
)\\e f
;\\f g
	singleton]] 
.]] 
GetConnection]] #
(]]# $
)]]$ %
.]]% &
On]]& (
<]]( )
string]]) /
>]]/ 0
(]]0 1
$str]]1 <
,]]< =
score]]> C
=>]]D F

Dispatcher]]G Q
.]]Q R
BeginInvoke]]R ]
(]]] ^
new]]^ a
Action]]b h
(]]h i
(]]i j
)]]j k
=>]]l n
GetEnemyScore^^ 
(^^ 
score^^ "
)^^" #
)^^# $
)^^$ %
)^^% &
;^^& '
	singleton__ 
.__ 
GetConnection__ #
(__# $
)__$ %
.__% &
On__& (
<__( )
bool__) -
>__- .
(__. /
$str__/ ?
,__? @
status__A G
=>__H J

Dispatcher__K U
.__U V
BeginInvoke__V a
(__a b
new__b e
Action__f l
(__l m
(__m n
)__n o
=>__p r
_enemyGameOver`` 
=``  
status``! '
)``' (
)``( )
)``) *
;``* +
}aa 	
privatecc 
voidcc 
GetEnemyScorecc "
(cc" #
Stringcc# )
scorecc* /
)cc/ 0
{dd 	
_enemyScoreee 
=ee 
JsonConvertee %
.ee% &
DeserializeObjectee& 7
<ee7 8
Scoreee8 =
>ee= >
(ee> ?
scoreee? D
)eeD E
;eeE F
ifff 
(ff 
_enemyScoreff 
!=ff 
nullff #
&&ff$ &
_enemyScoreff' 2
.ff2 3
Levelff3 8
>ff9 :
_engineff; B
.ffB C
ScoreffC H
.ffH I
LevelffI N
)ffN O
{gg 
_enginehh 
.hh 
Scorehh 
.hh 
ForceLevelUpdatehh .
=hh/ 0
truehh1 5
;hh5 6
}ii 
}jj 	
privatell 
voidll 
	StartGamell 
(ll 
intll "
seedll# '
)ll' (
{mm 	

Dispatchernn 
.nn 
Invokenn 
(nn 
(nn 
)nn  
=>nn! #
{nn$ %
ReadyButtonnn& 1
.nn1 2

Visibilitynn2 <
=nn= >

Visibilitynn? I
.nnI J
HiddennnJ P
;nnP Q
}nnR S
)nnS T
;nnT U

Dispatcheroo 
.oo 
Invokeoo 
(oo 
(oo 
)oo  
=>oo! #
{oo$ %
ReadyButtonoo& 1
.oo1 2

Visibilityoo2 <
=oo= >

Visibilityoo? I
.ooI J
HiddenooJ P
;ooP Q
}ooR S
)ooS T
;ooT U
_enginepp 
.pp 
	StartGamepp 
(pp 
seedpp "
)pp" #
;pp# $
_subjectqq 
.qq 
	Subscribeqq 
(qq 
_engineqq &
.qq& '
	Tetrominoqq' 0
)qq0 1
;qq1 2
Timerrr 
(rr 
)rr 
;rr 
}ss 	
privateuu 
voiduu 
StopGameuu 
(uu 
)uu 
{vv 	
_engineww 
.ww 
StopGameww 
(ww 
)ww 
;ww 
}xx 	
private~~ 
void~~ 
Timer~~ 
(~~ 
)~~ 
{ 	
_renderTimer
ÄÄ 
=
ÄÄ 
new
ÄÄ 
DispatcherTimer
ÄÄ .
(
ÄÄ. /
)
ÄÄ/ 0
;
ÄÄ0 1
_renderTimer
ÅÅ 
.
ÅÅ 
Tick
ÅÅ 
+=
ÅÅ  "
dispatcherTimer_Tick
ÅÅ! 5
;
ÅÅ5 6
_renderTimer
ÇÇ 
.
ÇÇ 
Interval
ÇÇ !
=
ÇÇ" #
new
ÇÇ$ '
TimeSpan
ÇÇ( 0
(
ÇÇ0 1
$num
ÇÇ1 2
,
ÇÇ2 3
$num
ÇÇ4 5
,
ÇÇ5 6
$num
ÇÇ7 8
,
ÇÇ8 9
$num
ÇÇ: ;
,
ÇÇ; <
$num
ÇÇ= ?
)
ÇÇ? @
;
ÇÇ@ A
_renderTimer
ÉÉ 
.
ÉÉ 
Start
ÉÉ 
(
ÉÉ 
)
ÉÉ  
;
ÉÉ  !
}
ÑÑ 	
private
çç 
void
çç "
dispatcherTimer_Tick
çç )
(
çç) *
object
çç* 0
sender
çç1 7
,
çç7 8
	EventArgs
çç9 B
e
ççC D
)
ççD E
=>
ççF H

UpdateGame
ççI S
(
ççS T
)
ççT U
;
ççU V
private
ññ 
void
ññ 

UpdateGame
ññ 
(
ññ  
)
ññ  !
{
óó 	
SendData
òò 
(
òò 
)
òò 
;
òò 
CheckGameOver
ôô 
(
ôô 
)
ôô 
;
ôô 
SetTextBlocks
öö 
(
öö 
)
öö 
;
öö 

RenderGrid
õõ 
(
õõ 
)
õõ 
;
õõ 
SetBombButton
úú 
(
úú 
)
úú 
;
úú 
SetEvilBombButton
ùù 
(
ùù 
)
ùù 
;
ùù  
}
ûû 	
private
†† 
void
†† 
SetBombButton
†† "
(
††" #
)
††# $
{
°° 	
Bombs
¢¢ 
bomb
¢¢ 
=
¢¢ 
_engine
¢¢  
.
¢¢  !
GetBomb
¢¢! (
(
¢¢( )
)
¢¢) *
;
¢¢* +
Facade
££ 
facade
££ 
=
££ 
new
££ 
Facade
££  &
(
££& '
bomb
££' +
)
££+ ,
;
££, -
Target
§§ 
	angelBomb
§§ 
=
§§ 
new
§§ "
Adapter
§§# *
(
§§* +
$str
§§+ 2
,
§§2 3
_engine
§§4 ;
.
§§; <
Score
§§< A
.
§§A B
Level
§§B G
)
§§G H
;
§§H I
if
•• 
(
•• 
_engine
•• 
.
•• 
Score
•• 
.
•• 
Points
•• $
>=
••% '
	angelBomb
••( 1
.
••1 2(
GetInformationCurrentScore
••2 L
(
••L M
)
••M N
)
••N O
{
¶¶ 

BombButton
ßß 
.
ßß 
	IsEnabled
ßß $
=
ßß% &
true
ßß' +
;
ßß+ ,
BombButtonImage
©© 
.
©©  
Source
©©  &
=
©©' (
new
©©) ,
BitmapImage
©©- 8
(
©©8 9
new
©©9 <
Uri
©©= @
(
©©@ A
FacadeClient
©©A M
.
©©M N
ClientEnableBomb
©©N ^
(
©©^ _
facade
©©_ e
)
©©e f
,
©©f g
UriKind
©©h o
.
©©o p
Relative
©©p x
)
©©x y
)
©©y z
;
©©z {
}
™™ 
else
´´ 
{
¨¨ 

BombButton
≠≠ 
.
≠≠ 
	IsEnabled
≠≠ $
=
≠≠% &
false
≠≠' ,
;
≠≠, -
BombButtonImage
ØØ 
.
ØØ  
Source
ØØ  &
=
ØØ' (
new
ØØ) ,
BitmapImage
ØØ- 8
(
ØØ8 9
new
ØØ9 <
Uri
ØØ= @
(
ØØ@ A
FacadeClient
ØØA M
.
ØØM N
ClientDisableBomb
ØØN _
(
ØØ_ `
facade
ØØ` f
)
ØØf g
,
ØØg h
UriKind
ØØi p
.
ØØp q
Relative
ØØq y
)
ØØy z
)
ØØz {
;
ØØ{ |
}
∞∞ 
}
±± 	
private
≥≥ 
void
≥≥ 
SetEvilBombButton
≥≥ &
(
≥≥& '
)
≥≥' (
{
¥¥ 	
Bombs
µµ 
evilBomb
µµ 
=
µµ 
_engine
µµ $
.
µµ$ %
GetEvilBomb
µµ% 0
(
µµ0 1
)
µµ1 2
;
µµ2 3
Facade
∂∂ 
facade
∂∂ 
=
∂∂ 
new
∂∂ 
Facade
∂∂  &
(
∂∂& '
evilBomb
∂∂' /
)
∂∂/ 0
;
∂∂0 1
Target
∑∑ 
	devilBomb
∑∑ 
=
∑∑ 
new
∑∑ "
Adapter
∑∑# *
(
∑∑* +
$str
∑∑+ 2
,
∑∑2 3
_engine
∑∑4 ;
.
∑∑; <
Score
∑∑< A
.
∑∑A B
Level
∑∑B G
)
∑∑G H
;
∑∑H I
if
∏∏ 
(
∏∏ 
_engine
∏∏ 
.
∏∏ 
Score
∏∏ 
.
∏∏ 
Points
∏∏ $
>=
∏∏% '
	devilBomb
∏∏( 1
.
∏∏1 2(
GetInformationCurrentScore
∏∏2 L
(
∏∏L M
)
∏∏M N
)
∏∏N O
{
ππ 
BombEvilButton
∫∫ 
.
∫∫ 
	IsEnabled
∫∫ (
=
∫∫) *
true
∫∫+ /
;
∫∫/ 0!
BombEvilButtonImage
ºº #
.
ºº# $
Source
ºº$ *
=
ºº+ ,
new
ºº- 0
BitmapImage
ºº1 <
(
ºº< =
new
ºº= @
Uri
ººA D
(
ººD E
FacadeClient
ººE Q
.
ººQ R
ClientEnableBomb
ººR b
(
ººb c
facade
ººc i
)
ººi j
,
ººj k
UriKind
ººl s
.
ººs t
Relative
ººt |
)
ºº| }
)
ºº} ~
;
ºº~ 
}
ΩΩ 
else
ææ 
{
øø 
BombEvilButton
¿¿ 
.
¿¿ 
	IsEnabled
¿¿ (
=
¿¿) *
false
¿¿+ 0
;
¿¿0 1!
BombEvilButtonImage
¬¬ #
.
¬¬# $
Source
¬¬$ *
=
¬¬+ ,
new
¬¬- 0
BitmapImage
¬¬1 <
(
¬¬< =
new
¬¬= @
Uri
¬¬A D
(
¬¬D E
FacadeClient
¬¬E Q
.
¬¬Q R
ClientDisableBomb
¬¬R c
(
¬¬c d
facade
¬¬d j
)
¬¬j k
,
¬¬k l
UriKind
¬¬m t
.
¬¬t u
Relative
¬¬u }
)
¬¬} ~
)
¬¬~ 
;¬¬ Ä
}
√√ 
}
ƒƒ 	
private
…… 
void
…… 
SendData
…… 
(
…… 
)
…… 
{
   	
	Singleton
ÀÀ 
	singleton
ÀÀ 
=
ÀÀ  !
	Singleton
ÀÀ" +
.
ÀÀ+ ,
GetInstance
ÀÀ, 7
(
ÀÀ7 8
)
ÀÀ8 9
;
ÀÀ9 :
Task
ÃÃ 
.
ÃÃ 
Run
ÃÃ 
(
ÃÃ 
async
ÃÃ 
(
ÃÃ 
)
ÃÃ 
=>
ÃÃ  
await
ÕÕ	 
	singleton
ÕÕ 
.
ÕÕ 
GetConnection
ÕÕ &
(
ÕÕ& '
)
ÕÕ' (
.
ÕÕ( )
InvokeAsync
ÕÕ) 4
(
ÕÕ4 5
$str
ÕÕ5 @
,
ÕÕ@ A
JsonConvert
ÕÕB M
.
ÕÕM N
SerializeObject
ÕÕN ]
(
ÕÕ] ^
_engine
ÕÕ^ e
.
ÕÕe f
Score
ÕÕf k
)
ÕÕk l
)
ÕÕl m
)
ÕÕm n
;
ÕÕn o
Task
ŒŒ 
.
ŒŒ 
Run
ŒŒ 
(
ŒŒ 
async
ŒŒ 
(
ŒŒ 
)
ŒŒ 
=>
ŒŒ  
await
œœ 
	singleton
œœ 
.
œœ  
GetConnection
œœ  -
(
œœ- .
)
œœ. /
.
œœ/ 0
InvokeAsync
œœ0 ;
(
œœ; <
$str
œœ< G
,
œœG H
JsonConvert
œœI T
.
œœT U
SerializeObject
œœU d
(
œœd e
_engine
œœe l
.
œœl m
Representation
œœm {
.
œœ{ |
Boardœœ| Å
)œœÅ Ç
)œœÇ É
)œœÉ Ñ
;œœÑ Ö
Task
–– 
.
–– 
Run
–– 
(
–– 
async
–– 
(
–– 
)
–– 
=>
––  
await
—— 
	singleton
—— 
.
——  
GetConnection
——  -
(
——- .
)
——. /
.
——/ 0
InvokeAsync
——0 ;
(
——; <
$str
——< K
,
——K L
JsonConvert
——M X
.
——X Y
SerializeObject
——Y h
(
——h i
_engine
——i p
.
——p q
	Tetromino
——q z
)
——z {
)
——{ |
)
——| }
;
——} ~
Task
““ 
.
““ 
Run
““ 
(
““ 
async
““ 
(
““ 
)
““ 
=>
““  
await
”” 
	singleton
”” 
.
””  
GetConnection
””  -
(
””- .
)
””. /
.
””/ 0
InvokeAsync
””0 ;
(
””; <
$str
””< L
,
””L M
_engine
””N U
.
””U V
GameOver
””V ^
)
””^ _
)
””_ `
;
””` a
Task
‘‘ 
.
‘‘ 
Run
‘‘ 
(
‘‘ 
async
‘‘ 
(
‘‘ 
)
‘‘ 
=>
‘‘  
await
’’ 
	singleton
’’ 
.
’’  
GetConnection
’’  -
(
’’- .
)
’’. /
.
’’/ 0
InvokeAsync
’’0 ;
(
’’; <
$str
’’< O
,
’’O P
JsonConvert
’’Q \
.
’’\ ]
SerializeObject
’’] l
(
’’l m
_engine
’’m t
.
’’t u
NextTetromino’’u Ç
)’’Ç É
)’’É Ñ
)’’Ñ Ö
;’’Ö Ü
}
÷÷ 	
private
‹‹ 
void
‹‹ 
CheckGameOver
‹‹ "
(
‹‹" #
)
‹‹# $
{
›› 	
if
ﬁﬁ 
(
ﬁﬁ 
_engine
ﬁﬁ 
.
ﬁﬁ 
GameOver
ﬁﬁ  
)
ﬁﬁ  !
{
ﬂﬂ 

Dispatcher
‡‡ 
.
‡‡ 
Invoke
‡‡ !
(
‡‡! "
(
‡‡" #
)
‡‡# $
=>
‡‡% '
{
‡‡( )
GameOverTextP1
‡‡* 8
.
‡‡8 9

Visibility
‡‡9 C
=
‡‡D E

Visibility
‡‡F P
.
‡‡P Q
Visible
‡‡Q X
;
‡‡X Y
}
‡‡Z [
)
‡‡[ \
;
‡‡\ ]

Dispatcher
·· 
.
·· 
Invoke
·· !
(
··! "
(
··" #
)
··# $
=>
··% '
{
··( )
YouWonTextP2
··* 6
.
··6 7

Visibility
··7 A
=
··B C

Visibility
··D N
.
··N O
Visible
··O V
;
··V W
}
··X Y
)
··Y Z
;
··Z [
}
‚‚ 
if
‰‰ 
(
‰‰ 
_enemyGameOver
‰‰ 
)
‰‰ 
{
ÂÂ 

Dispatcher
ÊÊ 
.
ÊÊ 
Invoke
ÊÊ !
(
ÊÊ! "
(
ÊÊ" #
)
ÊÊ# $
=>
ÊÊ% '
{
ÊÊ( )
GameOverTextP2
ÊÊ* 8
.
ÊÊ8 9

Visibility
ÊÊ9 C
=
ÊÊD E

Visibility
ÊÊF P
.
ÊÊP Q
Visible
ÊÊQ X
;
ÊÊX Y
}
ÊÊZ [
)
ÊÊ[ \
;
ÊÊ\ ]

Dispatcher
ÁÁ 
.
ÁÁ 
Invoke
ÁÁ !
(
ÁÁ! "
(
ÁÁ" #
)
ÁÁ# $
=>
ÁÁ% '
{
ÁÁ( )
YouWonTextP1
ÁÁ* 6
.
ÁÁ6 7

Visibility
ÁÁ7 A
=
ÁÁB C

Visibility
ÁÁD N
.
ÁÁN O
Visible
ÁÁO V
;
ÁÁV W
}
ÁÁX Y
)
ÁÁY Z
;
ÁÁZ [
StopGame
ËË 
(
ËË 
)
ËË 
;
ËË 
}
ÈÈ 
}
ÍÍ 	
private
ÏÏ 
void
ÏÏ 
SetTextBlocks
ÏÏ "
(
ÏÏ" #
)
ÏÏ# $
{
ÌÌ 	
LevelTextBlockP1
ÓÓ 
.
ÓÓ 
Text
ÓÓ !
=
ÓÓ" #
$"
ÓÓ$ &
{
ÓÓ& '
_engine
ÓÓ' .
.
ÓÓ. /
Score
ÓÓ/ 4
.
ÓÓ4 5
Level
ÓÓ5 :
}
ÓÓ: ;
"
ÓÓ; <
;
ÓÓ< =
ScoreTextBlockP1
ÔÔ 
.
ÔÔ 
Text
ÔÔ !
=
ÔÔ" #
$"
ÔÔ$ &
{
ÔÔ& '
_engine
ÔÔ' .
.
ÔÔ. /
Score
ÔÔ/ 4
.
ÔÔ4 5
Points
ÔÔ5 ;
}
ÔÔ; <
"
ÔÔ< =
;
ÔÔ= >
LinesTextBlockP1
 
.
 
Text
 !
=
" #
$"
$ &
{
& '
_engine
' .
.
. /
Score
/ 4
.
4 5
Rows
5 9
}
9 :
"
: ;
;
; <
if
ÚÚ 
(
ÚÚ 
_enemyScore
ÚÚ 
==
ÚÚ 
null
ÚÚ #
)
ÚÚ# $
return
ÚÚ% +
;
ÚÚ+ ,
LevelTextBlockP2
ÛÛ 
.
ÛÛ 
Text
ÛÛ !
=
ÛÛ" #
$"
ÛÛ$ &
{
ÛÛ& '
_enemyScore
ÛÛ' 2
.
ÛÛ2 3
Level
ÛÛ3 8
}
ÛÛ8 9
"
ÛÛ9 :
;
ÛÛ: ;
ScoreTextBlockP2
ÙÙ 
.
ÙÙ 
Text
ÙÙ !
=
ÙÙ" #
$"
ÙÙ$ &
{
ÙÙ& '
_enemyScore
ÙÙ' 2
.
ÙÙ2 3
Points
ÙÙ3 9
}
ÙÙ9 :
"
ÙÙ: ;
;
ÙÙ; <
LinesTextBlockP2
ıı 
.
ıı 
Text
ıı !
=
ıı" #
$"
ıı$ &
{
ıı& '
_enemyScore
ıı' 2
.
ıı2 3
Rows
ıı3 7
}
ıı7 8
"
ıı8 9
;
ıı9 :
}
ˆˆ 	
private
˚˚ 
void
˚˚ 

RenderGrid
˚˚ 
(
˚˚  
)
˚˚  !
{
¸¸ 	
TetrisGridP1
˝˝ 
.
˝˝ 
Children
˝˝ !
.
˝˝! "
Clear
˝˝" '
(
˝˝' (
)
˝˝( )
;
˝˝) *$
RenderLandedTetrominos
˛˛ "
(
˛˛" #
TetrisGridP1
˛˛# /
)
˛˛/ 0
;
˛˛0 1
if
ÄÄ 
(
ÄÄ 
_enemyBoard
ÄÄ 
!=
ÄÄ 
null
ÄÄ #
)
ÄÄ# $
{
ÅÅ 
TetrisGridP2
ÇÇ 
.
ÇÇ 
Children
ÇÇ %
.
ÇÇ% &
Clear
ÇÇ& +
(
ÇÇ+ ,
)
ÇÇ, -
;
ÇÇ- .$
RenderLandedTetrominos
ÉÉ &
(
ÉÉ& '
TetrisGridP2
ÉÉ' 3
,
ÉÉ3 4
_enemyBoard
ÉÉ5 @
)
ÉÉ@ A
;
ÉÉA B
}
ÑÑ 
RenderTetromino
ÜÜ 
(
ÜÜ 
_engine
ÜÜ #
.
ÜÜ# $
	Tetromino
ÜÜ$ -
,
ÜÜ- .
TetrisGridP1
ÜÜ/ ;
)
ÜÜ; <
;
ÜÜ< =
RenderTetromino
áá 
(
áá 
_engine
áá #
.
áá# $"
CreateGhostTetromino
áá$ 8
(
áá8 9
)
áá9 :
,
áá: ;
TetrisGridP1
áá< H
,
ááH I
$num
ááJ N
)
ááN O
;
ááO P
if
ââ 
(
ââ 
_enemyTetromino
ââ 
!=
ââ  "
null
ââ# '
)
ââ' (
RenderTetromino
ää 
(
ää  
_enemyTetromino
ää  /
,
ää/ 0
TetrisGridP2
ää1 =
)
ää= >
;
ää> ?

NextGridP1
çç 
.
çç 
Children
çç 
.
çç  
Clear
çç  %
(
çç% &
)
çç& '
;
çç' (
RenderTetromino
éé 
(
éé 
_engine
éé #
.
éé# $
NextTetromino
éé$ 1
,
éé1 2

NextGridP1
éé3 =
)
éé= >
;
éé> ?
if
êê 
(
êê !
_enemyNextTetromino
êê #
==
êê$ &
null
êê' +
)
êê+ ,
return
êê- 3
;
êê3 4

NextGridP2
ëë 
.
ëë 
Children
ëë 
.
ëë  
Clear
ëë  %
(
ëë% &
)
ëë& '
;
ëë' (
RenderTetromino
íí 
(
íí !
_enemyNextTetromino
íí /
,
íí/ 0

NextGridP2
íí1 ;
)
íí; <
;
íí< =
}
ìì 	
private
ùù 
void
ùù 
RenderTetromino
ùù $
(
ùù$ %
TetrominoFigure
ùù% 4
	tetromino
ùù5 >
,
ùù> ?
Panel
ùù@ E
grid
ùùF J
,
ùùJ K
double
ùùL R
opacity
ùùS Z
=
ùù[ \
$num
ùù] ^
)
ùù^ _
{
ûû 	
	tetromino
üü 
.
üü  
CalculatePositions
üü (
(
üü( )
)
üü) *
.
üü* +
ForEach
üü+ 2
(
üü2 3

coordinate
üü3 =
=>
üü> @
{
†† 
var
°° 
(
°° 
y
°° 
,
°° 
x
°° 
)
°° 
=
°° 

coordinate
°° '
;
°°' (
var
¢¢ 
shapeRectangle
¢¢ "
=
¢¢# $
	tetromino
¢¢% .
.
¢¢. /
Matrix
¢¢/ 5
.
¢¢5 6
Value
¢¢6 ;
[
¢¢; <
y
¢¢< =
-
¢¢> ?
	tetromino
¢¢@ I
.
¢¢I J
OffsetY
¢¢J Q
,
¢¢Q R
x
¢¢S T
-
¢¢U V
	tetromino
¢¢W `
.
¢¢` a
OffsetX
¢¢a h
]
¢¢h i
;
¢¢i j
var
££ 
	rectangle
££ 
=
££ 
CreateRectangle
££  /
(
££/ 0
TetrominoBrushes
££0 @
.
££@ A

BrushArray
££A K
[
££K L
shapeRectangle
££L Z
]
££Z [
,
££[ \
opacity
££] d
)
££d e
;
££e f
grid
§§ 
?
§§ 
.
§§ 
Children
§§ 
.
§§ 
Add
§§ "
(
§§" #
	rectangle
§§# ,
)
§§, -
;
§§- .
Grid
¶¶ 
.
¶¶ 
SetRow
¶¶ 
(
¶¶ 
	rectangle
¶¶ %
,
¶¶% &
y
¶¶' (
)
¶¶( )
;
¶¶) *
Grid
ßß 
.
ßß 
	SetColumn
ßß 
(
ßß 
	rectangle
ßß (
,
ßß( )
grid
ßß* .
!=
ßß/ 1

NextGridP1
ßß2 <
&&
ßß= ?
grid
ßß@ D
!=
ßßE G

NextGridP2
ßßH R
?
ßßS T
x
ßßU V
:
ßßW X
x
ßßY Z
-
ßß[ \
$num
ßß] ^
)
ßß^ _
;
ßß_ `
}
®® 
)
®® 
;
®® 
}
©© 	
private
´´ 
void
´´ 
RenderTetromino
´´ $
(
´´$ %!
TetrominoJsonObject
´´% 8
	tetromino
´´9 B
,
´´B C
Panel
´´D I
grid
´´J N
,
´´N O
double
´´P V
opacity
´´W ^
=
´´_ `
$num
´´a b
)
´´b c
{
¨¨ 	
Creator
≠≠ 
creator
≠≠ 
=
≠≠ 
new
≠≠ !
LevelCreator
≠≠" .
(
≠≠. /
)
≠≠/ 0
;
≠≠0 1
Level
ÆÆ 
level
ÆÆ 
=
ÆÆ 
creator
ÆÆ !
.
ÆÆ! "
GetLevel
ÆÆ" *
(
ÆÆ* +
_enemyScore
ÆÆ+ 6
.
ÆÆ6 7
Level
ÆÆ7 <
)
ÆÆ< =
;
ÆÆ= >
AbstractFactory
ØØ 
abstractFactory
ØØ +
=
ØØ, -
level
ØØ. 3
.
ØØ3 4 
GetAbstractFactory
ØØ4 F
(
ØØF G
)
ØØG H
;
ØØH I
TetrominoFigure
∞∞  
generatedTetromino
∞∞ .
=
∞∞/ 0
(
∞∞1 2
TetrominoFigure
∞∞2 A
)
∞∞A B
abstractFactory
∞∞B Q
.
∞∞Q R
GetTetromino
∞∞R ^
(
∞∞^ _
	tetromino
∞∞_ h
.
∞∞h i
OffsetX
∞∞i p
,
∞∞p q
	tetromino
∞∞r {
.
∞∞{ |
OffsetY∞∞| É
,∞∞É Ñ
	tetromino∞∞Ö é
.∞∞é è
Matrix∞∞è ï
)∞∞ï ñ
;∞∞ñ ó
RenderTetromino
±± 
(
±±  
generatedTetromino
±± .
,
±±. /
grid
±±0 4
,
±±4 5
opacity
±±6 =
)
±±= >
;
±±> ?
}
≤≤ 	
private
∑∑ 
void
∑∑ $
RenderLandedTetrominos
∑∑ +
(
∑∑+ ,
Panel
∑∑, 1
grid
∑∑2 6
,
∑∑6 7
int
∑∑8 ;
[
∑∑; <
,
∑∑< =
]
∑∑= >
board
∑∑? D
=
∑∑E F
null
∑∑G K
)
∑∑K L
{
∏∏ 	
board
ππ 
??=
ππ 
_engine
ππ 
.
ππ 
Representation
ππ ,
.
ππ, -
Board
ππ- 2
;
ππ2 3
for
ªª 
(
ªª 
var
ªª 
y
ªª 
=
ªª 
$num
ªª 
;
ªª 
y
ªª 
<
ªª 
board
ªª  %
.
ªª% &
	GetLength
ªª& /
(
ªª/ 0
$num
ªª0 1
)
ªª1 2
;
ªª2 3
y
ªª4 5
++
ªª5 7
)
ªª7 8
for
ºº 
(
ºº 
var
ºº 
x
ºº 
=
ºº 
$num
ºº 
;
ºº 
x
ºº  !
<
ºº" #
board
ºº$ )
.
ºº) *
	GetLength
ºº* 3
(
ºº3 4
$num
ºº4 5
)
ºº5 6
;
ºº6 7
x
ºº8 9
++
ºº9 ;
)
ºº; <
{
ΩΩ 
var
ææ 
block
ææ 
=
ææ 
board
ææ  %
[
ææ% &
y
ææ& '
,
ææ' (
x
ææ) *
]
ææ* +
;
ææ+ ,
if
øø 
(
øø 
block
øø 
==
øø  
$num
øø! "
)
øø" #
continue
øø$ ,
;
øø, -
var
¡¡ 
	rectangle
¡¡ !
=
¡¡" #
CreateRectangle
¡¡$ 3
(
¡¡3 4
TetrominoBrushes
¡¡4 D
.
¡¡D E

BrushArray
¡¡E O
[
¡¡O P
board
¡¡P U
[
¡¡U V
y
¡¡V W
,
¡¡W X
x
¡¡Y Z
]
¡¡Z [
]
¡¡[ \
)
¡¡\ ]
;
¡¡] ^
grid
¬¬ 
.
¬¬ 
Children
¬¬ !
.
¬¬! "
Add
¬¬" %
(
¬¬% &
	rectangle
¬¬& /
)
¬¬/ 0
;
¬¬0 1
Grid
ƒƒ 
.
ƒƒ 
SetRow
ƒƒ 
(
ƒƒ  
	rectangle
ƒƒ  )
,
ƒƒ) *
y
ƒƒ+ ,
)
ƒƒ, -
;
ƒƒ- .
Grid
≈≈ 
.
≈≈ 
	SetColumn
≈≈ "
(
≈≈" #
	rectangle
≈≈# ,
,
≈≈, -
x
≈≈. /
)
≈≈/ 0
;
≈≈0 1
}
∆∆ 
}
«« 	
private
œœ 
static
œœ 
	Rectangle
œœ  
CreateRectangle
œœ! 0
(
œœ0 1
Brush
œœ1 6
color
œœ7 <
,
œœ< =
double
œœ> D
opacity
œœE L
=
œœM N
$num
œœO P
)
œœP Q
=>
œœR T
new
œœU X
(
œœX Y
)
œœY Z
{
–– 	
Width
—— 
=
—— 
$num
—— 
,
—— 
Height
““ 
=
““ 
$num
““ 
,
““ 
Stroke
”” 
=
”” 
Brushes
”” 
.
”” 
Black
”” "
,
””" #
StrokeThickness
‘‘ 
=
‘‘ 
$num
‘‘ "
,
‘‘" #
Fill
’’ 
=
’’ 
color
’’ 
,
’’ 
Opacity
÷÷ 
=
÷÷ 
opacity
÷÷ 
}
◊◊ 	
;
◊◊	 

	protected
ﬁﬁ 
override
ﬁﬁ 
void
ﬁﬁ 
	OnKeyDown
ﬁﬁ  )
(
ﬁﬁ) *
KeyEventArgs
ﬁﬁ* 6
e
ﬁﬁ7 8
)
ﬁﬁ8 9
{
ﬂﬂ 	
if
‡‡ 
(
‡‡ 
!
‡‡ 
_renderTimer
‡‡ 
.
‡‡ 
	IsEnabled
‡‡ '
)
‡‡' (
return
‡‡) /
;
‡‡/ 0
if
·· 
(
·· 
_engine
·· 
.
·· 
GameOver
··  
)
··  !
return
··" (
;
··( )
switch
‰‰ 
(
‰‰ 
e
‰‰ 
.
‰‰ 
Key
‰‰ 
)
‰‰ 
{
ÂÂ 
case
ÊÊ 
Key
ÊÊ 
.
ÊÊ 
Right
ÊÊ 
:
ÊÊ 
_sound2
ÁÁ 
.
ÁÁ 
Play
ÁÁ  
(
ÁÁ  !
)
ÁÁ! "
;
ÁÁ" #
_engine
ËË 
.
ËË 
	MoveRight
ËË %
(
ËË% &
)
ËË& '
;
ËË' (
break
ÈÈ 
;
ÈÈ 
case
ÍÍ 
Key
ÍÍ 
.
ÍÍ 
Left
ÍÍ 
:
ÍÍ 
_sound2
ÎÎ 
.
ÎÎ 
Play
ÎÎ  
(
ÎÎ  !
)
ÎÎ! "
;
ÎÎ" #
_engine
ÏÏ 
.
ÏÏ 
MoveLeft
ÏÏ $
(
ÏÏ$ %
)
ÏÏ% &
;
ÏÏ& '
break
ÌÌ 
;
ÌÌ 
case
ÓÓ 
Key
ÓÓ 
.
ÓÓ 
Up
ÓÓ 
:
ÓÓ 
_sound2
ÔÔ 
.
ÔÔ 
Play
ÔÔ  
(
ÔÔ  !
)
ÔÔ! "
;
ÔÔ" #
_engine
 
.
 
	Tetromino
 %
.
% &
SetStrategy
& 1
(
1 2
new
2 5

RotationUp
6 @
(
@ A
_engine
A H
.
H I
AbstractFactory
I X
,
X Y
_engine
Z a
.
a b
	Tetromino
b k
,
k l
_engine
m t
.
t u
Representationu É
)É Ñ
)Ñ Ö
;Ö Ü
_engine
ÒÒ 
.
ÒÒ 
	Tetromino
ÒÒ %
.
ÒÒ% &
Action
ÒÒ& ,
(
ÒÒ, -
)
ÒÒ- .
;
ÒÒ. /
break
ÛÛ 
;
ÛÛ 
case
ÙÙ 
Key
ÙÙ 
.
ÙÙ 
Down
ÙÙ 
:
ÙÙ 
_sound2
ıı 
.
ıı 
Play
ıı  
(
ıı  !
)
ıı! "
;
ıı" #
_engine
ˆˆ 
.
ˆˆ 
	Tetromino
ˆˆ %
.
ˆˆ% &
SetStrategy
ˆˆ& 1
(
ˆˆ1 2
new
ˆˆ2 5
RotationDown
ˆˆ6 B
(
ˆˆB C
_engine
ˆˆC J
.
ˆˆJ K
AbstractFactory
ˆˆK Z
,
ˆˆZ [
_engine
ˆˆ\ c
.
ˆˆc d
	Tetromino
ˆˆd m
,
ˆˆm n
_engine
ˆˆo v
.
ˆˆv w
Representationˆˆw Ö
)ˆˆÖ Ü
)ˆˆÜ á
;ˆˆá à
_engine
˜˜ 
.
˜˜ 
	Tetromino
˜˜ %
.
˜˜% &
Action
˜˜& ,
(
˜˜, -
)
˜˜- .
;
˜˜. /
break
˘˘ 
;
˘˘ 
case
˙˙ 
Key
˙˙ 
.
˙˙ 
Space
˙˙ 
:
˙˙ 
_sound1
˚˚ 
.
˚˚ 
Play
˚˚  
(
˚˚  !
)
˚˚! "
;
˚˚" #
_engine
¸¸ 
.
¸¸ 
	Tetromino
¸¸ %
.
¸¸% &
SetStrategy
¸¸& 1
(
¸¸1 2
new
¸¸2 5
HardDrop
¸¸6 >
(
¸¸> ?
_engine
¸¸? F
.
¸¸F G
AbstractFactory
¸¸G V
,
¸¸V W
_engine
¸¸X _
.
¸¸_ `
	Tetromino
¸¸` i
,
¸¸i j
_engine
¸¸k r
.
¸¸r s
Representation¸¸s Å
)¸¸Å Ç
)¸¸Ç É
;¸¸É Ñ
_engine
˝˝ 
.
˝˝ 
	Tetromino
˝˝ %
.
˝˝% &
Action
˝˝& ,
(
˝˝, -
)
˝˝- .
;
˝˝. /
break
ˇˇ 
;
ˇˇ 
case
ÄÄ 
Key
ÄÄ 
.
ÄÄ 
	LeftShift
ÄÄ "
:
ÄÄ" #
_sound2
ÅÅ 
.
ÅÅ 
Play
ÅÅ  
(
ÅÅ  !
)
ÅÅ! "
;
ÅÅ" #
_engine
ÇÇ 
.
ÇÇ 
	Tetromino
ÇÇ %
.
ÇÇ% &
SetStrategy
ÇÇ& 1
(
ÇÇ1 2
new
ÇÇ2 5
SoftDrop
ÇÇ6 >
(
ÇÇ> ?
_engine
ÇÇ? F
.
ÇÇF G
AbstractFactory
ÇÇG V
,
ÇÇV W
_engine
ÇÇX _
.
ÇÇ_ `
	Tetromino
ÇÇ` i
,
ÇÇi j
_engine
ÇÇk r
.
ÇÇr s
RepresentationÇÇs Å
)ÇÇÅ Ç
)ÇÇÇ É
;ÇÇÉ Ñ
_engine
ÉÉ 
.
ÉÉ 
	Tetromino
ÉÉ %
.
ÉÉ% &
Action
ÉÉ& ,
(
ÉÉ, -
)
ÉÉ- .
;
ÉÉ. /
break
ÖÖ 
;
ÖÖ 
case
ÜÜ 
Key
ÜÜ 
.
ÜÜ 
Z
ÜÜ 
:
ÜÜ 
_engine
áá 
.
áá 
Undo
áá  
(
áá  !
)
áá! "
;
áá" #
break
àà 
;
àà 
case
ââ 
Key
ââ 
.
ââ 
B
ââ 
:
ââ 
_engine
ää 
.
ää 
	AngelBomb
ää %
(
ää% &
)
ää& '
;
ää' (
break
ãã 
;
ãã 
default
åå 
:
åå 
return
çç 
;
çç 
}
éé 

UpdateGame
èè 
(
èè 
)
èè 
;
èè 
}
êê 	
}
ëë 
}íí ‡
hC:\Users\pijus\OneDrive\Stalinis kompiuteris\Tetris v3\Tetris\TetrisClient\userInterface\Startup.xaml.cs
	namespace 	
TetrisClient
 
. 
userInterface $
{ 
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 

partial

 
class

 
Startup

  
{ 
private 
readonly 
SoundPlayer $

_themeSong% /
=0 1
new2 5
(6 7
	Resource17 @
.@ A
TetrisTechnoA M
)M N
;N O
public 
Startup 
( 
) 
{ 	
InitializeComponent 
(  
)  !
;! "

_themeSong 
. 
PlayLooping "
(" #
)# $
;$ %
} 	
private 
void 
HandleButtonClick &
(& '
object' -
sender. 4
,4 5
RoutedEventArgs6 E
routedEventArgsF U
)U V
{ 	

_themeSong 
. 
Stop 
( 
) 
; 
var 
button 
= 
( 
Button  
)  !
sender" (
;( )
Window 
window 
= 
( 
string #
)# $
button% +
.+ ,
Content, 3
switch4 :
{ 
$str 
=>  "
new# &

MainWindow' 1
(1 2
)2 3
,3 4
$str 
=>  
new! $
MultiplayerWindow% 6
(6 7
)7 8
,8 9
_ 
=> 
throw 
new 
	Exception (
(( )
$str) 9
)9 :
} 
; 
Hide 
( 
) 
; 
window   
.   
Closed   
+=   
(   
_   
,    
_  ! "
)  " #
=>  $ &
Close  ' ,
(  , -
)  - .
;  . /
window!! 
.!! 
Show!! 
(!! 
)!! 
;!! 
}"" 	
}## 
}$$ 