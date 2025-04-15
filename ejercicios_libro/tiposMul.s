/*
este ejercicio trata de hacer una multiplicacion de dos
 numeros de 8 bits
numeros de 16 bits
numeros de 32 bits
 nombres de los archivos
tiposMul.s
 */

.data
 /*numero de 8bits */ //se ocupar el registro r2 para el resultado
 var1: .byte 0x4 
 var2: .byte 0x2
/*numeros de 16bit */ //se ocupar el registro r3 para el resultado
var3: .hword 10
var4: .hword 20
/*numeros de 32 bits */ //se ocupar el registro r4 para el resultado
var5: .word 15
var6: .word 20
/*resultado de la multiplicacion */ 
res1: .byte 0
res2: .hword 0
res3: .word 0
 
 .text
    .global main
main:
    /*multiplicacion de 8bit */
    ldr r0,=var1 //cargamos la direccion de var1
    ldr r0,[r0]  //carga el valor de var1
    ldr r1,=var2 //cargamos la direccion de var2
    ldr r1,[r1]  //carga el valor de var2
    mul r2,r0,r1 //multiplicamos los valores de r0 y r1 y guardamos el resultado en r2

    /*multiplicacion de 16bit */
    ldr r0,=var3 //cargamos la direccion de var3
    ldr r0,[r0]  //carga el valor de var3
    ldr r1,=var4 //cargamos la direccion de var4
    ldr r1,[r1]  //carga el valor de var4
    mul r3,r0,r1 //multiplicamos los valores de r0 y r1 y guardamos el resultado en r3

    /*multiplicacion de 32bit */
    ldr r0,=var5 //cargamos la direccion de var5
    ldr r0,[r0]  //carga el valor de var5
    ldr r1,=var6 //cargamos la direccion de var6
    ldr r1,[r1]  //carga el valor de var6
    mul r4,r0,r1 //multiplicamos los valores de r0 y r1 y guardamos el resultado en r4




    mov r0,r3
    mov r7, #1
    swi 0



  