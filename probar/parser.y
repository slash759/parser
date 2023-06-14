%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
expr : expr '+' expr   { printf("Suma\n"); }
     | expr '-' expr   { printf("Resta\n"); }
     | expr '*' expr   { printf("Multiplicación\n"); }
     | expr '/' expr   { printf("División\n"); }
     | NUMBER          { printf("Número\n"); }
     ;

%%

int main() {
    yyparse();
    return 0;
}

int yylex() {
    int c = getchar();
    if (c == EOF)
        return 0;
    else if (c == '+' || c == '-' || c == '*' || c == '/')
        return c;
    else if (c >= '0' && c <= '9')
        return NUMBER;
    else
        return c;
}

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}