
%{
 
%}
 
 
%%
 
 
[\n] {
 printf("Hello World\n"); 
}
 
 
%%
 
int yywrap(){}
int main()
{
 yylex(); //calling the rules section
}
