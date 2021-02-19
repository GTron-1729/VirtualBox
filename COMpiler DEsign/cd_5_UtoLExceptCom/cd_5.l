%{
    int multiLine = 1;
    int singleLine = 2;
    int upper = 3;
    char str[500];
%}

%%

\/\*[a-z /* A-Z 0-9\n]*\*\/    return multiLine; // "/*"[^*/]*"*/" 
\/\/[^\n]*                     return singleLine;
[A-Z]                       return upper;

%%
int yywrap(){}
int main(){
    int k = yylex();
    while(k){
        if(k == multiLine){
            printf("Multiline comment is \n%s ",yytext);
        }
        else if(k == singleLine){
            printf("Single-line comment is \n%s",yytext);
        }
        else if(k==upper){
            printf("%c",tolower(yytext[0]));
        }
        k = yylex();
    }
    return 0;
}
