%{
#include <cstring>
#include "../abstract_syntax_tree/nodes.h"
#include "../bison_files/parser.tab.hpp"
%}

DIGIT [0-9]
LETTER [a-zA-Z]
%option noyywrap

%%
run                     { return RUN; }
bind                    { return BIND; }
match                   { return MATCH; };
{LETTER}[0-9a-zA-Z]*    { yylval.channel_id = strdup(yytext);
                          return CHANNEL; }
\(                      { return LPARENTHESES; }
\)                      { return RPARENTHESES; }
\[                      { return LBRACKET; }
\]                      { return RBRACKET; }
!                       { return SEND; }
\?\*                    { return REPLICATED_RECEIVE; }
\?                      { return RECEIVE; }
\|                      { return COMPOSITION; }
,                       { return COMMA; }
[ \t\n\r\f\v]+      { /* Ignore whitespace */ }
.                   { /* Handle unexpected characters more gracefully. */
                      fprintf(stderr, "Unexpected character: %s\n", yytext);
                      return 0;
                    }
%%

