@echo off
rm lex.yy.c
rm parser.tab.c
rm parser.tab.h
rm soct.exe
bison -d parser.y
flex lexer.l
gcc -o soct parser.tab.c lex.yy.c main.c
