�
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
}		 �
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
 �
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
}** �
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
} �	
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
} �
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
}!! �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �*
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

removeLine	{ �
)
� �
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
}PP �O
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
abstractFactory	z �
,
� �
int
� �
remove
� �
)
� �
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
OffsetY	  y �
,
  � �

_tetromino
  � �
.
  � �
Matrix
  � �
)
  � �
;
  � �
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
OffsetY	22y �
,
22� �

_tetromino
22� �
.
22� �
Matrix
22� �
)
22� �
;
22� �
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
RR� �
;
RR� �
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
offsetInBoardY	VV| �
=
VV� �
$num
VV� �
,
VV� �
int
VV� �
offsetCollisionX
VV� �
=
VV� �
$num
VV� �
,
VV� �
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
}ff �"
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
abstractFactory	v �
,
� �
int
� �

removeLine
� �
)
� �
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
}:: �	
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
} �
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
} �
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
} �
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
} �
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
} �
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
}++ �

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
} �
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
} �
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
} �
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
}&& �
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
}'' �
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
} �
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
}22 �
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
 �
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
} �
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
} � 
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
}ee �"
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
Board	} �
)
� �
)
� �
)
� �
;
� �
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
NextTetromino	$$v �
)
$$� �
)
$$� �
)
$$� �
;
$$� �
this%% 
.%% 
Send%% 
(%% 
message%% 
)%% 
;%% 
}&& 	
}'' 
}(( �
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
} �
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
} ��
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
�� 	
for
�� 
(
�� 
var
�� 
y
�� 
=
�� 
$num
�� 
;
�� 
y
�� 
<
�� 
	tetromino
��  )
.
��) *
Matrix
��* 0
.
��0 1
Value
��1 6
.
��6 7
	GetLength
