/*
dise hola mundo en pantalla con la funcion printf en ensamblador
nombre del archivo: holaMundo.s
 */

 .data
 str:    .asciz "Hola mundo\n"
 .text
 .global main
main:
   //carga en la pila lr
   stmfd sp!, {lr}
    //carga en r0 la direccion de str
    ldr r0, =str
    bl printf //llama a la funcion printf
   ldmfd sp!, {lr}
   mov r0, #0
   mov pc, lr
   