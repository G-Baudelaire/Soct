rm soct.exe

cd bison_files
rm parser.tab.c
rm parser.tab.h
rm parser.output
win_bison -d -v parser.y
cd ..

cd flex_files
rm lex.yy.c
win_flex lexer.l
cd ..

gcc -o soct bison_files\parser.tab.c flex_files\lex.yy.c src\main.c