��7 @
(
��@ A
$num
��A B
)
��B C
;
��C D
y
��E F
++
��F H
)
��H I
for
�� 
(
�� 
var
�� 
x
�� 
=
�� 
$num
�� 
;
�� 
x
��  !
<
��" #
	tetromino
��$ -
.
��- .
Matrix
��. 4
.
��4 5
Value
��5 :
.
��: ;
	GetLength
��; D
(
��D E
$num
��E F
)
��F G
;
��G H
x
��I J
++
��J L
)
��L M
{
�� 
if
�� 
(
�� 
	tetromino
�� !
.
��! "
Matrix
��" (
.
��( )
Value
��) .
[
��. /
y
��/ 0
,
��0 1
x
��2 3
]
��3 4
==
��5 7
$num
��8 9
)
��9 :
continue
��; C
;
��C D
Board
�� 
[
�� 
y
�� 
+
�� 
	tetromino
�� '
.
��' (
OffsetY
��( /
,
��/ 0
x
��1 2
+
��3 4
	tetromino
��5 >
.
��> ?
OffsetX
��? F
]
��F G
=
��H I
	tetromino
��J S
.
��S T
Matrix
��T Z
.
��Z [
Value
��[ `
[
��` a
y
��a b
,
��b c
x
��d e
]
��e f
;
��f g
}
�� 
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
int
�� 
HandleRowDeletion
�� $
(
��$ %
)
��% &
=>
��' )
DeleteFullRows
��* 8
(
��8 9
FullRows
��9 A
(
��A B
)
��B C
)
��C D
;
��D E
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
private
�� 
List
�� 
<
�� 
int
�� 
>
�� 
FullRows
�� "
(
��" #
)
��# $
{
�� 	
var
�� 
fullRows
�� 
=
�� 
new
�� 
List
�� #
<
��# $
int
��$ '
>
��' (
(
��( )
)
��) *
;
��* +
for
�� 
(
�� 
var
�� 
yAxis
�� 
=
�� 
$num
�� 
;
�� 
yAxis
��  %
<
��& '
Board
��( -
.
��- .
	GetLength
��. 7
(
��7 8
$num
��8 9
)
��9 :
;
��: ;
yAxis
��< A
++
��A C
)
��C D
if
�� 
(
�� 
Range
�� 
(
�� 
$num
�� 
,
�� 
Board
�� "
.
��" #
	GetLength
��# ,
(
��, -
$num
��- .
)
��. /
)
��/ 0
.
��0 1
Select
��1 7
(
��7 8
x
��8 9
=>
��: <
Board
��= B
[
��B C
yAxis
��C H
,
��H I
x
��J K
]
��K L
)
��L M
.
��M N
ToList
��N T
(
��T U
)
��U V
.
��V W
FindAll
��W ^
(
��^ _
x
��_ `
=>
��a c
x
��d e
>
��f g
$num
��h i
)
��i j
.
��j k
Count
��k p
==
��q s
$num
��t v
)
��v w
fullRows
�� 
.
�� 
Add
��  
(
��  !
yAxis
��! &
)
��& '
;
��' (
return
�� 
fullRows
�� 
;
�� 
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
private
�� 
int
�� 
DeleteFullRows
�� "
(
��" #
ICollection
��# .
<
��. /
int
��/ 2
>
��2 3
fullRows
��4 <
)
��< =
{
�� 	
var
�� 
rowsDeleted
�� 
=
�� 
$num
�� 
;
��  
for
�� 
(
�� 
var
�� 
y
�� 
=
�� 
$num
�� 
;
�� 
y
�� 
<
�� 
Board
��  %
.
��% &
	GetLength
��& /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
y
��4 5
++
��5 7
)
��7 8
{
�� 
if
�� 
(
�� 
!
�� 
fullRows
�� 
.
�� 
Contains
�� &
(
��& '
y
��' (
)
��( )
)
��) *
continue
��+ 3
;
��3 4
for
�� 
(
�� 
var
�� 
x
�� 
=
�� 
$num
�� 
;
�� 
x
��  !
<
��" #
Board
��$ )
.
��) *
	GetLength
��* 3
(
��3 4
$num
��4 5
)
��5 6
;
��6 7
x
��8 9
++
��9 ;
)
��; <
Board
�� 
[
�� 
y
�� 
,
�� 
x
�� 
]
�� 
=
��  !
$num
��" #
;
��# $$
DropFloatingTetrominos
�� &
(
��& '
y
��' (
)
��( )
;
��) *
rowsDeleted
�� 
++
�� 
;
�� 
fullRows
�� 
.
�� 
Remove
�� 
(
��  
y
��  !
)
��! "
;
��" #
}
�� 
return
�� 
rowsDeleted
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
	DeleteRow
�� 
(
�� 
ICollection
�� )
<
��) *
int
��* -
>
��- .
fullRows
��/ 7
)
��7 8
{
�� 	
for
�� 
(
�� 
var
�� 
y
�� 
=
�� 
$num
�� 
;
�� 
y
�� 
<
�� 
Board
��  %
.
��% &
	GetLength
��& /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
y
��4 5
++
��5 7
)
��7 8
{
�� 
if
�� 
(
�� 
!
�� 
fullRows
�� 
.
�� 
Contains
�� &
(
��& '
y
��' (
)
��( )
)
��) *
continue
��+ 3
;
��3 4
for
�� 
(
�� 
var
�� 
x
�� 
=
�� 
$num
�� 
;
�� 
x
��  !
<
��" #
Board
��$ )
.
��) *
	GetLength
��* 3
(
��3 4
$num
��4 5
)
��5 6
;
��6 7
x
��8 9
++
��9 ;
)
��; <
Board
�� 
[
�� 
y
�� 
,
�� 
x
�� 
]
�� 
=
��  !
$num
��" #
;
��# $$
DropFloatingTetrominos
�� &
(
��& '
y
��' (
)
��( )
;
��) *
fullRows
�� 
.
�� 
Remove
�� 
(
��  
y
��  !
)
��! "
;
��" #
}
�� 
}
�� 	
private
�� 
void
�� $
DropFloatingTetrominos
�� +
(
��+ ,
int
��, /

deletedRow
��0 :
)
��: ;
{
�� 	
for
�� 
(
�� 
var
�� 
y
�� 
=
�� 

deletedRow
�� #
;
��# $
y
��% &
>
��' (
$num
��) *
;
��* +
y
��, -
--
��- /
)
��/ 0
for
�� 
(
�� 
var
�� 
x
�� 
=
�� 
$num
�� 
;
�� 
x
�� 
<
�� 
Board
��  %
.
��% &
	GetLength
��& /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
x
��4 5
++
��5 7
)
��7 8
Board
�� 
[
�� 
y
�� 
,
�� 
x
�� 
]
�� 
=
�� 
Board
�� #
[
��# $
y
��$ %
-
��& '
$num
��( )
,
��) *
x
��+ ,
]
��, -
;
��- .
}
�� 	
}
�� 
}�� �
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
}DD �
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
}"" �)
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
	Tetromino	//x �
.
//� �
Matrix
//� �
)
//� �
;
//� �
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
}<< �	
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
} �

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
} �

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
} �
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
} �
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
} �	
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
} �*
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
}22 �
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
AbstractFactory	77u �
.
77� �
GetTetromino
77� �
(
77� �
$num
77� �
,
77� �
$num
77� �
,
77� �
_random
77� �
)
77� �
;
77� �
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
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
void
�� 
	AngelBomb
�� 
(
�� 
)
�� 
{
�� 	
Target
�� 
	angelBomb
�� 
=
�� 
new
�� "
Adapter
��# *
.
��* +
Adapter
��+ 2
(
��2 3
$str
��3 :
,
��: ;
Score
��< A
.
��A B
Level
��B G
)
��G H
;
��H I
if
�� 
(
�� 
Score
�� 
.
�� 
Points
�� 
>=
�� 
	angelBomb
��  )
.
��) *(
GetInformationCurrentScore
��* D
(
��D E
)
��E F
)
��F G
{
�� 
Score
�� 
.
�� 
Points
�� 
=
�� 
Score
�� $
.
��$ %
Points
��% +
-
��, -
	angelBomb
��. 7
.
��7 8(
GetInformationCurrentScore
��8 R
(
��R S
)
��S T
;
��T U
_user
�� 
.
�� 
Compute
�� 
(
�� 
$str
�� )
,
��) *
	Tetromino
��+ 4
,
��4 5
Representation
��6 D
,
��D E
AbstractFactory
��F U
,
��U V
	angelBomb
��W `
.
��` a)
GetInformationLinesToChange
��a |
(
��| }
)
��} ~
)
��~ 
;�� �
Representation
�� 
=
��  
_user
��! &
.
��& '
GetRepresentation
��' 8
(
��8 9
Representation
��9 G
)
��G H
;
��H I
}
�� 
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
private
�� 
void
�� 
NewTetromino
�� !
(
��! "
)
��" #
{
�� 	
	Tetromino
�� 
=
�� 
NextTetromino
�� %
;
��% &
if
�� 
(
�� 
Representation
�� 
.
�� 
CheckCollision
�� -
(
��- .
	Tetromino
��. 7
)
��7 8
)
��8 9
{
�� 
StopGame
�� 
(
�� 
)
�� 
;
�� 
GameOver
�� 
=
�� 
true
�� 
;
��  
}
�� 
NextTetromino
�� 
=
�� 
_random
�� #
==
��$ &
null
��' +
?
��, -
(
��. /
TetrominoFigure
��/ >
)
��> ?
AbstractFactory
��? N
.
��N O
GetTetromino
��O [
(
��[ \
$num
��\ ]
,
��] ^
$num
��_ `
)
��` a
:
��b c
(
��d e
TetrominoFigure
��e t
)
��t u
AbstractFactory��u �
.��� �
GetTetromino��� �
(��� �
$num��� �
,��� �
$num��� �
,��� �
_random��� �
)��� �
;��� �
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
TetrominoFigure
�� "
CreateGhostTetromino
�� 3
(
��3 4
)
��4 5
{
�� 	
var
�� 
ghostTetromino
�� 
=
��  
(
��! "
TetrominoFigure
��" 1
)
��1 2
AbstractFactory
��2 A
.
��A B
GetTetromino
��B N
(
��N O
	Tetromino
��O X
.
��X Y
OffsetX
��Y `
,
��` a
	Tetromino
�� 
.
�� 
OffsetY
�� 
,
��  
	Tetromino
�� 
.
�� 
Matrix
�� 
)
�� 
;
��  
while
�� 
(
�� 
Representation
�� !
.
��! "
IsInRangeOfBoard
��" 2
(
��2 3
ghostTetromino
��3 A
,
��A B
$num
��C D
,
��D E
$num
��F G
)
��G H
&&
��I K
!
�� 
Representation
�� 
.
�� 
CheckCollision
�� ,
(
��, -
ghostTetromino
��- ;
,
��; <
givenYOffset
��= I
:
��I J
$num
��K L
)
��L M
)
��M N
ghostTetromino
�� 
.
�� 
OffsetY
�� &
++
��& (
;
��( )
return
�� 
ghostTetromino
�� !
;
��! "
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
void
�� 
	MoveRight
�� 
(
�� 
)
�� 
{
�� 	
_user
�� 
.
�� 
Compute
�� 
(
�� 
$str
�� !
,
��! "
	Tetromino
��# ,
,
��, -
Representation
��. <
,
��< =
AbstractFactory
��> M
,
��M N
$num
��O P
)
��P Q
;
��Q R
Representation
�� 
=
�� 
_user
�� "
.
��" #
GetRepresentation
��# 4
(
��4 5
Representation
��5 C
)
��C D
;
��D E
	Tetromino
�� 
=
�� 
_user
�� 
.
��  
GetTetraminoFigure
�� 0
(
��0 1
	Tetromino
��1 :
)
��: ;
;
��; <
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
void
�� 
MoveLeft
�� 
(
�� 
)
�� 
{
�� 	
_user
�� 
.
�� 
Compute
�� 
(
�� 
$str
��  
,
��  !
	Tetromino
��" +
,
��+ ,
Representation
��- ;
,
��; <
AbstractFactory
��= L
,
��L M
$num
��N O
)
��O P
;
��P Q
Representation
�� 
=
�� 
_user
�� "
.
��" #
GetRepresentation
��# 4
(
��4 5
Representation
��5 C
)
��C D
;
��D E
	Tetromino
�� 
=
�� 
_user
�� 
.
��  
GetTetraminoFigure
�� 0
(
��0 1
	Tetromino
��1 :
)
��: ;
;
��; <
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
void
�� 
Undo
�� 
(
�� 
)
�� 
{
�� 	
_user
�� 
.
�� 
Undo
�� 
(
�� 
$num
�� 
)
�� 
;
�� 
Representation
�� 
=
�� 
_user
�� "
.
��" #
GetRepresentation
��# 4
(
��4 5
Representation
��5 C
)
��C D
;
��D E
	Tetromino
�� 
=
�� 
_user
�� 
.
��  
GetTetraminoFigure
�� 0
(
��0 1
	Tetromino
��1 :
)
��: ;
;
��; <
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
bool
�� 
MovePossible
��  
(
��  !
int
��! $
offsetInBoardX
��% 3
=
��4 5
$num
��6 7
,
��7 8
int
��9 <
offsetInBoardY
��= K
=
��L M
$num
��N O
,
��O P
int
��Q T
offsetCollisionX
��U e
=
��f g
$num
��h i
,
��i j
int
��
 
offsetCollisionY
�� 
=
��  
$num
��! "
)
��" #
{
�� 	
return
�� 
Representation
�� !
.
��! "
IsInRangeOfBoard
��" 2
(
��2 3
	Tetromino
��3 <
,
��< =
offsetInBoardX
��> L
,
��L M
offsetInBoardY
��N \
)
��\ ]
&&
��^ `
!
�� 
Representation
�� 
.
�� 
CheckCollision
�� ,
(
��, -
	Tetromino
��- 6
,
��6 7
offsetCollisionX
��8 H
,
��H I
offsetCollisionY
��J Z
)
��Z [
;
��[ \
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
private
�� 
bool
�� 
HandleScore
��  
(
��  !
)
��! "
{
�� 	
var
�� 
deletedRows
�� 
=
�� 
Representation
�� ,
.
��, -
HandleRowDeletion
��- >
(
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
!
�� 
Score
�� 
.
�� 
ForceLevelUpdate
�� '
)
��' (
{
�� 
if
�� 
(
�� 
deletedRows
�� 
==
��  "
$num
��# $
)
��$ %
return
��& ,
false
��- 2
;
��2 3
Score
�� 
.
�� 
HandleScore
�� !
(
��! "
deletedRows
��" -
)
��- .
;
��. /
}
�� 
return
�� 
Score
�� 
.
�� 
HandleLevel
�� $
(
��$ %
)
��% &
;
��& '
}
�� 	
[
�� 	%
ExcludeFromCodeCoverage
��	  
]
��  !
public
�� 
void
�� 
Restart
�� 
(
�� 
)
�� 
{
�� 	
	GameTimer
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
	StartGame
�� 
(
�� 
)
�� 
;
�� 
NewTetromino
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
TogglePause
�� 
(
��  
)
��  !
=>
��" $
	GameTimer
��% .
.
��. /
	IsEnabled
��/ 8
=
��9 :
!
��; <
	GameTimer
��< E
.
��E F
	IsEnabled
��F O
;
��O P
}
�� 
}�� �	
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
} �-
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
}`` �	
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
} �
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
offsetX	 �
,
� �
offsetY
� �
,
� �
random
� �
,
� �
	component
� �
)
� �
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
offsetY	y �
,
� �
	component
