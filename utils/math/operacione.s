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
    ldr r0, =\a // Cargar la dirección del primer operando
    ldr r0, [r0]  // Cargar el primer operando
    ldr r1, =\b     // Cargar la dirección del segundo operando
    ldr r1, [r1] // Cargar el segundo operando
    add r0, r0, r1 // Sumar los dos operandos
    ldr r2, =\c // Cargar la dirección de la variable c
    str r0, [r2] // Guardar el resultado en la variable c
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


//fin de programa
   mov r7, #1
   swi 0
