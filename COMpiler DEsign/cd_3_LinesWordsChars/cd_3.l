%{ 
int lines=0, words=0, ch=0; 
%} 
  
%% 
\n lines++;  
([a-zA-Z0-9])+ words++;  // ([ ])+
. ch++;    
%% 
int yywrap(){}
int main() 
{ 
    yylex(); 
      
    printf("\nNo. of lines=%d", lines);   
    printf("\nNo. of words=%d", words);  
    printf("\nNo. of characters=%d", ch); 
    return 0;  
}
