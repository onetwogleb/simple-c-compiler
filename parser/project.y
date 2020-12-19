
%{

int yylex();
int yyerror (char *s);

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct node
	{
		struct node* left;
		struct node* right;
		char* token;
	};
	struct node* addnode(struct node* left,struct node* right,char* token);
	void printtree(struct node* tree); 

	

extern char* yytext;
#define YYSTYPE struct node*
#include "lex.yy.c"

%}

%token AUTO BREAK IF ELSE SWITCH CASE REGISTER TYPEDEF EXTERN RETURN UNION CONST UNSIGNED CONTINUE
%token FOR SIGNED VOID DEFAULT GOTO SIZEOF VOLATILE DO STATIC WHILE ENUM STRUCT INLINE PRINTF
%token ELIF ENDIF DEFINED IFDEF INFDEF UNDEF INCLUDE LINE ERROR PRAGMA

%token ASSIGN PLUS MINUS INCREMENT DECREMENT STAR SLASH PERCENT
%token RELATIONAL_OPERATOR LOGIC_OPERATOR BITWISE_OPERATOR ASSIGNMENT_OPERATOR OTHER_SYMBOL
%token NOT LEFT_PAREN RIGHT_PAREN LEFT_CURL RIGHT_CURL LEFT_SQRB RIGHT_SQRB COMMA SEMICOLON QSIGN DPOINT

%token BG BGE LS LSE EQ NEQ

%token INT FLOAT BOOL CHAR SHORT LONG DOUBLE INT_CONST FLOAT_CONST BOOL_CONST CHAR_CONST STRING_CONST ID COMMENT

%left PLUS MINUS
%left STAR SLASH
%left LEFT_PAREN RIGHT_PAREN

%%

myprog
        : starting {printtree($1);}
        ;

starting
        : functions {$$ = addnode($1, NULL, "");}
        | functions starting {$$ = addnode($1, $2, "");}
        | errors
        ;

functions
        : ifstmt
        | whilestmt
	| forstmt
	| declaration
        | array
        | loopblock
	;

declaration
        : vartype id final {$$ = addnode(NULL, $2, "");}
	| declarationFull
        | initialization
	;

declarationFull
	: vartype id ASSIGN math final {$$ = addnode($2, $4, "=");}
	;

initialization
        : id ASSIGN math final {$$ = addnode($1, $3, "=");}
        ;

forstmt
	: FOR LEFT_PAREN forCond RIGHT_PAREN loopblock {$$ = addnode($3, $5, "FOR LOOP");}
        | FOR LEFT_PAREN SEMICOLON SEMICOLON RIGHT_PAREN {$$ = addnode(NULL, NULL, "INFINITE FOR LOOP");}
	;

forCond
	: declarationFull forAction {$$ = addnode($1, $2, "FOR COND");}
	;

forAction
	: condMath final forinit {$$ = addnode($1, $3, "");}
	;

forinit
        : id ASSIGN math {$$ = addnode($1, $3, "=");}
        ;

whilestmt
        : DO loopblock WHILE LEFT_PAREN condMath RIGHT_PAREN {$$ = addnode($5, $2, "DO COND");}
        | WHILE LEFT_PAREN condMath RIGHT_PAREN loopblock {$$ = addnode($3, $5, "WHILE COND");}
        ;

loopblock
        : LEFT_CURL starting RIGHT_CURL {$$ = addnode($2, NULL, "LOOP BLOCK");}
        ;

ifstmt
        : IF LEFT_PAREN condMath RIGHT_PAREN ifblock {$$ = addnode($3, $5, "IF COND");}
        ;

ifblock
        : LEFT_CURL starting RIGHT_CURL elseblock {$$ = addnode($2, $4, "IF BLOCK");}
        ;

elseblock
        : ELSE LEFT_CURL starting RIGHT_CURL {$$ = addnode($3, NULL, "ELSE BLOCK");}
        | {$$ = addnode(NULL, NULL, "EMPTY ELSE");}
        ;

math
        : math PLUS math {$$ = addnode($1, $3, "+");}
        | math MINUS math {$$ = addnode($1, $3, "-");}
        | math STAR math {$$ = addnode($1, $3, "*");}
        | math SLASH math {$$ = addnode($1, $3, "/");}
        | LEFT_PAREN math RIGHT_PAREN {$$ = addnode($2, NULL, "");}
        | idV {$$ = addnode(NULL, NULL, yytext);}
        ;

condMath
        : math BG math {$$ = addnode($1, $3, ">");}
        | math BGE math {$$ = addnode($1, $3, ">=");}
        | math LS math {$$ = addnode($1, $3, "<");}
        | math LSE math {$$ = addnode($1, $3, "<=");}
        | math EQ math {$$ = addnode($1, $3, "==");}
        | math NEQ math {$$ = addnode($1, $3, "!=");}
        ;

idV
        : id {$$ = addnode(NULL, NULL, yytext);}
        | value {$$ = addnode(NULL, NULL, yytext);}
        ;

id
        : ID {$$ = addnode(NULL, NULL, yytext);}
        ;

value
	: INT_CONST {$$ = addnode(NULL, NULL, yytext);}
	| FLOAT_CONST {$$ = addnode(NULL, NULL, yytext);}
        | CHAR_CONST {$$ = addnode(NULL, NULL, yytext);} 
	;

array
        : vartype id LEFT_SQRB RIGHT_SQRB ASSIGN arrayfill {$$ = addnode($2, $6, "ARRAY");}
        | vartype id LEFT_SQRB RIGHT_SQRB SEMICOLON {$$ = addnode($2, NULL, "ARRAY");}
        ;

arrayfill
        : LEFT_CURL arrayin RIGHT_CURL SEMICOLON {$$ = addnode($2, NULL, "ELEMENTS");}
        ;

arrayin
        : value {$$ = addnode($1, NULL, "");}
        | value COMMA arrayin {$$ = addnode($1, $3, "");}
        ;

final
        : SEMICOLON
        | {yyerror("Missed semicolon ';'");}
        ;

vartype
        : INT {$$ = $1;}
        | FLOAT {$$ = $1;}
        | CHAR {$$ = $1;}
        ;

errors
        : idV idV SEMICOLON {yyerror("Invalid declaration or math operation");}
        | idV SEMICOLON {yyerror("Single variable or number");}
        | id LEFT_SQRB RIGHT_SQRB ASSIGN arrayfill {yyerror("Not type declared array");}
        ;

%%


struct node* addnode(struct node* left,struct node* right,char* token)
{
	struct node* new=(struct node*)malloc(sizeof(struct node));
	char* newstr=(char*)malloc(strlen(token)+1);
	strcpy(newstr,token);
	new->left=left;
	new->right=right;
	new->token=newstr;
	return new;
}

void printtree(struct node *tree)
{
int i;
if (tree->left || tree->right)
printf("(");
printf(" %s ", tree->token);
if (tree->left){
printtree(tree->left);
}
if (tree->right)
printtree(tree->right);
if (tree->left || tree->right)
printf(") \n");
}

int main()
{
	printf("Parsing is starting: \n");
	yyparse();
	return 0;
}

int yywrap()
{return 1;}


int yyerror(char *s) {
       fprintf(stderr, "Stopping: %s \n", s);
return 0;
}