� �
)
� �
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
offsetX	 �
,
� �
offsetY
� �
,
� �
matrix
� �
,
� �
	component
� �
)
� �
{ 	
} 	
} 
} �
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
offsetX	 �
,
� �
offsetY
� �
,
� �
random
� �
,
� �
	component
� �
)
� �
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
offsetY	y �
,
� �
	component
� �
)
� �
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
offsetX	 �
,
� �
offsetY
� �
,
� �
matrix
� �
,
� �
	component
� �
)
� �
{ 	
} 	
} 
} ��
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
�� 
.
�� 
Play
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
;
�� 
}
�� 
_renderTimer
�� 
.
�� 
Interval
�� !
=
��" #
_engine
��$ +
.
��+ ,
	GameTimer
��, 5
.
��5 6
Interval
��6 >
;
��> ?
LevelTextBlock
�� 
.
�� 
Text
�� 
=
��  !
$"
��" $
{
��$ %
_engine
��% ,
.
��, -
Score
��- 2
.
��2 3
Level
��3 8
}
��8 9
"
��9 :
;
��: ;
ScoreTextBlock
�� 
.
�� 
Text
�� 
=
��  !
$"
��" $
{
��$ %
_engine
��% ,
.
��, -
Score
��- 2
.
��2 3
Points
��3 9
}
��9 :
"
��: ;
;
��; <
LinesTextBlock
�� 
.
�� 
Text
�� 
=
��  !
$"
��" $
{
��$ %
_engine
��% ,
.
��, -
Score
��- 2
.
��2 3
Rows
��3 7
}
��7 8
"
��8 9
;
��9 :

