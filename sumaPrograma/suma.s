/*
programa que suma dos números enteros
archivo llamado suma.s
*/

.data
.text
.global main
main:
     mov  r0,#10
     mov  r1,#5
     add r0,r1,r0
    mov  r7,#1  
   swi 0
