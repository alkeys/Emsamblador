/*
suma de 3 numero en ensamblador
nombre del archivo: suma.s
para compilar: gcc -o suma suma.s
para ejecutar: ./suma
ver resultado: echo $?

 */

 .data
    var1: .word 5
    var2: .word 10
    var3: .word 15
 .text
 .globl main
 main:
    ldr r1, =var1 //cargamos la direccion de var1 en r1
    ldr r1, [r1] //cargamos el valor de var1 en r1
    ldr r2, =var2 //cargamos la direccion de var2 en r2
    ldr r2, [r2] //cargamos el valor de var2 en r2
    ldr r3, =var3 //cargamos la direccion de var3 en r3
    ldr r3, [r3] //cargamos el valor de var3 en r3
    add r0, r1, r2 //sumamos r1 y r2 y guardamos el resultado en r0
    add r0, r0, r3 //sumamos r0 y r3 y guardamos el resultado en r0
    
    mov r7, #1 //salimos del programa
    swi 0 //llamamos al sistema
    