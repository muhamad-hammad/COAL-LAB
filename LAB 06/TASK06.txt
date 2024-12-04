include irvine32.inc

.data
    array DWORD 8, 5, 1, 2, 6
    arraySize DWORD 5

.code
main PROC
    mov ecx, arraySize
    dec ecx

outerLoop:
    mov edx, ecx
    mov esi, OFFSET array

innerLoop:
    mov eax, [esi]
    cmp eax, [esi+4]
    jle nextPair

    xchg eax, [esi+4]
    mov [esi], eax

nextPair:
    add esi, 4
    loop innerLoop

    mov ecx, edx
    loop outerLoop

    mov ecx, arraySize
    mov esi, OFFSET array
displayLoop:
    mov eax, [esi]
    call WriteInt
    mov al, ' '
    call WriteChar
    add esi, 4
    loop displayLoop

    call Crlf
    ret

EXIT
MAIN ENDP
END MAIN