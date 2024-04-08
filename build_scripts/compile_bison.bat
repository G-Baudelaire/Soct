cd bison_files
rm parser.tab.cpp
rm parser.tab.hpp
rm parser.output
win_bison -d -v parser.ypp
cd ..