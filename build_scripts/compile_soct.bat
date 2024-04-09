rm -f soct.exe
g++ --std=c++14 -o soct bison_files\parser.tab.cpp flex_files\lex.yy.c src\main.cpp abstract_syntax_tree\nodes.h abstract_syntax_tree\nodes.cpp