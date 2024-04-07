%{
#include <string.h>
#include "../bison_files/parser.tab.h"

%}

%option noyywrap

%%
run                 { return RUN; }
bind                { return BIND; }
print               { return PRINT; }
match               { return MATCH; };
[a-zA-Z]+           { return CHANNEL; }
\(                  { return LPARENTHESES; }
\)                  { return RPARENTHESES; }
\[                  { return LBRACKET; }
\]                  { return RBRACKET; }
!                   { return SEND; }
\?\*                  { return REPLICATED_RECEIVE; }
\?                  { return RECEIVE; }
\|                  { return COMPOSITION; }
,                   { return COMMA; }
[ \t\n\r\f\v]+      { /* Ignore whitespace */ }
.                   { /* Handle unexpected characters more gracefully. */
                      fprintf(stderr, "Unexpected character: %s\n", yytext);
                      return 0;
                    }
%%

