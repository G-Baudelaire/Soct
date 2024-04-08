rm soct.exe
g++ --std=c++14 -o soct bison_files\parser.tab.cpp flex_files\lex.yy.c src\main.cpp -I abstract_syntax_tree