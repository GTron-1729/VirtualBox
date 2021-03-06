%{
#include<stdio.h>
char makeexpr(char op1, char operator, char op2);
void threeAddr();
struct expr{char op1,op2,operator, res;};
int yylex();
void yyerror();
int indx=0;
char temp = 'A';
%}
%union{char tok;}
%token <tok> NUM VAR
%type <tok> exp stmt
%left '+' '-'
%left '*' '/'
%%
stmt: VAR '=' exp	{makeexpr((char)$1,'=',(char)$3); threeAddr();}
exp: exp '+' exp		{$$ = makeexpr((char)$1,'+',(char)$3);}
   | exp '-' exp 		{$$ = makeexpr((char)$1,'-',(char)$3);}
   | exp '*' exp 		{$$ = makeexpr((char)$1,'*',(char)$3);}
   | exp '/' exp 		{$$ = makeexpr((char)$1,'/',(char)$3);}
   | '(' exp ')' 		{$$ = (char)$2;}
   | NUM 				{$$ = makeexpr((char)$1,'\0','\0');}
   | VAR 				{$$ = (char)$1;}
%%
struct expr arr[25];
void yyerror(char *s){
	printf("Error %s",s);
}

char makeexpr(char op1, char operator, char op2){
	if(operator=='='){
		arr[indx].res=op1;
		arr[indx].operator=operator;
		arr[indx].op1=op2;
		arr[indx++].op2='\0';
		return op1;	
	}
	// ------------------------------------------> added
	/*
    if(op2!='\0'){
        arr[indx].op1=op1;
        arr[indx].operator=operator;
        arr[indx].op2=op2;
        arr[indx++].res=op2;
        return op2;
    }*/
    
    if(op1>='A' && op1<='Z'){
	    temp--;
	}
	if(op2>='A' && op2<='Z'){
	    temp--;
	}
  
    //-------------------------------------------->
	arr[indx].op1=op1;
	arr[indx].operator=operator;
	arr[indx].op2=op2;
	arr[indx++].res=temp;
	return temp++;
	/*
	char* makeexpr(char* op1, char operator, char* op2){
	if(operator=='='){
		strcpy(arr[indx].res,op1);
		arr[indx].operator=operator;
		strcpy(arr[indx].op1,op2);
		arr[indx++].op2[0]='\0';
		return op1;	
	}

	if((op1[0]>='A' && op1[0]<='Z')){
	    temp--;
	}
    if((op2[0]>='A' && op2[0]<='Z')){
        //indx--;
        temp--;
    }
	
	strcpy(arr[indx].op1,op1);
	arr[indx].operator=operator;
	strcpy(arr[indx].op2,op2);
	arr[indx].res[0]=temp;
	arr[indx++].res[1]='\0';
	temp++;
	return arr[indx-1].res;
	*/
}

}
void threeAddr(){
	int i;
	for(i=0;i<indx;i++){
		if(arr[i].operator=='='){
			printf("%c := %c\n",arr[i].res,arr[i].op1);
		}
		else
			printf("%c := %c %c %c\n",arr[i].res,arr[i].op1,arr[i].operator,arr[i].op2);
	}
}
int main(){
	printf("Enter Expression:\n");
	yyparse();
	return 0;
}
