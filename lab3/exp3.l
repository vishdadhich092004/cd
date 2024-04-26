%{
    #include<stdio.h>
    int hex=0, id=0, oct=0, intg=0, dec=0, mult=0, arth=0, bits=0, rel=0, assnmt=0, lp=0, rp=0, del=0,key=0;
%}

%option noyywrap
L [A-Za-z]
D [0-9]
DO [0-7]
HX [A-Fa-f0-9]
%%
int|if|else|return|float|char|const|static|while|do|void {printf("Token KEYWORD : Lexeme:%s \n",yytext);return 1;}
(0X){HX}+ {printf("Token HEXADECIMAL : Lexeme: %s \n",yytext); hex++; return 1;}
{L}({L}|{D})* {printf("Token IDENTIFIER : Lexeme: %s \n",yytext); id++; return 1;}
0{DO}+ {printf("Token OCTAL : Lexeme: %s \n",yytext); oct++; return 1;}
{D}+ {printf("Token INTEGER : Lexeme: %s \n",yytext); intg++; return 1;}
{D}+\.{D}+ {printf("Token REAL : Lexeme: %s \n",yytext); dec++; return 1;}
"*"|"/"|"%" {printf("Token OPERATOR(12) : Lexeme: %s \n",yytext); mult++; return 1;}
"+"|"-" {printf("Token OPERATOR(13) : Lexeme: %s \n",yytext); arth++; return 1;}
"<<"|">>" {printf("Token BITWISE SHIFT : Lexeme: %s \n",yytext); bits++; return 1;}
"<"|"<="|">"|">="|"=="|"!=" {printf("Token RELATIONAL : Lexeme: %s \n",yytext); rel++; return 1;}
"="|"+="|"-=" {printf("Token ASSIGNMENT : Lexeme: %s \n",yytext); assnmt++; return 1;}
"("|"["|"{" {printf("Token LEFT PAR : Lexeme: %s \n",yytext); lp++; return 1;}
")"|"]"|"}" {printf("Token RIGHT PAR : Lexeme: %s \n",yytext);rp++; return 1;}
":"|"," {printf("Token DELIMITER : Lexeme: %s \n",yytext);del++; return 1;}
%%

int main()
{ 
    while(yylex());
    printf("Number of keywords token found:%d,\n",key);
    printf("Number of Hexadecimal tokens found: %d \n", hex);
    printf("Number of Identifiers found: %d \n", id);
    printf("Number of Octal tokens found: %d \n", oct);
    printf("Number of Integer tokens found: %d \n", intg);
    printf("Number of Decimal tokens found: %d \n", dec);
    printf("Number of Multiplicative tokens found: %d \n", mult);
    printf("Number of Arithmetic tokens found: %d \n", arth);
    printf("Number of Bitwise Shift tokens found: %d \n", bits);
    printf("Number of Relational tokens found: %d \n", rel);
    printf("Number of Assignment tokens found: %d \n", assnmt);
    printf("Number of Left Parenthesis found: %d \n", lp);
    printf("Number of Right Parenthesis found: %d \n", rp);
    printf("Number of Delimiter tokens found: %d \n", del);
}
