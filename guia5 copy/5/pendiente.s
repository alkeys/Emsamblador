/*
calcula la pendiente de una recta pasando por dos puntos
x1,y1,x2,y2
nombre del archivo: pendiente.s
 arm v7
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
 format: .asciz "%d"        // Formato para leer un entero
    x1: .word 0
    y1: .word 0
    x2: .word 0
    y2: .word 0
    m: .word 0
    a: .word 0
    b: .word 0
    prompt: .asciz "La pendiente es: %d\n"
    prompt1: .asciz "Introduce el valor de x1: "
    prompt2: .asciz "Introduce el valor de y1: "
    prompt3: .asciz "Introduce el valor de x2: "
    prompt4: .asciz "Introduce el valor de y2: "
 .text
    .global main
main:
    // Guardar el estado de los registros esto es importante porque si no se guarda el estado de los registros
    // el programa no funcionará correctamente
    // En este caso se guardan los registros r4, r5, r6, r7 y lr
    // Se guardan los registros que se van a usar en el programa estos registros son r4, r5, r6, r7 y lr serviran para 
    // guardar los valores de las variables x1, y1, x2, y2
    push {r4, r5, r6, r7, lr} // Guardar registros que se usarán 
    // Guardar el valor de x1
    input x1, prompt1, format // Llamar a la macro input para leer el valor de x1
    // Guardar el valor de y1
    input y1, prompt2, format // Llamar a la macro input para leer el valor de y1
    // Guardar el valor de x2
    input x2, prompt3, format // Llamar a la macro input para leer el valor de x2
    // Guardar el valor de y2
    input y2, prompt4, format // Llamar a la macro input para leer el valor de y2
    // Calcular la pendiente
    // m = (y2 - y1) / (x2 - x1)
    ldr r4, =x1           // Cargar la dirección de x1
    ldr r4, [r4]         // Cargar el valor de x1 en r5
    
    ldr r5, =y1          // Cargar la dirección de y1
    ldr r5, [r5]         // Cargar el valor de y1 en r6

    ldr r6, =x2        // Cargar la dirección de x2
    ldr r6, [r6]        // Cargar el valor de x2 en r7

    ldr r7, =y2        // Cargar la dirección de y2
    ldr r7, [r7]        // Cargar el valor de y2 en r8


    sub r5, r7, r5      // r5 = y2 - y1
    sub r6, r6, r4      // r6 = x2 - x1
    ldr r4, =a          // Cargar la dirección de a
    str r5, [r4]        // Almacenar el resultado de y2 - y1 en a
    ldr r5, =b          // Cargar la dirección de b
    str r6, [r5]        // Almacenar el resultado de x2 - x1 en b
    
    divicion a,b, m // Llamar a la macro divicion para calcular la pendiente


    // Mostrar el resultado
    salida m, prompt, 0 // Llamar a la macro salida para mostrar el resultado
error:
    pop {r4, r5, r6, r7}
    mov r7, #1
    svc 0

  