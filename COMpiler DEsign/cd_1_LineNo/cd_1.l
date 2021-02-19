%{
 	int good = 1;
%}

%%
.* return good;
%%
int yywrap(){} 
int main(){
	int k = yylex();
	int i=1;
	while(k){
		if(k==1){
			printf("%d %s",i,yytext);
			i++;
		}
		k = yylex();
	}
	return 0;
}
