/*
Escriba un programa que solicite la medida del lado de un cuadrado y calcule su área.
El área de un cuadrado se calcula multiplicando la longitud de un lado por sí misma. que seria el cuadrado de la longitud del lado.
El resultado se debe mostrar en pantalla.
nombre: ejercicio3.s
arm v7
 */

 .data
 format: .asciz "%d"        // Formato para leer un entero
 prompt: .asciz "Ingrese la medida del lado del cuadrado: "
 result: .asciz "El area del cuadrado es: %d\n" // Formato para imprimir el resultado
 lado: .word 0 // Variable para almacenar el lado del cuadrado
 .text
    .global main
main:
    // solicitar la medida del lado del cuadrado
    ldr r0, =prompt // Cargar la dirección del mensaje
    bl printf // Llamar a printf para mostrar el mensaje
    // leer el lado del cuadrado
    ldr r0, =format // Cargar el formato
    ldr r1, =lado // Cargar la dirección de la variable lado
    bl scanf // Llamar a scanf para leer el valor

    // calcular el area del cuadrado
    ldr r1, =lado // Cargar la dirección de la variable lado
    ldr r1, [r1] // Cargar el valor del lado
    lsl r1, r1, #2 // Multiplicar el lado por sí mismo (lado * lado)
    // almacenar el resultado en r2
    mov r2, r1 // Almacenar el resultado en r2
    // imprimir el resultado
    ldr r0, =result // Cargar la dirección del mensaje de resultado
    mov r1, r2 // Cargar el resultado
    bl printf // Llamar a printf para mostrar el resultado
    // salir del programa
    mov r7, #1 // syscall: exit
    svc 0 // Llamar al sistema operativo para salir

    
