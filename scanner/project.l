
%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>

        void errorScanner(char *s);
	
%}

WHITESPACE [ \t\f\r\v]+
INT ("int")
FLOAT ("float")
BOOLEAN ("bool")
STRING_CHAR ("char")
SHORT ("short")
LONG ("long")
DOUBLE ("double")
INT_CONST [-+]?[0-9]+
FLOAT_CONST [-+]?[0-9]*([.][0-9]+)?(E[+-]?[0-9]+)?
BOOL_CONST ("true")|("false")
CHAR_CONST ([']([\x21-\x7E])['])
STRING_CONST (["][a-zA-Z0-9$&+,:=?@#|'<>.^*;()%!-]*["])
IDENTIFIER ([a-zA-Z0-9_]([a-zA-Z0-9_]*)?)
COMMENT ("/*"([^*]|([*]+[^*/]))*[*]+"/")|"//".*
WRONG_IDENTIFIER [0-9]+(\.)?[A-Za-z0-9_]+
FLOAT_CONST_ERROR [0-9]*[.][0-9]*([.]+[0-9]*)*
CHAR_CONST_ERROR ([']([\x21-\x7E]{2,})*['])

%%

"auto"  {printf("AUTO : %s\n" , yytext);}
"break" {printf("BREAK : %s\n" , yytext);}
"if" {printf("IF : %s\n" , yytext);}
"else" {printf("ELSE : %s\n" , yytext);}
"switch" {printf("SWITCH : %s\n" , yytext);}
"case" {printf("CASE : %s\n" , yytext);}
"register" {printf("REGISTER : %s\n" , yytext);}
"typedef" {printf("TYPEDEF : %s\n" , yytext);}
"extern" {printf("EXTERN : %s\n" , yytext);}
"return" {printf("RETURN : %s\n" , yytext);}
"union" {printf("UNION : %s\n" , yytext);}
"const" {printf("CONST : %s\n" , yytext);}
"unsigned" {printf("UNSIGNED : %s\n" , yytext);}
"continue" {printf("CONTINUE : %s\n" , yytext);}
"for" {printf("FOR : %s\n" , yytext);}
"signed" {printf("SIGNED : %s\n" , yytext);}
"void" {printf("VOID : %s\n" , yytext);}
"default" {printf("DEFAULT : %s\n" , yytext);}
"goto" {printf("GOTO : %s\n" , yytext);}
"sizeof" {printf("SIZEOF : %s\n" , yytext);}
"volatile" {printf("VOLATILE : %s\n" , yytext);}
"do" {printf("DO : %s\n" , yytext);}
"static" {printf("STATIC : %s\n" , yytext);}
"while" {printf("WHILE : %s\n" , yytext);}
"enum" {printf("ENUM : %s\n" , yytext);}
"struct" {printf("STRUCT : %s\n" , yytext);}
"inline" printf("INLINE : %s\n" , yytext);
"printf" printf("PRINTF : %s\n" , yytext);
"elif" printf("ELIF : %s\n" , yytext);
"endif" printf("ENDIF : %s\n" , yytext);
"defined" printf("DEFINE : %s\n" , yytext);
"ifdef" printf("IFDEF : %s\n" , yytext);
"infdef" printf("INFDEF : %s\n" , yytext);
"undef" printf("UNDEF : %s\n" , yytext);
"include" printf("INCLUDE : %s\n" , yytext);
"line" printf("LINE : %s\n" , yytext);
"error" printf("ERROR : %s\n" , yytext);
"pragma" printf("PRAGMA : %s\n" , yytext);

"=" {printf("ASSIGN : %s\n" , yytext);}
"+" {printf("PLUS : %s\n" , yytext);}
"-" {printf("MINUS : %s\n" , yytext);}
"++" {printf("INCREMENT : %s\n" , yytext);}		
"--" {printf("DECREMENT : %s\n" , yytext);} 
"*" {printf("STAR : %s\n" , yytext);}
"/" {printf("SLASH : %s\n" , yytext);}
"%" {printf("PERCENT : %s\n" , yytext);}

">"|">="|"<"|"<="|"=="|"!=" {printf("RELATIONAL OPERATOR : %s\n" , yytext);}
"&&"|"||" {printf("LOGIC OPERATOR : %s\n" , yytext);}
"&"|"|"|"^"|"~"|"<<"|">>" {printf("BITWISE OPERATOR : %s\n" , yytext);}
"+="|"-="|"*="|"/="|"%=" {printf("ASSIGNMENT OPERATOR : %s\n" , yytext);}
"$"|"@"|"#"|"'" {printf("OTHER SYMBOL : %s\n" , yytext);}

"!" {printf("NOT : %s\n" , yytext);}
"(" {printf("LEFT_PAREN : %s\n" , yytext);}
")" {printf("RIGHT_PAREN : %s\n" , yytext);}
"{" {printf("LEFT_CURL : %s\n" , yytext);}
"}" {printf("RIGHT_CURL : %s\n" , yytext);}
"[" {printf("RIGHT_SQRB : %s\n" , yytext);}
"]" {printf("LEFT_SQRB : %s\n" , yytext);}
"," {printf("COMMA : %s\n" , yytext);}
";" {printf("SEMICOLON : %s\n" , yytext);}		
"?" {printf("QSIGN : %s\n" , yytext);}
":" {printf("DPOINT : %s\n" , yytext);}

{WHITESPACE} {}

{INT} {printf("INT : %s\n" , yytext);}
{FLOAT} {printf("FLOAT : %s\n" , yytext);}
{BOOLEAN} {printf("BOOLEAN : %s\n" , yytext);}
{STRING_CHAR} {printf("CHAR : %s\n" , yytext);}
{SHORT} printf("SHORT : %s\n" , yytext);
{LONG} printf("LONG : %s\n" , yytext);
{DOUBLE} printf("DOUBLE : %s\n" , yytext);
{INT_CONST} {printf("INT_CONST : %d\n" , atoi(yytext));}
{FLOAT_CONST} {printf("FLOAT_CONST : %f\n" , atof(yytext));}
{BOOL_CONST} {printf("BOOL_CONST : %s\n" , yytext);}
{CHAR_CONST} {printf("CHAR : %s\n" , yytext);}
{STRING_CONST} {printf("STRING : %s\n" , yytext);}

{WRONG_IDENTIFIER} {printf("ERROR ID : %s\n" , yytext);}
{IDENTIFIER} {printf("IDENTIFIER : %s\n" , yytext);}

{FLOAT_CONST_ERROR} {printf("ERROR FLOAT NUM : %s\n" , yytext);}
{CHAR_CONST_ERROR} {printf("ERROR CHAR : %s\n" , yytext);}

{COMMENT} {printf("IT'S A COMMENT : %s\n" , yytext);}

. {}

%%
int main()
{
	yylex();
	return 1;
}


int yywrap(){
return 1;
}

void errorScanner(char *s)
{
printf("ERROR: %s\n", s);
}

