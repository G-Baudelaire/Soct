//
// Created by Germain Jones on 25/02/2024.
//

%{
%}

%token CHANNEL
%token RUN
%token BIND
%token PRINT
%token COMMA
%token INACTION
%token LPARENTHESES
%token RPARENTHESES
%token LBRACE
%token RBRACE
%token SEND
%token RECEIVE
%left COMPOSITION         /* Specify left associativity for '|' */

%%/* Grammar rules and actions follow */

INPUT:  /* empty */
     | RUN EXPRESSION
     | INPUT RUN EXPRESSION
;

EXPRESSION: LPARENTHESES RPARENTHESES
          | PRINT SEND CHANNEL
          | CHANNEL SEND CHANNEL
          | CHANNEL RECEIVE CHANNEL
          | LPARENTHESES EXPRESSION RPARENTHESES
          | LPARENTHESES BIND SET EXPRESSION RPARENTHESES
          | LPARENTHESES COMPOSITION_SERIES RPARENTHESES
;

COMPOSITION_SERIES: EXPRESSION COMPOSITION EXPRESSION
                  | COMPOSITION_SERIES COMPOSITION EXPRESSION
;

SET: LBRACE LIST RBRACE
;

LIST: /* empty */
    | LIST CHANNEL
    | LIST COMMA CHANNEL
;
%%

extern int yylex(void);
extern int yyerror(char *s);