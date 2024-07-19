%{
#include <stdio.h>
#include <string.h>
%}

%%


"if"                    { printf("KEYWORD: if\n"); }
"else"                  { printf("KEYWORD: else\n"); }
"while"                 { printf("KEYWORD: while\n"); }
"for"                   { printf("KEYWORD: for\n"); }
"def"                   { printf("KEYWORD: def\n"); }
"return"                { printf("KEYWORD: return\n"); }
"import"                { printf("KEYWORD: import\n"); }
"class"                 { printf("KEYWORD: class\n"); }
"try"                   { printf("KEYWORD: try\n"); }
"except"                { printf("KEYWORD: except\n"); }
"True"                  { printf("KEYWORD: True\n"); }
"False"                 { printf("KEYWORD: False\n"); }
"None"                  { printf("KEYWORD: None\n"); }
"and"                   { printf("KEYWORD: and\n"); }
"or"                    { printf("KEYWORD: or\n"); }
"not"                   { printf("KEYWORD: not\n"); }
"pass"                  { printf("KEYWORD: pass\n"); }
"break"                 { printf("KEYWORD: break\n"); }
"continue"              { printf("KEYWORD: continue\n"); }
"lambda"                { printf("KEYWORD: lambda\n"); }
"yield"                 { printf("KEYWORD: yield\n"); }
"global"                { printf("KEYWORD: global\n"); }
"nonlocal"              { printf("KEYWORD: nonlocal\n"); }
"assert"                { printf("KEYWORD: assert\n"); }
"del"                   { printf("KEYWORD: del\n"); }

[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFIER: %s\n", yytext); }

[0-9]+                  { printf("INTEGER: %s\n", yytext); }
[0-9]+\.[0-9]+          { printf("FLOAT: %s\n", yytext); }
\'([^\\\']|\\.)*\'      { printf("STRING: %s\n", yytext); }
\"([^\\\"]|\\.)*\"      { printf("STRING: %s\n", yytext); }

\#.*                    { printf("COMMENT: %s\n", yytext); }
\'\'\'([^\\\']|\\.|\\n)*\'\'\'  { printf("COMMENT: %s\n", yytext); }
\"\"\"([^\\\"]|\\.|\\n)*\"\"\"  { printf("COMMENT: %s\n", yytext); }

\+|\-|\*|\/|\=|\<|\>|\<=|\>=|\==|\!=|\&|\||\~|\^ { printf("OPERATOR: %s\n", yytext); }
\+=|\-=|\*=|\/=|\%=|\*\*=|\&=|\|=|\^=|\>\>=|\<\<\=|\!\=|\=\= { printf("OPERATOR: %s\n", yytext); }

\(|\)|\{|\}|\[|\]|\;|\,|\:|\.\.|\.\.\.|\.\.\. { printf("DELIMITOR: %s\n", yytext); }

[ \t\n]+                { /* ignore whitespace */ }

.                       { printf("UNKNOWN: %s\n", yytext); }

%%

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
