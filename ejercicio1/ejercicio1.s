/*
archivo: ejercicio1.s
para compilar: gcc -o ejercicio1 ejercicio1.s
para ejecutar: ./ejercicio1 
para mostrar echo $?
 */
 .data
 .text
.global  main
main:
mov r0, #78
mov r7, #1
swi 0