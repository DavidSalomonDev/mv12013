section .data
    num1 db '8'
    num2 db '3'
    msg  db  "La multiplicacion de (8 * 3) es "
    len equ $ - msg
    saltoLinea db 10

section .bss
    resultado resb 2  ; Reservamos 2 bytes para almacenar el resultado en ASCII

section .text
global _start

_start:
    ; Primer número
    mov     al, [num1]           ; Usamos AL para registros de 8 bits
    sub     al, '0'              ; Convertir de ASCII a entero
    ; Segundo número
    mov     bl, [num2]           ; Usamos BL para registros de 8 bits
    sub     bl, '0'              ; Convertir de ASCII a entero
    mul     bl                   ; Multiplicar AL por BL

    ; Convertir el resultado a ASCII
    mov     ah, 0                ; Limpiamos AH
    mov     bh, 10               ; BH = 10 para dividir por 10 (obtener el dígito de las decenas)
    div     bh                   ; Dividir AX por 10
    add     ah, '0'              ; Convertir el dígito de las decenas a ASCII
    mov     [resultado + 1], ah  ; Almacenar el dígito de las decenas (en el segundo byte)
    add     al, '0'              ; Convertir el dígito de las unidades a ASCII
    mov     [resultado], al      ; Almacenar el dígito de las unidades (en el primer byte)

    ; Imprimir el mensaje
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

    ; Imprimir el resultado de la multiplicación
    mov     ecx, resultado
    mov     edx, 2              ; Imprimir solo dos caracteres
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Salir del programa
    mov     eax, 1
    int     0x80
