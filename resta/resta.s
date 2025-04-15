/*
resta de dos numeros en emsamblador
nombre del archivo: resta.s
 */

 .text
    .global main
main:
    mov r0, #5 // asignamos el valor 5 a r0
    mov r1, #5  // asignamos el valor 3 a r1
    sub r0, r0, r1 // r2 = r0 - r1
    mov r7, #1 // para salir del programa
    swi 0 // llamada al sistema