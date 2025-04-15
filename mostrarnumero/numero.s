/*
nonbre del archivo: numero.s
autor: alkeys
muestra un numero en pantalla consola en ensamblador
 */

 .data                 // r1       r2      r3       r4
 str : .asciz "la suma es =: %d\n"
 var1: .word 1000
 var2: .word 2000
 var3: .word 1000
 .text
    .global main
main:
stmfd sp!, {lr}
ldr r0, =var1
ldr r0, [r0]

ldr r1, =var2
ldr r1, [r1]

ldr r2, =var3
ldr r2, [r2]

add r0, r0, r1  
add r0, r0, r2
mov r1 , r0


ldr r0, =str

bl printf // imprime primero el r0 y luego el r1 

ldmfd sp!, {lr}
mov r0, #0
mov pc, lr


