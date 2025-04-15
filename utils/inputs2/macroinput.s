/*
ejercio de creacion de macro para entrada de datos y salida de datos pero con  r7
nombre macroinput.s
 */

// creacion de macro para entrada de datos
/*
 var1: variable para guardar el valor de entrada
    var2: variable para guardar el valor de salida
 */
.macro input  var1,mensaje
// imprimir mensaje
mov r7, #4 // syscall para imprimir
mov r0, #1 // stdout esto es para imprimir en la salida estandar
ldr r1, =\mensaje // variable para guardar el mensaje
mov r2, #20 // tamaño del mensaje o cantidad de bytes a imprimir
svc 0 // llamada al sistema para imprimir

// leer el valor de entrada
mov r7, #3 // syscall para leer
mov r0, #0 // stdin esto es para leer de la entrada estandar
ldr r1,=\var1 // variable para guardar el valor de entrada
mov r2, #100 // tamaño de la variable o cantidad de bytes a leer
svc 0 // llamada al sistema para leer

.endm


// creacion de macro para salida de datos
/*
        var1: variable para guardar el valor de salida
        var2: variable para guardar el mensaje de salida
        mensaje: mensaje a imprimir
        r7: syscall para imprimir
        r0: stdout esto es para imprimir en la salida estandar
        r1: variable para guardar el mensaje
        r2: tamaño del mensaje o cantidad de bytes a imprimir
        svc 0: llamada al sistema para imprimir

        como se usa la macro:
        output var1,msj2
        var1: variable para guardar el valor de salida
        msj2: mensaje a imprimir
        el mensaje debe estar definido en la seccion .data
 */
.macro output var1,mensaje
// imprimir mensaje
mov r7, #4 // syscall para imprimir
mov r0, #1 // stdout esto es para imprimir en la salida estandar
ldr r1, =\mensaje // variable para guardar el mensaje
mov r2, #20 // tamaño del mensaje o cantidad de bytes a imprimir
svc 0 // llamada al sistema para imprimir
// imprimir valor de salida
mov r7, #4 // syscall para imprimir
mov r0, #1 // stdout esto es para imprimir en la salida estandar
ldr r1, =\var1 // variable para guardar el valor de salida
mov r2, #20 // tamaño de la variable o cantidad de bytes a imprimir
svc 0 // llamada al sistema para imprimir
.endm


.data
msj1: .asciz "ingrese un numero: "
msj2: .asciz "el numero ingresado es: %d\n"
numero: .word 0 // variable para guardar el numero ingresado

msj3: .asciz "ingrese su nombre: "
msj4: .asciz "su nombre es:"
nombre: .space 100 // variable para guardar el nombre ingresado


.text
.global main
main:

input numero ,msj1// llamada a la macro para leer el numero

output numero,msj2// llamada a la macro para imprimir el numero


input nombre,msj3// llamada a la macro para leer el nombre
output nombre,msj4// llamada a la macro para imprimir el nombre



//fin de programa 
  mov r7, #1 // syscall para salir
  svc 0