RenderGrid
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
void
�� 
	OnKeyDown
��  )
(
��) *
KeyEventArgs
��* 6
e
��7 8
)
��8 9
{
�� 	
switch
�� 
(
�� 
e
�� 
.
�� 
Key
�� 
)
�� 
{
�� 
case
�� 
Key
�� 
.
�� 
Enter
�� 
:
�� 
Restart
�� 
(
�� 
)
�� 
;
�� 
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
P
�� 
:
�� 
TogglePause
�� 
(
��  
null
��  $
,
��$ %
null
��& *
)
��* +
;
��+ ,
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Escape
�� 
:
��  
Quit
�� 
(
�� 
null
�� 
,
�� 
null
�� #
)
��# $
;
��$ %
break
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
_renderTimer
�� 
.
�� 
	IsEnabled
�� '
)
��' (
return
��) /
;
��/ 0
switch
�� 
(
�� 
e
�� 
.
�� 
Key
�� 
)
�� 
{
�� 
case
�� 
Key
�� 
.
�� 
Right
�� 
:
�� 
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
	MoveRight
��6 ?
(
��? @
_engine
��@ G
.
��G H
AbstractFactory
��H W
,
��W X
_engine
��Y `
.
��` a
	Tetromino
��a j
,
��j k
_engine
��l s
.
��s t
Representation��t �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Left
�� 
:
�� 
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
MoveLeft
��6 >
(
��> ?
_engine
��? F
.
��F G
AbstractFactory
��G V
,
��V W
_engine
��X _
.
��_ `
	Tetromino
��` i
,
��i j
_engine
��k r
.
��r s
Representation��s �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Up
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5

RotationUp
��6 @
(
��@ A
_engine
��A H
.
��H I
AbstractFactory
��I X
,
��X Y
_engine
��Z a
.
��a b
	Tetromino
��b k
,
��k l
_engine
��m t
.
��t u
Representation��u �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Down
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
RotationDown
��6 B
(
��B C
_engine
��C J
.
��J K
AbstractFactory
��K Z
,
��Z [
_engine
��\ c
.
��c d
	Tetromino
��d m
,
��m n
_engine
��o v
.
��v w
Representation��w �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Space
�� 
:
�� 
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
HardDrop
��6 >
(
��> ?
_engine
��? F
.
��F G
AbstractFactory
��G V
,
��V W
_engine
��X _
.
��_ `
	Tetromino
��` i
,
��i j
_engine
��k r
.
��r s
Representation��s �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
_sound1
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
	LeftShift
�� "
:
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
SoftDrop
��6 >
(
��> ?
_engine
��? F
.
��F G
AbstractFactory
��G V
,
��V W
_engine
��X _
.
��_ `
	Tetromino
��` i
,
��i j
_engine
��k r
.
��r s
Representation��s �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
break
�� 
;
�� 
default
�� 
:
�� 
return
�� 
;
�� 
}
�� 

UpdateGame
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
Restart
�� 
(
�� 
)
�� 
{
�� 	
_renderTimer
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
��  
_engine
�� 
.
�� 
Restart
�� 
(
�� 
)
�� 
;
�� 
GameOverText
�� 
.
�� 

Visibility
�� #
=
��$ %

Visibility
��& 0
.
��0 1
Hidden
��1 7
;
��7 8
Timer
�� 
(
�� 
)
�� 
;
�� 

UpdateGame
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
TogglePause
��  
(
��  !
object
��! '
sender
��( .
,
��. /
RoutedEventArgs
��0 ?
routedEventArgs
��@ O
)
��O P
{
�� 	
PauseButton
�� 
.
�� 
Content
�� 
=
��  !
(
��" #
string
��# )
)
��) *
PauseButton
��* 5
.
��5 6
Content
��6 =
==
��> @
$str
��A H
?
��I J
$str
��K S
:
��T U
$str
��V ]
;
��] ^
_renderTimer
�� 
.
�� 
	IsEnabled
�� "
=
��# $
!
��% &
_renderTimer
��& 2
.
��2 3
	IsEnabled
��3 <
;
��< =
_engine
�� 
.
�� 
TogglePause
�� 
(
��  
)
��  !
;
��! "
}
�� 	
private
�� 
void
�� 
Quit
�� 
(
�� 
object
��  
sender
��! '
,
��' (
RoutedEventArgs
��) 8
routedEventArgs
��9 H
)
��H I
=>
��J L
Application
��M X
.
��X Y
Current
��Y `
.
��` a
Shutdown
��a i
(
��i j
)
��j k
;
��k l
private
�� 
static
�� 
	Rectangle
��  
CreateRectangle
��! 0
(
��0 1
Brush
��1 6
color
��7 <
,
��< =
double
��> D
opacity
��E L
=
��M N
$num
��O P
)
��P Q
=>
��R T
new
��U X
(
��X Y
)
��Y Z
{
�� 	
Width
�� 
=
�� 
$num
�� 
,
�� 
Height
�� 
=
�� 
$num
�� 
,
�� 
Stroke
�� 
=
�� 
Brushes
�� 
.
�� 
Black
�� "
,
��" #
StrokeThickness
�� 
=
�� 
$num
�� "
,
��" #
Fill
�� 
=
�� 
color
�� 
,
�� 
Opacity
�� 
=
�� 
opacity
�� 
}
�� 	
;
��	 

}
�� 
}�� �
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
�� 
=
�� 
new
�� 
DispatcherTimer
�� .
(
��. /
)
��/ 0
;
��0 1
_renderTimer
�� 
.
�� 
Tick
�� 
+=
��  "
dispatcherTimer_Tick
��! 5
;
��5 6
_renderTimer
�� 
.
�� 
Interval
�� !
=
��" #
new
��$ '
TimeSpan
��( 0
(
��0 1
$num
��1 2
,
��2 3
$num
��4 5
,
��5 6
$num
��7 8
,
��8 9
$num
��: ;
,
��; <
$num
��= ?
)
��? @
;
��@ A
_renderTimer
�� 
.
�� 
Start
�� 
(
�� 
)
��  
;
��  !
}
�� 	
private
�� 
void
�� "
dispatcherTimer_Tick
�� )
(
��) *
object
��* 0
sender
��1 7
,
��7 8
	EventArgs
��9 B
e
��C D
)
��D E
=>
��F H

UpdateGame
��I S
(
��S T
)
��T U
;
��U V
private
�� 
void
�� 

UpdateGame
�� 
(
��  
)
��  !
{
�� 	
SendData
�� 
(
�� 
)
�� 
;
�� 
CheckGameOver
�� 
(
�� 
)
�� 
;
�� 
SetTextBlocks
�� 
(
�� 
)
�� 
;
�� 

RenderGrid
�� 
(
�� 
)
�� 
;
�� 
SetBombButton
�� 
(
�� 
)
�� 
;
�� 
SetEvilBombButton
�� 
(
�� 
)
�� 
;
��  
}
�� 	
private
�� 
void
�� 
SetBombButton
�� "
(
��" #
)
��# $
{
�� 	
Bombs
�� 
bomb
�� 
=
�� 
_engine
��  
.
��  !
GetBomb
��! (
(
��( )
)
��) *
;
��* +
Facade
�� 
facade
�� 
=
�� 
new
�� 
Facade
��  &
(
��& '
bomb
��' +
)
��+ ,
;
��, -
Target
�� 
	angelBomb
�� 
=
�� 
new
�� "
Adapter
��# *
(
��* +
$str
��+ 2
,
��2 3
_engine
��4 ;
.
��; <
Score
��< A
.
��A B
Level
��B G
)
��G H
;
��H I
if
�� 
(
�� 
_engine
�� 
.
�� 
Score
�� 
.
�� 
Points
�� $
>=
��% '
	angelBomb
��( 1
.
��1 2(
GetInformationCurrentScore
��2 L
(
��L M
)
��M N
)
��N O
{
�� 

BombButton
�� 
.
�� 
	IsEnabled
�� $
=
��% &
true
��' +
;
��+ ,
BombButtonImage
�� 
.
��  
Source
��  &
=
��' (
new
��) ,
BitmapImage
��- 8
(
��8 9
new
��9 <
Uri
��= @
(
��@ A
FacadeClient
��A M
.
��M N
ClientEnableBomb
��N ^
(
��^ _
facade
��_ e
)
��e f
,
��f g
UriKind
��h o
.
��o p
Relative
��p x
)
��x y
)
��y z
;
��z {
}
�� 
else
�� 
{
�� 

BombButton
�� 
.
�� 
	IsEnabled
�� $
=
��% &
false
��' ,
;
��, -
BombButtonImage
�� 
.
��  
Source
��  &
=
��' (
new
��) ,
BitmapImage
��- 8
(
��8 9
new
��9 <
Uri
��= @
(
��@ A
FacadeClient
��A M
.
��M N
ClientDisableBomb
��N _
(
��_ `
facade
��` f
)
��f g
,
��g h
UriKind
��i p
.
��p q
Relative
��q y
)
��y z
)
��z {
;
��{ |
}
�� 
}
�� 	
private
�� 
void
�� 
SetEvilBombButton
�� &
(
��& '
)
��' (
{
�� 	
Bombs
�� 
evilBomb
�� 
=
�� 
_engine
�� $
.
��$ %
GetEvilBomb
��% 0
(
��0 1
)
��1 2
;
��2 3
Facade
�� 
facade
�� 
=
�� 
new
�� 
Facade
��  &
(
��& '
evilBomb
��' /
)
��/ 0
;
��0 1
Target
�� 
	devilBomb
�� 
=
�� 
new
�� "
Adapter
��# *
(
��* +
$str
��+ 2
,
��2 3
_engine
��4 ;
.
��; <
Score
��< A
.
��A B
Level
��B G
)
��G H
;
��H I
if
�� 
(
�� 
_engine
�� 
.
�� 
Score
�� 
.
�� 
Points
�� $
>=
��% '
	devilBomb
��( 1
.
��1 2(
GetInformationCurrentScore
��2 L
(
��L M
)
��M N
)
��N O
{
�� 
BombEvilButton
�� 
.
�� 
	IsEnabled
�� (
=
��) *
true
��+ /
;
��/ 0!
BombEvilButtonImage
�� #
.
��# $
Source
��$ *
=
��+ ,
new
��- 0
BitmapImage
��1 <
(
��< =
new
��= @
Uri
��A D
(
��D E
FacadeClient
��E Q
.
��Q R
ClientEnableBomb
��R b
(
��b c
facade
��c i
)
��i j
,
��j k
UriKind
��l s
.
��s t
Relative
��t |
)
��| }
)
��} ~
;
��~ 
}
�� 
else
�� 
{
�� 
BombEvilButton
�� 
.
�� 
	IsEnabled
�� (
=
��) *
false
��+ 0
;
��0 1!
BombEvilButtonImage
�� #
.
��# $
Source
��$ *
=
��+ ,
new
��- 0
BitmapImage
��1 <
(
��< =
new
��= @
Uri
��A D
(
��D E
FacadeClient
��E Q
.
��Q R
ClientDisableBomb
��R c
(
��c d
facade
��d j
)
��j k
,
��k l
UriKind
��m t
.
��t u
Relative
��u }
)
��} ~
)
��~ 
;�� �
}
�� 
}
�� 	
private
�� 
void
�� 
SendData
�� 
(
�� 
)
�� 
{
�� 	
	Singleton
�� 
	singleton
�� 
=
��  !
	Singleton
��" +
.
��+ ,
GetInstance
��, 7
(
��7 8
)
��8 9
;
��9 :
Task
�� 
.
�� 
Run
�� 
(
�� 
async
�� 
(
�� 
)
�� 
=>
��  
await
��	 
	singleton
�� 
.
�� 
GetConnection
�� &
(
��& '
)
��' (
.
��( )
InvokeAsync
��) 4
(
��4 5
$str
��5 @
,
��@ A
JsonConvert
��B M
.
��M N
SerializeObject
��N ]
(
��] ^
_engine
��^ e
.
��e f
Score
��f k
)
��k l
)
��l m
)
��m n
;
��n o
Task
�� 
.
�� 
Run
�� 
(
�� 
async
�� 
(
�� 
)
�� 
=>
��  
await
�� 
	singleton
�� 
.
��  
GetConnection
��  -
(
��- .
)
��. /
.
��/ 0
InvokeAsync
��0 ;
(
��; <
$str
��< G
,
��G H
JsonConvert
��I T
.
��T U
SerializeObject
��U d
(
��d e
_engine
��e l
.
��l m
Representation
��m {
.
��{ |
Board��| �
)��� �
)��� �
)��� �
;��� �
Task
�� 
.
�� 
Run
�� 
(
�� 
async
�� 
(
�� 
)
�� 
=>
��  
await
�� 
	singleton
�� 
.
��  
GetConnection
��  -
(
��- .
)
��. /
.
��/ 0
InvokeAsync
��0 ;
(
��; <
$str
��< K
,
��K L
JsonConvert
��M X
.
��X Y
SerializeObject
��Y h
(
��h i
_engine
��i p
.
��p q
	Tetromino
��q z
)
��z {
)
��{ |
)
��| }
;
��} ~
Task
�� 
.
�� 
Run
�� 
(
�� 
async
�� 
(
�� 
)
�� 
=>
��  
await
�� 
	singleton
�� 
.
��  
GetConnection
��  -
(
��- .
)
��. /
.
��/ 0
InvokeAsync
��0 ;
(
��; <
$str
��< L
,
��L M
_engine
��N U
.
��U V
GameOver
��V ^
)
��^ _
)
��_ `
;
��` a
Task
�� 
.
�� 
Run
�� 
(
�� 
async
�� 
(
�� 
)
�� 
=>
��  
await
�� 
	singleton
�� 
.
��  
GetConnection
��  -
(
��- .
)
��. /
.
��/ 0
InvokeAsync
��0 ;
(
��; <
$str
��< O
,
��O P
JsonConvert
��Q \
.
��\ ]
SerializeObject
��] l
(
��l m
_engine
��m t
.
��t u
NextTetromino��u �
)��� �
)��� �
)��� �
;��� �
}
�� 	
private
�� 
void
�� 
CheckGameOver
�� "
(
��" #
)
��# $
{
�� 	
if
�� 
(
�� 
_engine
�� 
.
�� 
GameOver
��  
)
��  !
{
�� 

Dispatcher
�� 
.
�� 
Invoke
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
{
��( )
GameOverTextP1
��* 8
.
��8 9

Visibility
��9 C
=
��D E

Visibility
��F P
.
��P Q
Visible
��Q X
;
��X Y
}
��Z [
)
��[ \
;
��\ ]

Dispatcher
�� 
.
�� 
Invoke
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
{
��( )
YouWonTextP2
��* 6
.
��6 7

Visibility
��7 A
=
��B C

Visibility
��D N
.
��N O
Visible
��O V
;
��V W
}
��X Y
)
��Y Z
;
��Z [
}
�� 
if
�� 
(
�� 
_enemyGameOver
�� 
)
�� 
{
�� 

Dispatcher
�� 
.
�� 
Invoke
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
{
��( )
GameOverTextP2
��* 8
.
��8 9

Visibility
��9 C
=
��D E

Visibility
��F P
.
��P Q
Visible
��Q X
;
��X Y
}
��Z [
)
��[ \
;
��\ ]

Dispatcher
�� 
.
�� 
Invoke
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
{
��( )
YouWonTextP1
��* 6
.
��6 7

Visibility
��7 A
=
��B C

Visibility
��D N
.
��N O
Visible
��O V
;
��V W
}
��X Y
)
��Y Z
;
��Z [
StopGame
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
void
�� 
SetTextBlocks
�� "
(
��" #
)
��# $
{
�� 	
LevelTextBlockP1
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_engine
��' .
.
��. /
Score
��/ 4
.
��4 5
Level
��5 :
}
��: ;
"
��; <
;
��< =
ScoreTextBlockP1
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_engine
��' .
.
��. /
Score
��/ 4
.
��4 5
Points
��5 ;
}
��; <
"
��< =
;
��= >
LinesTextBlockP1
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_engine
��' .
.
��. /
Score
��/ 4
.
��4 5
Rows
��5 9
}
��9 :
"
��: ;
;
��; <
if
�� 
(
�� 
_enemyScore
�� 
==
�� 
null
�� #
)
��# $
return
��% +
;
��+ ,
LevelTextBlockP2
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_enemyScore
��' 2
.
��2 3
Level
��3 8
}
��8 9
"
��9 :
;
��: ;
ScoreTextBlockP2
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_enemyScore
��' 2
.
��2 3
Points
��3 9
}
��9 :
"
��: ;
;
��; <
LinesTextBlockP2
�� 
.
�� 
Text
�� !
=
��" #
$"
��$ &
{
��& '
_enemyScore
��' 2
.
��2 3
Rows
��3 7
}
��7 8
"
��8 9
;
��9 :
}
�� 	
private
�� 
void
�� 

