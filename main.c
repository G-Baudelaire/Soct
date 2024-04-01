//
// Created by Germain Jones on 29/03/2024.
//

#include <stdio.h>
extern int yylex(void);
extern int yyparse(void);

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    // Initialize the parser
    if (yyparse() == 0) {
        // Parsing succeeded
        printf("Parsing completed successfully.\n");
    } else {
        // Parsing failed
        fprintf(stderr, "An error occurred during parsing.\n");
    }
    return 0;
}
