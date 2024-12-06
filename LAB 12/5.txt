;5. Create a procedure that Loads an array of integer by multiplying it with
;Load(offset array, byte no)

INCLUDE Irvine32.inc

.data
arr1 DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
multiplierr DWORD 2

prompt1 BYTE "Array multipied",0


.code

main PROC
    cld
    mov esi , OFFSET arr1
    mov edi , esi 
    mov ecx , LENGTHOF arr1

    L1:
    lodsd
    mul multiplierr
    stosd

    loop L1

    lea esi, arr1
    mov ecx, LENGTHOF arr1

    L2:
    mov eax, [esi]
    call Writedec
    add esi, TYPE arr1
    loop L2

    
    call Crlf
    call Crlf
    

    lea edx , prompt1
    call WriteString
    call Crlf

    exit
main ENDP
END main