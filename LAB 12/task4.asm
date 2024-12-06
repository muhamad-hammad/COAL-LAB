;4. Create a Str_Reverse procedure to reverse strings.

INCLUDE Irvine32.inc

.data
string1 BYTE 'abcde',0
string2 BYTE SIZEOF string1 DUP(0) 

prompt1 BYTE "String Reversed",0


.code

main PROC
    mov esi , OFFSET string1
    mov edi , OFFSET string2
    mov ecx , LENGTHOF string1
    LOCAL len:DWORD
    mov len , ecx
    dec len
    add esi , len

    
    L1:
        movsb
        add edi , TYPE string1
        loop L1


    
    cld
    dec edi
    mov BYTE PTR [edi] , 0


    lea edx , string2
    call WriteString
    call Crlf


    lea edx , prompt1
    call WriteString
    call Crlf

    exit
main ENDP
END main