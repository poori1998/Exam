#include<stdio.h>
int res;
%}

%token id num

%%
stmt: exp {printf("valid expression");}
;
exp: exp '>' exp {$$=$1>$3;printf("value is %d",$$);}
|exp '<' exp {$$=$1<$3;printf("\nvalue is %d",$$);}
|exp '=''=' exp {$$=($1==$4); printf("\nvalue is %d",$$);}
|exp '!''=' exp {$$=($1!=$4); printf("\nvalue is %d",$$);}
|exp '!''=' {printf("\nerror occured 1");}
|exp '=''=' {printf("\nerror occured 2");} 
|id
|num
;
%%
int main(){
printf("enter expression\n");
yyparse();
}
int yyerror(){
printf("\ninvalid expression\n");
}
