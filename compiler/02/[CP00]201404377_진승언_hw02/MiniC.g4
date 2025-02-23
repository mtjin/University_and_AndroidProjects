grammar MiniC;

program	: decl+			{System.out.println("201404377 Rule 0");};
decl		: var_decl	{System.out.println("201404377 Rule 1-1");}	
		| fun_decl		{System.out.println("201404377 Rule 1-2");};
var_decl	:  type_spec IDENT ';' {System.out.println("201404377 Rule 2-1");}
		| type_spec IDENT '=' LITERAL ';'	{System.out.println("201404377 Rule 2-2");}
		| type_spec IDENT '[' LITERAL ']' ';'	{System.out.println("201404377 Rule 2-3");};
type_spec	: VOID		{System.out.println("201404377 Rule 3-1");}		
		| INT				{System.out.println("201404377 Rule 3-2");};
fun_decl	: type_spec IDENT '(' params ')' compound_stmt {System.out.println("201404377 Rule 4");};
params		: param (',' param)*		{System.out.println("201404377 Rule 5-1");}
		| VOID				{System.out.println("201404377 Rule 5-2");}
		|				{System.out.println("201404377 Rule 5-3");};
param		: type_spec IDENT		{System.out.println("201404377 Rule 6-1");}
		| type_spec IDENT '[' ']'	{System.out.println("201404377 Rule 6-2");};
stmt		: expr_stmt			{System.out.println("201404377 Rule 7-1");}
		| compound_stmt			{System.out.println("201404377 Rule 7-2");}
		| if_stmt			{System.out.println("201404377 Rule 7-3");}
		| while_stmt			{System.out.println("201404377 Rule 7-4");}
		| return_stmt			{System.out.println("201404377 Rule 7-5");};
expr_stmt	: expr ';'			{System.out.println("201404377 Rule 8");};
while_stmt	: WHILE '(' expr ')' stmt	{System.out.println("201404377 Rule 9");};
compound_stmt: '{' local_decl* stmt* '}'	{System.out.println("201404377 Rule 10");};
local_decl	: type_spec IDENT ';'{System.out.println("201404377 Rule 11-1");}
		| type_spec IDENT '=' LITERAL ';'	{System.out.println("201404377 Rule 11-2");}
		| type_spec IDENT '[' LITERAL ']' ';'	{System.out.println("201404377 Rule 11-3");};
if_stmt		: IF '(' expr ')' stmt		{System.out.println("201404377 Rule 12-1");}
		| IF '(' expr ')' stmt ELSE stmt 		{System.out.println("201404377 Rule 12-2");};
return_stmt	: RETURN ';'			{System.out.println("201404377 Rule 13-1");}
		| RETURN expr ';'				{System.out.println("201404377 Rule 13-2");};
expr	:  LITERAL				{System.out.println("201404377 Rule 14-1");}
	| '(' expr ')'				 {System.out.println("201404377 Rule 14-2");}
	| IDENT				 {System.out.println("201404377 Rule 14-3");}
	| IDENT '[' expr ']'			 {System.out.println("201404377 Rule 14-4");}
	| IDENT '(' args ')'			{System.out.println("201404377 Rule 14-5");}
	| '-' expr				 {System.out.println("201404377 Rule 14-6");}
	| '+' expr				 {System.out.println("201404377 Rule 14-7");}
	| '--' expr				 {System.out.println("201404377 Rule 14-8");}
	| '++' expr				 {System.out.println("201404377 Rule 14-9");}
	| expr '*' expr				 {System.out.println("201404377 Rule 14-10");}
	| expr '/' expr				 {System.out.println("201404377 Rule 14-11");}
	| expr '%' expr				 {System.out.println("201404377 Rule 14-12");}
	| expr '+' expr				 {System.out.println("201404377 Rule 14-13");}
	| expr '-' expr				 {System.out.println("201404377 Rule 14-14");}
	| expr EQ expr				{System.out.println("201404377 Rule 14-15");}
	| expr NE expr				 {System.out.println("201404377 Rule 14-16");}
	| expr LE expr				 {System.out.println("201404377 Rule 14-17");}
	| expr '<' expr				 {System.out.println("201404377 Rule 14-18");}
	| expr GE expr				 {System.out.println("201404377 Rule 14-19");}
	| expr '>' expr				 {System.out.println("201404377 Rule 14-20");}
	| '!' expr					 {System.out.println("201404377 Rule 14-21");}
	| expr AND expr				 {System.out.println("201404377 Rule 14-22");}
	| expr OR expr				{System.out.println("201404377 Rule 14-23");}
	| IDENT '=' expr			{System.out.println("201404377 Rule 14-24");}
	| IDENT '[' expr ']' '=' expr		{System.out.println("201404377 Rule 14-25");};
args	: expr (',' expr)*			 {System.out.println("201404377 Rule 15-1");}
	|					 {System.out.println("201404377 Rule 15-2");};

VOID: 'void';
INT: 'int';

WHILE: 'while';
IF: 'if';
ELSE: 'else';
RETURN: 'return';
OR: 'or';
AND: 'and';
LE: '<=';
GE: '>=';
EQ: '==';
NE: '!=';

IDENT  : [a-zA-Z_]
        (   [a-zA-Z_]
        |  [0-9]
        )*;


LITERAL:   DecimalConstant     |   OctalConstant     |   HexadecimalConstant     ;


DecimalConstant
    :   '0'
	|   [1-9] [0-9]*
    ;

OctalConstant
    :   '0'[0-7]*
    ;

HexadecimalConstant
    :   '0' [xX] [0-9a-fA-F] +
    ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
	-> channel(HIDDEN)	 
    ;
