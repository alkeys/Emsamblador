/*
operacione.s
Operaciones matematicas basicas 

 */

/*
.suma
a es el primer operando
b es el segundo operando
c es el resultado
 */
.macro suma a, b, c
    ldr r0, =\a
    ldr r0, [r0]
    ldr r1, =\b
    ldr r1, [r1]
    add r0, r0, r1
    ldr r2, =\c
    str r0, [r2]
.endm

/*
.resta
a es el primer operando
b es el segundo operando
c es el resultado
 */
.macro resta a, b, c
    ldr r0, =\a
    ldr r0, [r0]
    ldr r1, =\b
    ldr r1, [r1]
    sub r0, r0, r1
    ldr r2, =\c
    str r0, [r2]
.endm


/*
multiplicacion
a es el primer operando
b es el segundo operando
c es el resultado
 */
.macro multiplicacion a, b, c
    ldr r0, =\a
    ldr r0, [r0]
    ldr r1, =\b
    ldr r1, [r1]
    mul r0, r0, r1
    ldr r2, =\c
    str r0, [r2]
.endm



// Macro para mostrar un mensaje de salida con el valor de una variable o resultado
/**
salida var, prompt
    var: variable que contiene el valor a mostrar
    prompt: mensaje que se mostrará al usuario
 */
.macro salida var, prompt
    ldr r0, =\prompt       // Cargar la dirección del mensaje de salida
    ldr r1, =\var          // Cargar la dirección de la variable
    ldr r1, [r1]           // Cargar el valor de la variable en r1
    bl printf              // Llamar a printf para mostrar el mensaje
.endm



/*
funcion de divicion por restas 
a es el dividendo
b es el divisor
c es el resultado
/*
Como funciona:
La macro `divicion` realiza una división entera utilizando restas sucesivas. 
Toma tres parámetros: `a` (dividendo), `b` (divisor) y `c` (resultado). 
Primero, verifica si el dividendo o el divisor son cero. Si alguno lo es, termina la operación. 
Luego, en un bucle, resta el divisor del dividendo y cuenta cuántas veces se puede realizar esta operación 
hasta que el dividendo sea menor que el divisor. Finalmente, almacena el contador (resultado de la división) en `c`.
*/
.macro divicion a, b, c
    ldr r0, =\a
    ldr r0, [r0]
    ldr r1, =\b
    ldr r1, [r1]
    mov r2, #0 // Inicializar el contador de restas
    cmp r0, #0 // Comprobar si el dividendo es cero
    beq fin_div // Si es cero, saltar a fin_div
    cmp r1, #0 // Comprobar si el divisor es cero
    beq fin_div // Si el divisor es cero, saltar a fin_div
bucle_div:
    cmp r0, r1 // Comparar el dividendo con el divisor
    blt fin_div // Si el dividendo es menor que el divisor, salir del bucle
    sub r0, r0, r1 // Restar el divisor del dividendo
    add r2, r2, #1 // Incrementar el contador de restas
    b bucle_div // Repetir el bucle
fin_div:
    ldr r3, =\c
    str r2, [r3] // Almacenar el resultado en la variable c
.endm





 .data
    smg: .asciz "El resultado es: %d\n" // Mensaje de salida
    var1: .word 10
    var2: .word 5
    var3: .word 0
 .text
.global main
main:
suma var1, var2, var3

salida var3,smg // Mostrar el resultado de la suma

resta var2, var1, var3
salida var3,smg // Mostrar el resultado de la resta


multiplicacion var1, var2, var3
salida var3,smg // Mostrar el resultado de la multiplicacion

divicion var1, var2, var3
salida var3,smg // Mostrar el resultado de la division


//fin de programa
   mov r7, #1
   swi 0
