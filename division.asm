section .data
    num1 db '8'
    num2 db '2'
    msg  db  "La division de (8 / 2) es "
    len equ $ - msg
    saltoLinea db 10

section .bss
    resultado resb 1  ; Reservamos 1 byte para almacenar el resultado de la división en ASCII

section .text
global _start

_start:
    ; Cargamos el primer número en AL
    mov     al, [num1]

    ; Restamos '0' para convertir de ASCII a valor numérico
    sub     al, '0'

    ; Hacemos cero el registro AH
    xor     ah, ah

    ; Dividimos AL por el segundo número
    mov     cl, [num2]
    sub     cl, '0'      ; Convertir de ASCII a valor numérico
    div     cl

    ; Movemos el resultado de la división (que está en AL) a AH
    mov     ah, al

    ; Sumamos '0' para convertir el resultado de la división a ASCII
    add     ah, '0'

    ; Almacenamos el resultado de la división en la variable "resultado"
    mov     [resultado], ah

    ; Imprimimos el mensaje
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Imprimimos un salto de línea
    mov     ecx, saltoLinea
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Imprimimos el resultado de la división
    mov     ecx, resultado
    mov     edx, 1              ; Imprimir un solo byte
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Salimos del programa
    mov     eax, 1
    int     0x80
