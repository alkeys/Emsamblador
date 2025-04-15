/*
inputmacro.s para input macro en ensamblador raspberry pi
 */

/*
input var, prompt, format
    var: variable donde se guardará el valor
    prompt: mensaje que se mostrará al usuario
    format: formato para scanf (ejemplo: "%d" para enteros)
 */
.macro input var, prompt, format
    ldr r0, =\prompt       // Cargar la dirección del mensaje de prompt
    bl printf              // Llamar a printf para mostrar el mensaje
    ldr r1, =\var          // Cargar la dirección de la variable
    ldr r0, =\format       // Cargar el formato para scanf
    bl scanf               // Llamar a scanf para leer el valor
.endm

// Macro para mostrar un mensaje de salida con el valor de una variable o resultado
/**
salida var, prompt
    var: variable que contiene el valor a mostrar
    prompt: mensaje que se mostrará al usuario
 */
.macro salida var, prompt, is_string
    ldr r0, =\prompt       // Cargar la dirección del mensaje de salida
    ldr r1, =\var          // Cargar la dirección de la variable
    .if \is_string == 1
        // Si es una cadena, pasar directamente la dirección
        bl printf          // Llamar a printf para mostrar el mensaje
    .else
        // Si es un entero, cargar el valor de la dirección
        ldr r1, [r1]       // Cargar el valor de la variable en r1
        bl printf          // Llamar a printf para mostrar el mensaje
    .endif
.endm



.data
format: .asciz "%d"        // Formato para leer un entero
prompt : .asciz "Introduce un valor: " // Mensaje de prompt
prompt2: .asciz "El valor es sdgsd: %d\n"   // Mensaje de salida

var1: .word 0              // Variable para almacenar el valor leído

.text
.global main
main:
    input var1, prompt, format  // Llamar a la macro para leer el valor
    salida var1, prompt2,2       // Llamar a la macro para mostrar el valor leído

    // Finaliza el programa 
    mov r7, #1               // syscall: exit
    swi 0                    // Hacer la llamada al sistema
