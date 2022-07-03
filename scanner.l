%{
%}

cifra               [0-9]
identificador       [A-Za-z][A-Za-z0-9]*
letraOCifra         [A-Za-z0-9]
letra               [a-zA-Z]

literalEntero       (-|\+)?[0-9]+((e|E)(-|\+)?[0-9]+)?
literalReal         (-|\+)?[0-9]+(\.[0-9]+)?((e|E)(-|\+)?[0-9]+)?
literalBooleano     verdadero|falso
literalCaracter     \".\"
espacio             " "
literalCadena       \'([^\']*(\/\')*[^\/\']+(\/\')*)*\'

comentario          (\{([^\}]|(\/\}))*\})

accion              (?i)accion
algoritmo           (?i)algoritmo
booleano            (?i)boolean
cadena              (?i)cadena
caracter            (?i)caracter
const               (?i)const
continuar           (?i)continuar
de                  (?i)de
dev                 (?i)dev
div                 (?i)div
ent                 (?i)ent
entero              (?i)entero
e/s                 (?i)e/s
faccion             (?i)faccion
falgoritmo          (?i)falgoritmo
fconst              (?i)fconst
ffuncion            (?i)ffuncion
fmientras           (?i)fmientras
fpara               (?i)fpara
fsi                 (?i)fsi
ftipo               (?i)ftipo
ftupla              (?i)ftupla
funcion             (?i)funcion
fvar                (?i)fvar
hacer               (?i)hacer
hasta               (?i)hasta
mientras            (?i)mientras
mod                 (?i)mod
no                  (?i)no
o                   (?i)o
para                (?i)para
real                (?i)real
ref                 (?i)ref
sal                 (?i)sal
si                  (?i)si
tabla               (?i)tabla
tipo                (?i)tipo
tupla               (?i)tupla
var                 (?i)var
y                   (?i)y

operadorAsignar     ":="
operadorPuntoComa   ";"
operadorComa        ","
operadorSubRango    ".."
operadorDefinicionTipo ":"
operadorEntonces    "->"
operadorInicioArray "["
operadorFinArray    "]"
operadorIgual       "="
operadorSiNoSi      "[]"
operadorInicioParentesis "("
operadorFinParentesis ")"
operadorMas         "+"
operadorPor         "*"
operadorElevado     "^"
operadorDivisor     "/"
operadorModulo      "%"
operadorMenos       "-"
operadorMayor       ">"
operadorMenor       "<"
operadorMayorIgual ">="
operadorMenorIgual "<="
operadorComparador "=="
operadorDistinto   "!="
operadorAmpersand  "&"
operadorOr         "\|"

palabraReservada    accion|algoritmo|booleano|cadena|caracter|const|continuar|de|dev|div|ent|entero|e\/s|faccion|falgoritmo|fconst|ffuncion|fmientras|fpara|fsi|ftipo|ftupla|funcion|fvar|hacer|hasta|mientras|mod|no|o|para|real|ref|sal|si|tabla|tipo|tupla|var|y

%%

{operadorAsignar}             printf( "Un operadorAsignar: %s\n", yytext );
{operadorPuntoComa}           printf( "Un operadorPuntoComa: %s\n", yytext );
{operadorComa}                printf( "Un operadorComa: %s\n", yytext );
{operadorSubRango}            printf( "Un operadorSubRango: %s\n", yytext );
{operadorDefinicionTipo}      printf( "Un operadorDefinicionTipo: %s\n", yytext );
{operadorEntonces}            printf( "Un operadorEntonces: %s\n", yytext );
{operadorInicioArray}         printf( "Un operadorInicioArray: %s\n", yytext );
{operadorFinArray}           printf( "Un operadorFinArray: %s\n", yytext );
{operadorIgual}               printf( "Un operadorIgual: %s\n", yytext );
{operadorSiNoSi}              printf( "Un operadorSiNoSi: %s\n", yytext );
{operadorInicioParentesis}    printf( "Un operadorInicioParentesis: %s\n", yytext );
{operadorFinParentesis}       printf( "Un operadorFinParentesis: %s\n", yytext );
{operadorMas}                 printf( "Un operadorMas: %s\n", yytext );
{operadorPor}                 printf( "Un operadorPor: %s\n", yytext );
{operadorElevado}             printf( "Un operadorElevado: %s\n", yytext );
{operadorDivisor}             printf( "Un operadorDivisor: %s\n", yytext );
{operadorModulo}              printf( "Un operadorModulo: %s\n", yytext );
{operadorMenos}               printf( "Un operadorMenos: %s\n", yytext );
{operadorMayor}               printf( "Un operadorMayor: %s\n", yytext );
{operadorMenor}               printf( "Un operadorMenor: %s\n", yytext );
{operadorMayorIgual}          printf( "Un operadorMayorIgual: %s\n", yytext );
{operadorMenorIgual}          printf( "Un operadorMenorIgual: %s\n", yytext );
{operadorComparador}          printf( "Un operadorComparador: %s\n", yytext );
{operadorDistinto}            printf( "Un operadorDistinto: %s\n", yytext );
{operadorAmpersand}           printf( "Un operadorAmpersand: %s\n", yytext );
{operadorOr}                  printf( "Un operadorOr: %s\n", yytext );

{palabraReservada}      printf( "Una palabraReservada: %s\n", yytext );

{literalCaracter}        printf( "Un literalCaracter: %s\n", yytext );

{literalCadena}        printf( "Un literalCadena: %s\n", yytext );

{comentario}        printf( "Un comentario: %s\n", yytext );

{literalEntero}        printf( "Un literalEntero: %s\n", yytext );

{literalReal}        printf( "Un literalReal: %s\n", yytext );

{literalBooleano}        printf( "Un literalBooleano: %s\n", yytext );

{identificador}        printf( "Un identificador: %s\n", yytext );

{letra}        printf( "Un letra: %s\n", yytext );

{espacio}        printf( "Un espacio: %s\n", yytext );

{cifra}    printf( "Una cifra: %s\n", yytext );

.           printf( "Caracter no reconocido: %s\n", yytext );

%%

int main( int argc, char **argv )
{
++argv, --argc;  /* skip over program name */
if ( argc > 0 )
yyin = fopen( argv[0], "r" );
else
yyin = stdin;
yylex();
}