RenderGrid
�� 
(
��  
)
��  !
{
�� 	
TetrisGridP1
�� 
.
�� 
Children
�� !
.
��! "
Clear
��" '
(
��' (
)
��( )
;
��) *$
RenderLandedTetrominos
�� "
(
��" #
TetrisGridP1
��# /
)
��/ 0
;
��0 1
if
�� 
(
�� 
_enemyBoard
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
TetrisGridP2
�� 
.
�� 
Children
�� %
.
��% &
Clear
��& +
(
��+ ,
)
��, -
;
��- .$
RenderLandedTetrominos
�� &
(
��& '
TetrisGridP2
��' 3
,
��3 4
_enemyBoard
��5 @
)
��@ A
;
��A B
}
�� 
RenderTetromino
�� 
(
�� 
_engine
�� #
.
��# $
	Tetromino
��$ -
,
��- .
TetrisGridP1
��/ ;
)
��; <
;
��< =
RenderTetromino
�� 
(
�� 
_engine
�� #
.
��# $"
CreateGhostTetromino
��$ 8
(
��8 9
)
��9 :
,
��: ;
TetrisGridP1
��< H
,
��H I
$num
��J N
)
��N O
;
��O P
if
�� 
(
�� 
_enemyTetromino
�� 
!=
��  "
null
��# '
)
��' (
RenderTetromino
�� 
(
��  
_enemyTetromino
��  /
,
��/ 0
TetrisGridP2
��1 =
)
��= >
;
��> ?

