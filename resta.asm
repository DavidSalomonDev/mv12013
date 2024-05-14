section .data
    num1 db '8'
    num2 db '3'
    num3 db '2'
    msg  db  "La resta de (8 - 3 - 2) es "
    len equ $ - msg
    saltoLinea db 10

section .bss
    resultado resb 1
    
section .text
global _start

_start:
    ; Primer número
    mov     ax, [num1]           ; Usamos AX para registros de 16 bits
    sub     ax, '0'              ; Convertir de ASCII a entero
    ; Segundo número
    mov     bx, [num2]           ; Usamos BX para registros de 16 bits
    sub     bx, '0'              ; Convertir de ASCII a entero
    sub     ax, bx               ; Restar num2 de num1
    ; Tercer número
    mov     cx, [num3]           ; Usamos CX para registros de 16 bits
    sub     cx, '0'              ; Convertir de ASCII a entero
    sub     ax, cx               ; Restar num3 de la resta anterior
    add     ax, '0'              ; Convertir el resultado a ASCII

    ; Almacenar el resultado de la resta
    mov     [resultado], ax

    ; Imprimir el resultado
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Imprimir un salto de línea
    mov     ecx, saltoLinea
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Imprimir el resultado de la resta
    mov     ecx, resultado
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Salir del programa
    mov     eax, 1
    int     0x80
