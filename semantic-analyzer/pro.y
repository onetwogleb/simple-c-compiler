
%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define YYDEBUG 1

int temp, temp2, temp3, ftemp, err, err1=0;
extern char* yytext; 
extern char tempid[100];

#define YYSTYPE struct node*
#include "lex.yy.c"

#define t_void	1
#define t_char	2
#define t_int	3
#define t_float	4
#define t_bool	5

struct symrec
{
	char *name;
	int type;
	struct symrec *next;
};

typedef struct symrec symrec;
symrec *sym_table = (symrec *)0;
symrec *putsym();
symrec *getsym();

symrec *putsym(char *sym_name,int sym_type)
{
	symrec *ptr;
	ptr=(symrec *)malloc(sizeof(symrec));
	ptr->name=(char *)malloc(strlen(sym_name)+1);
	strcpy(ptr->name,sym_name);
	ptr->type=sym_type;
	ptr->next=(struct symrec *)sym_table;
	sym_table=ptr;
	return ptr;
}

symrec *getsym(char *sym_name)
{
	symrec *ptr;
	for(ptr=sym_table;ptr!=(symrec *)0;ptr=(symrec *)ptr->next)
	if(strcmp(ptr->name,sym_name)==0)
	return ptr;
	return 0;
}


install()
{ 
	symrec *s;
	s = getsym (tempid);
	if (s == 0)
	s = putsym (tempid,temp);
	else 
	{
		printf( "\nStop! Semantic error in the line : %d || Variable or function '%s' is already defined\n\n",line, tempid);

}
	err1=1;
}

int context_check()
{ 
	symrec *s;
	s = getsym(tempid);	
	if (s == 0 )

	{
	 printf( "\nStop! Semantic error in the line : %d || Variable or function '%s' is undeclared\n\n",line, tempid);

	return 0;}
	else
	return(s->type);
	err1=1;
	
}


type_err(int temp,int temping)
{
	if(temp != temping)
	{
	 printf( "\nStop! Semantic error in the line : %d || Type mismatch for '%s'!\n\n",line, tempid);

	err1=1;
}	
}

%}


%token AUTO BREAK IF ELSE SWITCH CASE REGISTER TYPEDEF EXTERN RETURN UNION CONST UNSIGNED CONTINUE
%token FOR SIGNED VOID DEFAULT GOTO SIZEOF VOLATILE DO STATIC WHILE ENUM STRUCT INLINE PRINTF
%token MAIN ELIF ENDIF DEFINED IFDEF INFDEF UNDEF INCLUDE LINE ERROR PRAGMA

%token ASSIGN PLUS MINUS INCREMENT DECREMENT STAR SLASH PERCENT
%token RELATIONAL_OPERATOR LOGIC_OPERATOR BITWISE_OPERATOR ASSIGNMENT_OPERATOR OTHER_SYMBOL
%token NOT LEFT_PAREN RIGHT_PAREN LEFT_CURL RIGHT_CURL LEFT_SQRB RIGHT_SQRB COMMA SEMICOLON QSIGN DPOINT

%token BG BGE LS LSE EQ NEQ

%token INT FLOAT BOOL CHAR SHORT LONG DOUBLE FLOAT_CONST BOOL_CONST CHAR_CONST COMMENT STRING_CONST INT_CONST ID

%left PLUS MINUS
%left STAR SLASH
%left LEFT_PAREN RIGHT_PAREN

%%

myprog
        : main
        ;

main
        : INT MAIN LEFT_PAREN RIGHT_PAREN LEFT_CURL starting RETURN idV SEMICOLON RIGHT_CURL
        ;

idV     
        : ID {context_check();}
        | INT_CONST
        ;

starting
        : statement_list
        |
        ;

function
        : vartype id LEFT_PAREN argument RIGHT_PAREN return {type_err(ftemp, temp2);}
        | VOID id LEFT_PAREN argument RIGHT_PAREN compound_statement
	;

return
        : LEFT_CURL statement_list RETURN ID final RIGHT_CURL {if(context_check()!=0){temp2 = context_check();}}
        | LEFT_CURL statement_list RETURN value final RIGHT_CURL
        | LEFT_CURL RIGHT_CURL
        ;


argument
	: type id
        |
	;

type
        : INT
        | FLOAT
        | CHAR
        ;

compound_statement
        : LEFT_CURL statement_list RIGHT_CURL 
        | LEFT_CURL RIGHT_CURL
	;

statement_list
        : statement 
        | statement statement_list 
        ;

statement
        : ifstmt
        | whilestmt
	| forstmt
	| declaration
        | initialization
        | function
        | print
	;

declaration
        : vartype id final
	| declarationFull
        ;

declarationFull
	: vartype id ASSIGN math final {type_err(temp, temp2);}
	;

initialization
        : initID ASSIGN math final {type_err(temp3, temp2);}
        ;

initID  
        : ID {if(context_check()!=0){temp3 = context_check();}}
        ;

forstmt
	: FOR LEFT_PAREN forCond RIGHT_PAREN compound_statement 
        | FOR LEFT_PAREN SEMICOLON SEMICOLON RIGHT_PAREN 
	;

forCond
	: declarationFull forAction 
	;

forAction
	: condMath final forinit 
	;

forinit
        : ID ASSIGN math
        ;

whilestmt
        : DO compound_statement WHILE LEFT_PAREN condMath RIGHT_PAREN
        | WHILE LEFT_PAREN condMath RIGHT_PAREN compound_statement 
        ;


ifstmt
        : IF LEFT_PAREN condMath RIGHT_PAREN ifblock
        ;

ifblock
        : compound_statement elseblock
        ;

elseblock
        : ELSE compound_statement
        | 
        ;

print
        : PRINTF LEFT_PAREN STRING_CONST inner_print RIGHT_PAREN SEMICOLON  
	;

inner_print
        : COMMA ID {context_check();}
        | 
        ;

math
        : math PLUS math
        | math MINUS math 
        | math STAR math
        | math SLASH math
        | LEFT_PAREN math RIGHT_PAREN
        | ID {if(context_check()!=0){temp2 = context_check();}}
        | value
        ;

condMath
        : math BG math
        | math BGE math
        | math LS math
        | math LSE math
        | math EQ math
        | math NEQ math
        ;

id
        : ID {install();}
        | ID COMMA id
        ;

value
	: INT_CONST {temp2 = 3;}
	| FLOAT_CONST {temp2 = 4;}
        | CHAR_CONST {temp2 = 2;}
        | BOOL_CONST {temp2 = 5;}
        ;

final
        : SEMICOLON
        ;

vartype
        : INT {temp=3; ftemp=3;}
        | FLOAT {temp=4; ftemp=4;}
        | CHAR {temp=2; ftemp=2;}
        | BOOL {temp=5; ftemp=5;}
        ;

%%


int main()
{
	printf("Parsing is starting: \n");
	yyparse();
        printf("End of parsing! \n");
	return 0;
}

int yywrap()
{return 1;}


yyerror(char *s) {
	printf("Error in the line %d , Type of error :  %s Code :  %s\n", line, s, yytext);
}
