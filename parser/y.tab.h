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
    ELIF = 286,
    ENDIF = 287,
    DEFINED = 288,
    IFDEF = 289,
    INFDEF = 290,
    UNDEF = 291,
    INCLUDE = 292,
    LINE = 293,
    ERROR = 294,
    PRAGMA = 295,
    ASSIGN = 296,
    PLUS = 297,
    MINUS = 298,
    INCREMENT = 299,
    DECREMENT = 300,
    STAR = 301,
    SLASH = 302,
    PERCENT = 303,
    RELATIONAL_OPERATOR = 304,
    LOGIC_OPERATOR = 305,
    BITWISE_OPERATOR = 306,
    ASSIGNMENT_OPERATOR = 307,
    OTHER_SYMBOL = 308,
    NOT = 309,
    LEFT_PAREN = 310,
    RIGHT_PAREN = 311,
    LEFT_CURL = 312,
    RIGHT_CURL = 313,
    LEFT_SQRB = 314,
    RIGHT_SQRB = 315,
    COMMA = 316,
    SEMICOLON = 317,
    QSIGN = 318,
    DPOINT = 319,
    BG = 320,
    BGE = 321,
    LS = 322,
    LSE = 323,
    EQ = 324,
    NEQ = 325,
    INT = 326,
    FLOAT = 327,
    BOOL = 328,
    CHAR = 329,
    SHORT = 330,
    LONG = 331,
    DOUBLE = 332,
    INT_CONST = 333,
    FLOAT_CONST = 334,
    BOOL_CONST = 335,
    CHAR_CONST = 336,
    STRING_CONST = 337,
    ID = 338,
    COMMENT = 339
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
#define ELIF 286
#define ENDIF 287
#define DEFINED 288
#define IFDEF 289
#define INFDEF 290
#define UNDEF 291
#define INCLUDE 292
#define LINE 293
#define ERROR 294
#define PRAGMA 295
#define ASSIGN 296
#define PLUS 297
#define MINUS 298
#define INCREMENT 299
#define DECREMENT 300
#define STAR 301
#define SLASH 302
#define PERCENT 303
#define RELATIONAL_OPERATOR 304
#define LOGIC_OPERATOR 305
#define BITWISE_OPERATOR 306
#define ASSIGNMENT_OPERATOR 307
#define OTHER_SYMBOL 308
#define NOT 309
#define LEFT_PAREN 310
#define RIGHT_PAREN 311
#define LEFT_CURL 312
#define RIGHT_CURL 313
#define LEFT_SQRB 314
#define RIGHT_SQRB 315
#define COMMA 316
#define SEMICOLON 317
#define QSIGN 318
#define DPOINT 319
#define BG 320
#define BGE 321
#define LS 322
#define LSE 323
#define EQ 324
#define NEQ 325
#define INT 326
#define FLOAT 327
#define BOOL 328
#define CHAR 329
#define SHORT 330
#define LONG 331
#define DOUBLE 332
#define INT_CONST 333
#define FLOAT_CONST 334
#define BOOL_CONST 335
#define CHAR_CONST 336
#define STRING_CONST 337
#define ID 338
#define COMMENT 339

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
