%{    
  #include <stdio.h>
  #include <stdlib.h>
  #include <math.h>

   void yyerror(char*msg);
   void automata(int matriz1[4][4]);
   
   extern char *yytext;
   extern int linea;
   extern FILE *yyin;
   extern int yylex(void);
   int matriz1[4][4];     
%}
%union
{
  int entero;
}
%token <entero> NUMERO
%token CONSTRUIR
%token RESTAR
%token PAA
%token PAC 
%token LLAVEABIERTA 
%token LLAVECERRADA 
%token COMA 
%token DOSPUNTOS
%token SEMI
%token FINAL
%token LETRA

%type <entero> UNO
%type <entero> DOS
%type <entero> TRES
%type <entero> CUATRO

%type <entero> CINCO
%type <entero> SEIS
%type <entero> SIETE
%type <entero> OCHO

%type <entero> NUEVE
%type <entero> DIEZ
%type <entero> ONCE
%type <entero> DOCE

%type <entero> TRECE
%type <entero> CATORCE
%type <entero> QUINCE
%type <entero> DIESICEIS


%%
Statement: EXPRESION;
EXPRESION: CONSTRUIR PAA MATRIX PAC FIANILAR;

FIANILAR : FINAL{
	automata(matriz1)
} | LETRA {
		printf("\n La sentencia no es valida ");
	}
MATRIX: VECTORUNO  VECTORDOS VECTORTRES VECTORCUATRO;
VECTORUNO : LLAVEABIERTA UNO COMA DOS COMA TRES COMA CUATRO LLAVECERRADA;
VECTORDOS : LLAVEABIERTA CINCO COMA SEIS COMA SIETE COMA OCHO LLAVECERRADA;
VECTORTRES : LLAVEABIERTA NUEVE COMA DIEZ COMA ONCE COMA DOCE  LLAVECERRADA;
VECTORCUATRO : LLAVEABIERTA TRECE COMA CATORCE COMA QUINCE COMA DIESICEIS LLAVECERRADA;

UNO:NUMERO{ matriz1[0][0]= $1;}; 
DOS:NUMERO{ matriz1[0][1]= $1;};
TRES:NUMERO{ matriz1[0][2]= $1;};
CUATRO:NUMERO{matriz1[0][3]= $1;};
CINCO:NUMERO{matriz1[1][0]= $1;};
SEIS:NUMERO{matriz1[1][1]= $1;};
SIETE:NUMERO{matriz1[1][2]= $1;};
OCHO:NUMERO{matriz1[1][3]= $1;};
NUEVE:NUMERO{matriz1[2][0]= $1;};
DIEZ:NUMERO{matriz1[2][1]= $1;};
ONCE:NUMERO{matriz1[2][2]= $1;};
DOCE:NUMERO{matriz1[2][3]= $1;};
TRECE:NUMERO{matriz1[3][0]= $1;};
CATORCE:NUMERO{matriz1[3][1]= $1;};
QUINCE:NUMERO{matriz1[3][2]= $1;};
DIESICEIS:NUMERO{matriz1[3][3]= $1;};


%%
void yyerror(char *s){
  printf("\n Sentencia no es valida: %s",s);
  printf("\n Presiona una tecla para salir...");
  getche();
  
}
int main(int argc,char **argv){
  if (argc>1)
	yyin=fopen(argv[1],"rt");
  else
	yyin=stdin;

  yyparse();
  return 0;
}
void automata(int matriz1[4][4]){

	int f=0, g=0;
	printf("\n\n:: Automata ::\n");
	printf("t=0\n");
	while(f<4){
		g=0;
		while(g<4){
			printf("%d\t",matriz1[f][g]);
			g++;
		}
		f++;
		printf("\n");
	}


	printf("t=1\n");
	


	f=0; g=0;

	int vecinoa;
	int vecinoi;
	int vecinod;
	int vecinob;

	while(f<4){
		g=0;
		while(g<4){

			// 1 suseptible
			// 2 expuesto
			// 3 infectado
			// 4 recuperado

			vecinoa = matriz1[f+1][g];
			vecinoi = matriz1[f][g-1];
			vecinod = matriz1[f][g+1];
			vecinob = matriz1[f+1][g];

			if ((matriz1[f][g] == 1) || (matriz1[f][g] == 2)){	//si existe un infectado a la izquerda o derecha de alguien suseptible  o expuesto sera infectado
			    if ((vecinod == 3) || (vecinoi == 3)) {
          			matriz1[f][g] = 3;
				}
				else{											//de lo contrario nada
					matriz1[f][g] = matriz1[f][g];
				}
			}

			else{
			    if (vecinoa == 4){				//si existe un recuperado abajo sera recuperado
          			matriz1[f][g] = 4;
				}
				else{
					matriz1[f][g] = matriz1[f][g] ;//de lo contrario nada
				}
			}

			printf("%d\t",matriz1[f][g]);
			g++;
		}
		printf("\n");
		f++;
    }


	printf("t=2\n");
	

	f=0; g=0;

	while(f<4){
		g=0;
		while(g<4){

			// 1 suseptible
			// 2 expuesto
			// 3 infectado
			// 4 recuperado

			vecinoa = matriz1[f+1][g];
			vecinoi = matriz1[f][g-1];
			vecinod = matriz1[f][g+1];
			vecinob = matriz1[f+1][g];

			if ((matriz1[f][g] == 1) || (matriz1[f][g] == 2)){	//si existe un infectado a la izquerda o derecha de alguien suseptible  o expuesto sera infectado
			    if ((vecinod == 3) || (vecinoi == 3)) {
          			matriz1[f][g] = 3;
				}
				else{											//de lo contrario nada
					matriz1[f][g] = matriz1[f][g];
				}
			}

			else{
			    if (vecinoa == 4){				//si existe un recuperado abajo sera recuperado
          			matriz1[f][g] = 4;
				}
				else{
					matriz1[f][g] = matriz1[f][g] ;//de lo contrario nada
				}
			}

			printf("%d\t",matriz1[f][g]);
			g++;
		}
		printf("\n");
		f++;
    }


	printf("t=3\n");
	


	f=0; g=0;

	while(f<4){
		g=0;
		while(g<4){

			// 1 suseptible
			// 2 expuesto
			// 3 infectado
			// 4 recuperado

			vecinoa = matriz1[f+1][g];
			vecinoi = matriz1[f][g-1];
			vecinod = matriz1[f][g+1];
			vecinob = matriz1[f+1][g];

			if ((matriz1[f][g] == 1) || (matriz1[f][g] == 2)){	//si existe un infectado a la izquerda o derecha de alguien suseptible  o expuesto sera infectado
			    if ((vecinod == 3) || (vecinoi == 3)) {
          			matriz1[f][g] = 3;
				}
				else{											//de lo contrario nada
					matriz1[f][g] = matriz1[f][g];
				}
			}

			else{
			    if (vecinoa == 4){				//si existe un recuperado abajo sera recuperado
          			matriz1[f][g] = 4;
				}
				else{
					matriz1[f][g] = matriz1[f][g] ;//de lo contrario nada
				}
			}

			printf("%d\t",matriz1[f][g]);
			g++;
		}
		printf("\n");
		f++;
    }
}
