/*
nombre del archivo: bucle.s
autor: alkeys
 */

     .data
     str: .asciz "%d\n"
    .text
    .global main
main:
stmfd sp!, {lr}
mov r4, #0 // contador
mov r5, #1000 // limite

bucle:
cmp r4, r5 // comparar contador con limite
beq fin // si contador = limite, salir
mov r1, r4 // cargar contador
ldr r0, =str // cargar dirección de la cadena
bl printf // llamar a printf
add r4, r4, #1 // incrementar contador
b bucle // volver a bucle



fin:
ldmfd sp!, {lr} 
mov r0, #0
mov pc, lr
