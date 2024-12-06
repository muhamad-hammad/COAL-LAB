INCLUDE Irvine32.inc

.data
string1 BYTE "String Reversed", 0

Str_Reverse PROTO, inputStr:DWORD

.code

main PROC
    lea edx, string1
    call WriteString
    call Crlf

    invoke Str_Reverse, ADDR string1

    call Crlf
    lea edx, string1
    call WriteString
    call Crlf

    exit
main ENDP

Str_Reverse PROC, inputStr:DWORD
    push esi
    push edi

    mov esi, inputStr
    mov edi, inputStr
    mov ecx, 0

L1:
    cmp BYTE PTR [edi], 0
    je Reverse
    inc edi
    inc ecx
    jmp L1

Reverse:
    dec edi
    shr ecx, 1

RevLoop:
    cmp esi, edi
    jge Done
    mov al, [esi]
    xchg al, [edi]
    mov [esi], al
    inc esi
    dec edi
    loop RevLoop

Done:
    pop edi
    pop esi
    ret
Str_Reverse ENDP

END main
