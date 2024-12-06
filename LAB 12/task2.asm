;1. Create a procedure named Scan_String to find the index of the first occurrence of the character
;‘#’ in the given string.
;string1 BYTE ‘127&j~3#^&*#*#45^’,0

;2. Modify the above procedure to take offset of string1 and the character to be searched
;as argument.

INCLUDE Irvine32.inc

.data
string1 BYTE '127&j~3#^&*#*#45^',0

prompt1 BYTE "# found at index: ",0
prompt2 BYTE "# Not found",0



.code

main PROC
    mov edi , OFFSET string1
    mov al,'#'
    movzx eax,al

    push eax
    push edi



    call Scan_String

    exit
main ENDP


Scan_String PROC
    push ebp
    mov ebp,esp
    mov edi , [ebp+8]
    mov al , [ebp+12]
    mov ecx , LENGTHOF string1
    cld
    repne scasb

    jnz notfound
    mov eax,edi
    sub eax,OFFSET string1
    mov edx,OFFSET prompt1


    call WriteString
    call WriteDec
    call Crlf


    jmp quit

    notfound:
    mov edx,OFFSET prompt2
    call WriteString
    call Crlf

    quit:
    exit
Scan_String ENDP

END main