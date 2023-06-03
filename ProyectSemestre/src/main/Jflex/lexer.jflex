package umg.compiladores;

import java_cup.runtime.*;

%%

%public
%class Lexer
%char
%line
%column
%cup

%{
/* Declaración de variables globales */
String currentType = "";
boolean isArray = false;

/* Método auxiliar para crear tokens */
public Symbol token(int sym) {
    return new Symbol(sym, yyline, yycolumn);
}
%}

/* Definición de expresiones regulares */
digito= [0-9]
numero = {digito}+
palabra = [a-zA-Z]+
identificador = [a-zA-Z][a-zA-Z0-9]*
numeroFloat = ^-?\d+(?:.\d+)?$
numeroDouble= ^-?\d+(?:.\d+)?(?:[eE][+-]?\d+)?$
numeroEntero = ^-?\d+$
Logico = "&" | "&&" | "||" | "!" 
espacios_blanco = [\r|\n|\r\n| |\t]
comillas = [""]

%%

/* 1.Declaración y asignación de valores a variables */
"float"         {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.FLOAT, yytext());}

"double"        {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DOUBLE, yytext());}
 
"int"           {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.INT, yytext());} 

"long"          {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.LONG, yytext());}

"short"         {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.SHORT, yytext());}
   
"String"        {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.STRING, yytext());}
   
"boolean"       {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.BOOLEAN, yytext());}

"true"          {return symbol(sym.TRUE, yytext());}

"false"         {return symbol(sym.FALSE, yytext());}

{identificador} { System.out.println("Lexema: " + yytext()); return symbol (sym.IDENTIFICADOR, yytext());}

{numero}        { System.out.println("Lexema: " + yytext()); return symbol (sym.NUMERO, yytext());}

{numeroFloat}   { System.out.println("Lexema: " + yytext()); return symbol (sym.FLOAT_NUM, yytext());}

{numeroDouble}  { System.out.println("Lexema: " + yytext()); return symbol (sym.DOUBLE_NUM, yytext());}

{numeroEntero}  { System.out.println("Lexema: " + yytext()); return symbol (sym.INT_NUM, yytext());}

{espacios_blanco}   { /*Ignorar estos símbolos*/ }

/* 2. Expresiones */
/* 2.1 Aritmeticas */
"+"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.SUMA, yytext());} 
                
"-"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.RESTA, yytext());}

"*"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.MULTIPLICACION, yytext());}

"/"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DIVISION, yytext());}

"^"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.POTENCIA, yytext());}

"("             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.PARENTESIS_ABRE, yytext());}

")"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.PARENTESIS_CIERRA, yytext());}

/* 2.2 Relaciones */
">"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.MAYOR_QUE, yytext());}

"<"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.MENOR_QUE, yytext());}

">="             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.MAYOR_IGUAL, yytext());}

"<="             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.MENOR_IGUAL, yytext());}

"="             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.IGUAL, yytext());}

"=!"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DIFERENTE, yytext());}

/* 2.3 Logica */
"&"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.Y, yytext());}

"|"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.O, yytext());}

"!"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.NEGACION, yytext());}

/* 3 Estructura Selectiva */
"if"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.IF, yytext());}

"else"           {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.ELSE, yytext());}

"if-else"        {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.IF-ELSE, yytext());}

"if-if"          {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.IF-IF, yytext());}

"else-else"      {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.ELSE-ELSE, yytext());}

"switch"         {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.SWITCH, yytext());}

"case"           {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.CASE, yytext());}

"default"        {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DEFAULT, yytext());}

"{"              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.LLAVE_ABRE, yytext());}

"}"              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.LLAVE_CIERRA, yytext());}

";"              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.PUNTOYCOMA, yytext());}

":"              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DOS_PUNTOS, yytext());}

"."              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.PUNTO, yytext());}

/* 4. Estructuras repetitivas */
"for"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.FOR, yytext());}

"while"           {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.WHILE, yytext());}

"do"              {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.DO, yytext());}

"System"          {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.SYSTEM, yytext());}
             
"out"             {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.OUT, yytext());}

"println"         {System.out.println("Se reconoce lexema: " +yytext());  return symbol(sym.PRINTLN, yytext());}








