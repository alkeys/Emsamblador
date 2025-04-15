/*Archivo: intro.s
Descripción: Definiciones básicas de variables y punteros
*/

.data // Sección para definir variables (puede ir al final del archivo)
    // Formato: nombre variable: tipo valor inicial
    var1: .word 3     // Definir variable de 32 bits (una palabra)
    var2: .byte 4     // Definir variable de 8 bits
    var3: .word 0

    .equ DOS, 2 // Definición de una constante

    // Valores iniciales en otras bases
    varhex: .word 0x123 // Valor inicial hexadecimal (0x)
    varbin: .word 0b1010 // valor inicial en binario (0b)
    var0ct: .word 076    // valor inicial en octal (0)

.text // sección de código principal
.globl main

main:
    // Punteros forma 1, acceder a la variable a través de un puntero declarado
    LDR R1, puntero_var1 // Cargar la dirección de memoria en R1, R1 = &var1
    LDR R1, [R1]         // Cargar en R1, el valor apuntado por R1, R1 = *R1

    // Punteros forma 2, acceder a una variable apuntando a su primer byte
    LDR R2, =var2       // R2 = &var2
    LDR R2, [R2]        // R2 = *R2

    LDR R3, puntero_var3 @ R3 = &var3
    ADD R0, R1, R2       @ R0 = R1 + R2
    STR R0, [R3]        @ Guardar el valor de R0 en la dirección apuntada por R3
                        @ *R3 = R0

    ADD R0, R0, #DOS     @ Al utilizar una constante el compilador la
                        @ sustituye por su valor

exit: // Finalizar programa, equivale a 'return 0;' en la función main de C++
    MOV R7, #1
    SWI 0

// Definición de punteros
puntero_var1: .word var1
puntero_var2: .word var2
puntero_var3: .word var3
