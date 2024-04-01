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
%token MATCH
%token LPARENTHESES
%token RPARENTHESES
%token LBRACE
%token RBRACE
%token SEND
%token REPLICATED_RECEIVE
%token RECEIVE
%left COMPOSITION         /* Specify left associativity for '|' */

%%/* Grammar rules and actions follow */

INPUT:  /* empty */
     | RUN EXPRESSION
     | INPUT RUN EXPRESSION
;

INACTION: LPARENTHESES RPARENTHESES
;

SOLO: CHANNEL SEND CHANNEL
    | CHANNEL RECEIVE CHANNEL
    | CHANNEL REPLICATED_RECEIVE CHANNEL
;

COMPOSITION_SERIES: COMPOSITION_SERIES COMPOSITION EXPRESSION
                  | AGENT COMPOSITION AGENT
;

EXPRESSION: LPARENTHESES AGENT RPARENTHESES
;

AGENT: INACTION
     | SOLO
     | COMPOSITION_SERIES
     | BIND SET EXPRESSION
     | MATCH SET SET EXPRESSION
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