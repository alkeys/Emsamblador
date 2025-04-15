/*
programa que da el mayor de dos números
nombre de programa: mayorque.s
 */

 .data
    var : .word 2
    var2 : .word 3
.text
.global main
main:

    ldr r0, =var //carga la dirección de var en r0
    ldr r0, [r0] //carga el valor de var en r0
    ldr r1, =var2   //carga la dirección de var2 en r1
    ldr r1, [r1] //carga el valor de var2 en r1

    cmp r0, r1 //compara r0 con r1
    bge fin //si r0 es mayor o igual que r1 salta a fin
    mov r0, r1 //si no, r1 es el mayor
    b fin //salta a fin


    fin:
    mov r7, #1
    swi 0


.macro mayor var1, var2 
    ldr r0, =\var1
    ldr r0, [r0]
    ldr r1, =\var2
    ldr r1, [r1]
    


