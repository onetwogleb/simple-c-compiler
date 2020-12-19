/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AUTO = 258,
    BREAK = 259,
    IF = 260,
    ELSE = 261,
    SWITCH = 262,
    CASE = 263,
    REGISTER = 264,
    TYPEDEF = 265,
    EXTERN = 266,
    RETURN = 267,
    UNION = 268,
    CONST = 269,
    UNSIGNED = 270,
    CONTINUE = 271,
    FOR = 272,
    SIGNED = 273,
    VOID = 274,
    DEFAULT = 275,
    GOTO = 276,
    SIZEOF = 277,
    VOLATILE = 278,
    DO = 279,
    STATIC = 280,
    WHILE = 281,
    ENUM = 282,
    STRUCT = 283,
    INLINE = 284,
    PRINTF = 285,
    MAIN = 286,
    ELIF = 287,
    ENDIF = 288,
    DEFINED = 289,
    IFDEF = 290,
    INFDEF = 291,
    UNDEF = 292,
    INCLUDE = 293,
    LINE = 294,
    ERROR = 295,
    PRAGMA = 296,
    ASSIGN = 297,
    PLUS = 298,
    MINUS = 299,
    INCREMENT = 300,
    DECREMENT = 301,
    STAR = 302,
    SLASH = 303,
    PERCENT = 304,
    RELATIONAL_OPERATOR = 305,
    LOGIC_OPERATOR = 306,
    BITWISE_OPERATOR = 307,
    ASSIGNMENT_OPERATOR = 308,
    OTHER_SYMBOL = 309,
    NOT = 310,
    LEFT_PAREN = 311,
    RIGHT_PAREN = 312,
    LEFT_CURL = 313,
    RIGHT_CURL = 314,
    LEFT_SQRB = 315,
    RIGHT_SQRB = 316,
    COMMA = 317,
    SEMICOLON = 318,
    QSIGN = 319,
    DPOINT = 320,
    BG = 321,
    BGE = 322,
    LS = 323,
    LSE = 324,
    EQ = 325,
    NEQ = 326,
    INT = 327,
    FLOAT = 328,
    BOOL = 329,
    CHAR = 330,
    SHORT = 331,
    LONG = 332,
    DOUBLE = 333,
    FLOAT_CONST = 334,
    BOOL_CONST = 335,
    CHAR_CONST = 336,
    COMMENT = 337,
    STRING_CONST = 338,
    INT_CONST = 339,
    ID = 340
  };
#endif
/* Tokens.  */
#define AUTO 258
#define BREAK 259
#define IF 260
#define ELSE 261
#define SWITCH 262
#define CASE 263
#define REGISTER 264
#define TYPEDEF 265
#define EXTERN 266
#define RETURN 267
#define UNION 268
#define CONST 269
#define UNSIGNED 270
#define CONTINUE 271
#define FOR 272
#define SIGNED 273
#define VOID 274
#define DEFAULT 275
#define GOTO 276
#define SIZEOF 277
#define VOLATILE 278
#define DO 279
#define STATIC 280
#define WHILE 281
#define ENUM 282
#define STRUCT 283
#define INLINE 284
#define PRINTF 285
#define MAIN 286
#define ELIF 287
#define ENDIF 288
#define DEFINED 289
#define IFDEF 290
#define INFDEF 291
#define UNDEF 292
#define INCLUDE 293
#define LINE 294
#define ERROR 295
#define PRAGMA 296
#define ASSIGN 297
#define PLUS 298
#define MINUS 299
#define INCREMENT 300
#define DECREMENT 301
#define STAR 302
#define SLASH 303
#define PERCENT 304
#define RELATIONAL_OPERATOR 305
#define LOGIC_OPERATOR 306
#define BITWISE_OPERATOR 307
#define ASSIGNMENT_OPERATOR 308
#define OTHER_SYMBOL 309
#define NOT 310
#define LEFT_PAREN 311
#define RIGHT_PAREN 312
#define LEFT_CURL 313
#define RIGHT_CURL 314
#define LEFT_SQRB 315
#define RIGHT_SQRB 316
#define COMMA 317
#define SEMICOLON 318
#define QSIGN 319
#define DPOINT 320
#define BG 321
#define BGE 322
#define LS 323
#define LSE 324
#define EQ 325
#define NEQ 326
#define INT 327
#define FLOAT 328
#define BOOL 329
#define CHAR 330
#define SHORT 331
#define LONG 332
#define DOUBLE 333
#define FLOAT_CONST 334
#define BOOL_CONST 335
#define CHAR_CONST 336
#define COMMENT 337
#define STRING_CONST 338
#define INT_CONST 339
#define ID 340

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
