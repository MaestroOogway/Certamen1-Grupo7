/***************** 
  Definiciones
	Se colocan las cabeceras, variables y expresiones regulares

********************/


%{
  #include "matriz.tab.h"
  #include<stdlib.h>
  #include <stdio.h>
  int  yylex ();
  int linea=0;
%}
%option noyywrap


DIGITO [0-9]
NUMERO {DIGITO}+
IGNORA [" "|\t]

%%   
{NUMERO} {yylval.entero=atoi(yytext); return(NUMERO);}
"ajuntar"  {return (SUMAR);}
"(" {return (PAA); }
")" {return (PAC); }
"{" {return (LLAVEABIERTA); }
"}" {return (LLAVECERRADA); }
"," {return (COMA); }
":" {return (DOSPUNTOS); }
"fin" {return (FINAL);}
"/n" 	{linea++;}
" "	{}
[a-zA-Z]+ {return LETRA;}
[\t\r\f\n] {}
. {
	printf("Error lexico en linea %d",linea);
	getche();
}
%%