NextGridP1
�� 
.
�� 
Children
�� 
.
��  
Clear
��  %
(
��% &
)
��& '
;
��' (
RenderTetromino
�� 
(
�� 
_engine
�� #
.
��# $
NextTetromino
��$ 1
,
��1 2

NextGridP1
��3 =
)
��= >
;
��> ?
if
�� 
(
�� !
_enemyNextTetromino
�� #
==
��$ &
null
��' +
)
��+ ,
return
��- 3
;
��3 4

NextGridP2
�� 
.
�� 
Children
�� 
.
��  
Clear
��  %
(
��% &
)
��& '
;
��' (
RenderTetromino
�� 
(
�� !
_enemyNextTetromino
�� /
,
��/ 0

NextGridP2
��1 ;
)
��; <
;
��< =
}
�� 	
private
�� 
void
�� 
RenderTetromino
�� $
(
��$ %
TetrominoFigure
��% 4
	tetromino
��5 >
,
��> ?
Panel
��@ E
grid
��F J
,
��J K
double
��L R
opacity
��S Z
=
��[ \
$num
��] ^
)
��^ _
{
�� 	
	tetromino
�� 
.
��  
CalculatePositions
�� (
(
��( )
)
��) *
.
��* +
ForEach
��+ 2
(
��2 3

coordinate
��3 =
=>
��> @
{
�� 
var
�� 
(
�� 
y
�� 
,
�� 
x
�� 
)
�� 
=
�� 

coordinate
�� '
;
��' (
var
�� 
shapeRectangle
�� "
=
��# $
	tetromino
��% .
.
��. /
Matrix
��/ 5
.
��5 6
Value
��6 ;
[
��; <
y
��< =
-
��> ?
	tetromino
��@ I
.
��I J
OffsetY
��J Q
,
��Q R
x
��S T
-
��U V
	tetromino
��W `
.
��` a
OffsetX
��a h
]
��h i
;
��i j
var
�� 
	rectangle
�� 
=
�� 
CreateRectangle
��  /
(
��/ 0
TetrominoBrushes
��0 @
.
��@ A

BrushArray
��A K
[
��K L
shapeRectangle
��L Z
]
��Z [
,
��[ \
opacity
��] d
)
��d e
;
��e f
grid
�� 
?
�� 
.
�� 
Children
�� 
.
�� 
Add
�� "
(
��" #
	rectangle
��# ,
)
��, -
;
��- .
Grid
�� 
.
�� 
SetRow
�� 
(
�� 
	rectangle
�� %
,
��% &
y
��' (
)
��( )
;
��) *
Grid
�� 
.
�� 
	SetColumn
�� 
(
�� 
	rectangle
�� (
,
��( )
grid
��* .
!=
��/ 1

NextGridP1
��2 <
&&
��= ?
grid
��@ D
!=
��E G

NextGridP2
��H R
?
��S T
x
��U V
:
��W X
x
��Y Z
-
��[ \
$num
��] ^
)
��^ _
;
��_ `
}
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
RenderTetromino
�� $
(
��$ %!
TetrominoJsonObject
��% 8
	tetromino
��9 B
,
��B C
Panel
��D I
grid
��J N
,
��N O
double
��P V
opacity
��W ^
=
��_ `
$num
��a b
)
��b c
{
�� 	
Creator
�� 
creator
�� 
=
�� 
new
�� !
LevelCreator
��" .
(
��. /
)
��/ 0
;
��0 1
Level
�� 
level
�� 
=
�� 
creator
�� !
.
��! "
GetLevel
��" *
(
��* +
_enemyScore
��+ 6
.
��6 7
Level
��7 <
)
��< =
;
��= >
AbstractFactory
�� 
abstractFactory
�� +
=
��, -
level
��. 3
.
��3 4 
GetAbstractFactory
��4 F
(
��F G
)
��G H
;
��H I
TetrominoFigure
��  
generatedTetromino
�� .
=
��/ 0
(
��1 2
TetrominoFigure
��2 A
)
��A B
abstractFactory
��B Q
.
��Q R
GetTetromino
��R ^
(
��^ _
	tetromino
��_ h
.
��h i
OffsetX
��i p
,
��p q
	tetromino
��r {
.
��{ |
OffsetY��| �
,��� �
	tetromino��� �
.��� �
Matrix��� �
)��� �
;��� �
RenderTetromino
�� 
(
��  
generatedTetromino
�� .
,
��. /
grid
��0 4
,
��4 5
opacity
��6 =
)
��= >
;
��> ?
}
�� 	
private
�� 
void
�� $
RenderLandedTetrominos
�� +
(
��+ ,
Panel
��, 1
grid
��2 6
,
��6 7
int
��8 ;
[
��; <
,
��< =
]
��= >
board
��? D
=
��E F
null
��G K
)
��K L
{
�� 	
board
�� 
??=
�� 
_engine
�� 
.
�� 
Representation
�� ,
.
��, -
Board
��- 2
;
��2 3
for
�� 
(
�� 
var
�� 
y
�� 
=
�� 
$num
�� 
;
�� 
y
�� 
<
�� 
board
��  %
.
��% &
	GetLength
��& /
(
��/ 0
$num
��0 1
)
��1 2
;
��2 3
y
��4 5
++
��5 7
)
��7 8
for
�� 
(
�� 
var
�� 
x
�� 
=
�� 
$num
�� 
;
�� 
x
��  !
<
��" #
board
��$ )
.
��) *
	GetLength
��* 3
(
��3 4
$num
��4 5
)
��5 6
;
��6 7
x
��8 9
++
��9 ;
)
��; <
{
�� 
var
�� 
block
�� 
=
�� 
board
��  %
[
��% &
y
��& '
,
��' (
x
��) *
]
��* +
;
��+ ,
if
�� 
(
�� 
block
�� 
==
��  
$num
��! "
)
��" #
continue
��$ ,
;
��, -
var
�� 
	rectangle
�� !
=
��" #
CreateRectangle
��$ 3
(
��3 4
TetrominoBrushes
��4 D
.
��D E

BrushArray
��E O
[
��O P
board
��P U
[
��U V
y
��V W
,
��W X
x
��Y Z
]
��Z [
]
��[ \
)
��\ ]
;
��] ^
grid
�� 
.
�� 
Children
�� !
.
��! "
Add
��" %
(
��% &
	rectangle
��& /
)
��/ 0
;
��0 1
Grid
�� 
.
�� 
SetRow
�� 
(
��  
	rectangle
��  )
,
��) *
y
��+ ,
)
��, -
;
��- .
Grid
�� 
.
�� 
	SetColumn
�� "
(
��" #
	rectangle
��# ,
,
��, -
x
��. /
)
��/ 0
;
��0 1
}
�� 
}
�� 	
private
�� 
static
�� 
	Rectangle
