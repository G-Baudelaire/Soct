@echo off
rm soct.exe

cd bison_files
rm parser.tab.c
rm parser.tab.h
rm parser.output
bison -d -v parser.y
cd ..

cd flex_files
rm lex.yy.c
flex lexer.l
cd ..

gcc -o soct bison_files\parser.tab.c flex_files\lex.yy.c main.c
