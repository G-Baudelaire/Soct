rm soct.exe

gcc -o soct bison_files\parser.tab.c flex_files\lex.yy.c src\main.c
