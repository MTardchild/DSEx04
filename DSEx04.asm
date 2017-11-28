%include "io.inc"

section .data
A DD 0ABCDEFh
B DD 0FFFFFFFFh
RES DQ 0

%macro PRINT_Q 1    
    PRINT_HEX 4, [%1]
    PRINT_HEX 4, [%1+4]
%endmacro

%macro MULTIPLY 3
    xor eax, eax
    xor ecx, ecx
    mov ebx, [%2]
    CALM_AND_COLLECTED_MULTIPLICATION:
    adc eax, [%1]
    jnc NO_ONE_CARRIES_YOU_TODAY_SCRUB
    add ecx, 1
    NO_ONE_CARRIES_YOU_TODAY_SCRUB:
    dec ebx
    jnz CALM_AND_COLLECTED_MULTIPLICATION  
    mov [%3], ecx
    mov [%3+4], eax
    PRINT_Q RES
%endmacro

section .text
global CMAIN
CMAIN:
    mov ebp, esp ;for correct debugging
    MULTIPLY A, B, RES
    ret