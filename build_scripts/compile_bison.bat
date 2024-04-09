cd bison_files
rm -f parser.tab.cpp
rm -f parser.tab.hpp
rm -f parser.output
win_bison -d -v parser.ypp
cd ..