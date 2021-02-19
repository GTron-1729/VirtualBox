%{
    int number = 1;
%}

%%

[1-9][0-9]*|0     return number;

%%
int yywrap(){}
int main(){
    int token = yylex();
    int steps=0;
    while(token){
        if(token == number){
			int n = atoi(yytext); // convert to int
			int array[100]; 
			int i = 0;
			while(n!=0) 
			{    
				int temp  = 0;  
				temp = n % 16;
				if(temp < 10)  array[i++] = temp + 48; 
				else array[i++] = temp + 55; 
				n /= 16; 
				steps++;
			}
			for(int j=i-1; j>=0; j--){
				printf("%c",array[j]);
			}
			printf("\n");
			printf("No of replacements would be  ");
			printf("%d",steps);  
		}
		token = yylex();
	}
    return 0;
}
