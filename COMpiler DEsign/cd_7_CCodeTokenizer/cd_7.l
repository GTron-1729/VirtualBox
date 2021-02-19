%{
	#define keyword 10
	#define identifier 20
	#define number 30
	#define operator 40
	#define string 50
	#define block_start 5
	#define block_end 6
	#define EOL 99
%}

%%

auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int                return keyword;
long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while    return keyword;


"{"                     return block_start;
"}"                     return block_end;
\"[a-zA-Z0-9!@#$%^&*()_+= ]*\"  return string;
[a-zA-Z][a-zA-Z0-9]*    return identifier;
0|([1-9][0-9]*)             return number;
=|==|%|<|>|<=|>=|&&|\|\|  return operator;
";"                     return EOL;


%%
int yywrap(){}
int main(){ 
    int ntoken = yylex();
    while(ntoken){
        if(ntoken == keyword){
            printf("\nKeyword: %s",yytext);
        }
        if(ntoken == block_start){
            printf("\nblock start %s",yytext);
        }

        if(ntoken == block_end){
            printf("\nblock end %s ",yytext);
        }
        if(ntoken == number){
            printf("\nnumber: %s ",yytext);
        }
        if(ntoken == identifier){
            printf("\nIdentifier: %s ",yytext);
        }
        if(ntoken == string){
            printf("\nstring: %s ",yytext);
        }
        if(ntoken == operator){
            printf("\noperator: %s ",yytext);
        }
        if(ntoken == EOL){
            printf("\nEOL: %s ",yytext);
        }
        ntoken = yylex();
    }
}  
