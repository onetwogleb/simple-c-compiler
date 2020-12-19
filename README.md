## General info
Simple C Compiler 

Type: Course project
Subject: Introduction to Compilation
Institution: SCE - Shamoon College of Engineering
	
## Technologies
Project is created with:
* lex
* yacc

## Structure
Project consists of 3 parts: Scanner, Parser and Semantic Analyzer.

* Scanner (includes only lex file) detects marked tokens
* Parser makes a syntax analysis and prints a syntax tree
* Semantic Analyzer checks for errors (declaration of variables, type mismatch, etc.)

Each folder has a .pdf file with input code and output examples.

## Build
To run this project, use list of commands:

```
$ lex pro.l
$ yacc -d pro.y
$ cc -o test y.tab.c -ll -Ly
$ ./test<text.t
```
