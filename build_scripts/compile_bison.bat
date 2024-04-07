cd bison_files
rm parser.tab.c
rm parser.tab.h
rm parser.output
win_bison -d -v parser.y
cd ..