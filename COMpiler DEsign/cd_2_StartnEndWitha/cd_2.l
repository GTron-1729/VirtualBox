%{
 	int good= 1;   
%}

%%
a.*  return good;
.*a  return good;
.* ; // This is like switch case default. if nothing matches we will drop the input
%%

int main(){
	int k = yylex();
	while(k){
		if( k == 1){
			printf("%s", yytext);
		}
		 k = yylex();
	}
	return 0;
}
