%include "io.inc"

section .data
A DD 255h
B DD 255h

%macro MULTIPLY 2
    xor eax, eax
    mov ebx, [%2]
    CALM_AND_COLLECTED_MULTIPLICATION:
    add eax, [%1]
    sub ebx, 1
    jnz CALM_AND_COLLECTED_MULTIPLICATION
    PRINT_HEX 4, eax
%endmacro

section .text
global CMAIN
CMAIN:
    MULTIPLY A, B
    xor eax, eax
    ret