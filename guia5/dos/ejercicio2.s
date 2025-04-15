/*
Cree un programa que le solicite al usuario un número entero y calcular el doble (utilice
redireccionamiento con desplazamiento), la mitad (utilice redireccionamiento con rotación)
y el cubo del número. Mostrar al usuario el resultado de las tres operaciones
nombre del programa: ejercicio2.s
en arm v7
 */

 .data
format: .asciz "%d"        // Formato para leer un entero
prompt: .asciz "Ingrese un número entero:\n"
prompt2: .asciz "El doble es: %d\n"
prompt3: .asciz "La mitad es: %d\n"
prompt4: .asciz "El cubo es: %d\n"
numero: .word 0

 .text
 .global main
 main:

    ldr r0, =prompt       // Cargar la dirección del mensaje de prompt
    bl printf              // Llamar a printf para mostrar el mensaje
    ldr r1, =numero          // Cargar la dirección de la variable
    ldr r0, =format      // Cargar el formato para scanf
    bl scanf   



    // Calcular el doble
    ldr r0, =numero
    ldr r1, [r0]
    lsl r1, r1, #1 // Desplazamiento a la izquierda para multiplicar por 2
    ldr r0, =prompt2
    bl printf
    // Calcular la mitad
    ldr r0, =numero
    ldr r1, [r0]
    lsr r1, r1, #1 // Desplazamiento a la derecha para dividir por 2
    ldr r0, =prompt3
    bl printf

    // Calcular el cubo
    ldr r0, =numero
    ldr r1, [r0]
    mul r1, r1, r1 // Multiplicar el número por sí mismo
    ldr r2, [r0]   // Cargar el número original en otro registro
    mul r1, r1, r2 // Multiplicar el resultado por el número original
    ldr r0, =prompt4
    bl printf
    // Finalizar el programa
    mov r0, #0
    svc #0