��  
CreateRectangle
��! 0
(
��0 1
Brush
��1 6
color
��7 <
,
��< =
double
��> D
opacity
��E L
=
��M N
$num
��O P
)
��P Q
=>
��R T
new
��U X
(
��X Y
)
��Y Z
{
�� 	
Width
�� 
=
�� 
$num
�� 
,
�� 
Height
�� 
=
�� 
$num
�� 
,
�� 
Stroke
�� 
=
�� 
Brushes
�� 
.
�� 
Black
�� "
,
��" #
StrokeThickness
�� 
=
�� 
$num
�� "
,
��" #
Fill
�� 
=
�� 
color
�� 
,
�� 
Opacity
�� 
=
�� 
opacity
�� 
}
�� 	
;
��	 

	protected
�� 
override
�� 
void
�� 
	OnKeyDown
��  )
(
��) *
KeyEventArgs
��* 6
e
��7 8
)
��8 9
{
�� 	
if
�� 
(
�� 
!
�� 
_renderTimer
�� 
.
�� 
	IsEnabled
�� '
)
��' (
return
��) /
;
��/ 0
if
�� 
(
�� 
_engine
�� 
.
�� 
GameOver
��  
)
��  !
return
��" (
;
��( )
switch
�� 
(
�� 
e
�� 
.
�� 
Key
�� 
)
�� 
{
�� 
case
�� 
Key
�� 
.
�� 
Right
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	MoveRight
�� %
(
��% &
)
��& '
;
��' (
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Left
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
MoveLeft
�� $
(
��$ %
)
��% &
;
��& '
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Up
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5

RotationUp
��6 @
(
��@ A
_engine
��A H
.
��H I
AbstractFactory
��I X
,
��X Y
_engine
��Z a
.
��a b
	Tetromino
��b k
,
��k l
_engine
��m t
.
��t u
Representation��u �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Down
�� 
:
�� 
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
RotationDown
��6 B
(
��B C
_engine
��C J
.
��J K
AbstractFactory
��K Z
,
��Z [
_engine
��\ c
.
��c d
	Tetromino
��d m
,
��m n
_engine
��o v
.
��v w
Representation��w �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Space
�� 
:
�� 
_sound1
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
HardDrop
��6 >
(
��> ?
_engine
��? F
.
��F G
AbstractFactory
��G V
,
��V W
_engine
��X _
.
��_ `
	Tetromino
��` i
,
��i j
_engine
��k r
.
��r s
Representation��s �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
	LeftShift
�� "
:
��" #
_sound2
�� 
.
�� 
Play
��  
(
��  !
)
��! "
;
��" #
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
SetStrategy
��& 1
(
��1 2
new
��2 5
SoftDrop
��6 >
(
��> ?
_engine
��? F
.
��F G
AbstractFactory
��G V
,
��V W
_engine
��X _
.
��_ `
	Tetromino
��` i
,
��i j
_engine
��k r
.
��r s
Representation��s �
)��� �
)��� �
;��� �
_engine
�� 
.
�� 
	Tetromino
�� %
.
��% &
Action
��& ,
(
��, -
)
��- .
;
��. /
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
Z
�� 
:
�� 
_engine
�� 
.
�� 
Undo
��  
(
��  !
)
��! "
;
��" #
break
�� 
;
�� 
case
�� 
Key
�� 
.
�� 
B
�� 
:
�� 
_engine
�� 
.
�� 
	AngelBomb
�� %
(
��% &
)
��& '
;
��' (
break
�� 
;
�� 
default
�� 
:
�� 
return
�� 
;
�� 
}
�� 

UpdateGame
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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