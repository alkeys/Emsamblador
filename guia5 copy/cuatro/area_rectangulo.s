/*
Escriba un programa que calcule el área de un rectángulo, debe solicitar al usuario los datos
necesarios para realizar el cálculo
El programa debe mostrar el resultado en pantalla.
El área de un rectángulo se calcula multiplicando la base por la altura.

nombre del archivo: area_rectangulo.s
 arm v7
 */

 .data
format: .asciz "%d"        // Formato para leer un entero
prompt_base: .asciz "Ingrese la base del rectángulo: " 
prompt_altura: .asciz "Ingrese la altura del rectángulo: "
prompt_resultado: .asciz "El área del rectángulo es: %d\n"

base: .word 0
altura: .word 0
area: .word 0
 .text
    .global main
main:
     // solicitar la base
    ldr r0, =prompt_base // r0 = dirección de prompt_base
    bl printf // imprimir el mensaje
    ldr r0, =format  // carga el formato
    ldr r1, =base
    // Leer la base del rectángulo
    bl scanf

    // Solicitar la altura del rectángulo
    ldr r0, =prompt_altura // r0 = dirección de prompt_altura
    bl printf // imprimir el mensaje
    ldr r0, =format // cargar el formato
    ldr r1, =altura // r1 = dirección de altura
    bl scanf // leer la altura

    // Cargar la base y la altura
    ldr r0, =base // r0 = base
    ldr r1, [r0] // r0 = base
    ldr r0, =altura // r0 = altura
    ldr r2, [r0] // r0 = base, r2 = altura

     // multiplicar base por altura
    mul r0, r1, r2 // r0 = base * altura

     // almacenar el resultado en area
    ldr r1, =area // r1 = dirección de area
    str r0, [r1] // almacenar el resultado en area

     // mostrar el resultado
    ldr r1, =area // r0 = dirección de area
    ldr r1, [r1] // r0 = area
    ldr r0, =prompt_resultado // r1 = dirección de prompt_resultado
    bl printf // imprimir el resultado

     // salir del programa
    mov r7, #1 // syscall number for exit
    svc 0 // hacer la llamada al sistema
