%{
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap

%%
run                 { return RUN; }
bind                { return BIND; }
print               { return PRINT; }
[a-zA-Z]+           { return CHANNEL; }
\(                  { return LPARENTHESES; }
\)                  { return RPARENTHESES; }
\{                  { return LBRACE; }
\}                  { return RBRACE; }
!                   { return SEND; }
\?                  { return RECEIVE; }
\|                  { return COMPOSITION; }
,                   { return COMMA; }
[ \t\n\r\f\v]+      { /* Ignore whitespace */ }
.                   { /* Handle unexpected characters more gracefully. */
                      fprintf(stderr, "Unexpected character: %s\n", yytext);
                      return 0;
                    }
%%

