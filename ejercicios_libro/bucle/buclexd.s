.data
vi: .word 0
vf: .word 12
.text
.global main
main:
    ldr r1, =vi       // Cargar la dirección de vi
    ldr r1, [r1]      // Cargar el valor inicial de vi en r1
    ldr r2, =vf       // Cargar la dirección de vf
    ldr r2, [r2]      // Cargar el valor final de vf en r2
    mov r0, #0        // Inicializar r0 en 0 para acumular la suma

bucle:
    cmp r1, r2        // Comparar r1 con r2
    bge fin           // Si r1 >= r2, salir del bucle
    add r0, r0, r1    // Sumar r1 a r0
    add r1, r1, #1    // Incrementar r1
    b bucle           // Repetir el bucle

fin:
    mov r7, #1        // Finalizar el programa
    swi 0
