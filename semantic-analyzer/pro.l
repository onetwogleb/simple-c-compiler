%{

	#include <string.h>
        #include "y.tab.h"

        int line=1;
        char tempid[100];
        
%}

WHITESPACE [ \t\f\r\v]+
INT ("int")
FLOAT ("float")
BOOLEAN ("bool")
STRING_CHAR ("char")
SHORT ("short")
LONG ("long")
DOUBLE ("double")
INT_CONST [0-9]+
FLOAT_CONST [0-9]*([.][0-9]+)?(E[+-]?[0-9]+)?
BOOL_CONST ("true")|("false")
CHAR_CONST ([']([\x21-\x7E])['])
STRING_CONST (["][a-zA-Z0-9 $&+,:=?@#|'<>.^*;()%!-]*["])
IDENTIFIER ([a-zA-Z0-9_]([a-zA-Z0-9_]*)?)
COMMENT ("/*"([^*]|([*]+[^*/]))*[*]+"/")|"//".*

%%

"main" {return MAIN;}
"auto"  {return AUTO;}
"break" {return BREAK;}
"if" {return IF;}
"else" {return ELSE;}
"switch" {return SWITCH;}
"case" {return CASE;}
"register" {return REGISTER;}
"typedef" {return TYPEDEF;}
"extern" {return EXTERN;}
"return" {return RETURN;}
"union" {return UNION;}
"const" {return CONST;}
"unsigned" {return UNSIGNED;}
"continue" {return CONTINUE;}
"for" {return FOR;}
"signed" {return SIGNED;}
"void" {return VOID;}
"default" {return DEFAULT;}
"goto" {return GOTO;}
"sizeof" {return SIZEOF;}
"volatile" {return VOLATILE;}
"do" {return DO;}
"static" {return STATIC;}
"while" {return WHILE;}
"enum" {return ENUM;}
"struct" {return STRUCT;}
"inline" {return INLINE;}
"printf" {return PRINTF;}
"elif" {return ELIF;}
"endif" {return ENDIF;}
"defined" {return DEFINED;}
"ifdef" {return IFDEF;}
"infdef" {return INFDEF;}
"undef" {return UNDEF;}
"include" {return INCLUDE;}
"line" {return LINE;}
"error" {return ERROR;}
"pragma" {return PRAGMA;}

"=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"++" {return INCREMENT;}		
"--" {return DECREMENT;} 
"*" {return STAR;}
"/" {return SLASH;}
"%" {return PERCENT;}

"&&"|"||" {return LOGIC_OPERATOR;}
"&"|"|"|"^"|"~"|"<<"|">>" {return BITWISE_OPERATOR;}
"+="|"-="|"*="|"/="|"%=" {return ASSIGNMENT_OPERATOR;}
"$"|"@"|"#"|"'" {return OTHER_SYMBOL;}

"!" {return NOT;}
"(" {return LEFT_PAREN;}
")" {return RIGHT_PAREN;}
"{" {return LEFT_CURL;}
"}" {return RIGHT_CURL;}
"[" {return LEFT_SQRB;}
"]" {return RIGHT_SQRB;}
"," {return COMMA;}
";" {return SEMICOLON;}		
"?" {return QSIGN;}
":" {return DPOINT;}

">" {return BG;}
">=" {return BGE;}
"<" {return LS;}
"<=" {return LSE;}
"==" {return EQ;}
"!=" {return NEQ;}

{WHITESPACE} {}

{INT} {return INT;}
{FLOAT} {return FLOAT;}
{BOOLEAN} {return BOOL;}
{STRING_CHAR} {return CHAR;}
{SHORT} {return SHORT;}
{LONG} {return LONG;}
{DOUBLE} {return DOUBLE;}
{INT_CONST} {yylval = atoi(yytext); return INT_CONST;}
{FLOAT_CONST} {yylval = (char*)yytext; return FLOAT_CONST;}
{BOOL_CONST} {return BOOL_CONST;}
{CHAR_CONST} {yylval = yytext; return CHAR_CONST;}
{STRING_CONST} {return STRING_CONST;}

{IDENTIFIER} {strcpy(tempid,yytext); return ID;}

[\n] {line++;}

{COMMENT} {yylval = (char*)yytext; return COMMENT;}

. {}

%%

