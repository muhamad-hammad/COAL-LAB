;1. Create a procedure named Scan_String to find the index of the first occurrence of the character
;‘#’ in the given string.
;Str1 BYTE ‘127&j~3#^&*#*#45^’,0

INCLUDE Irvine32.inc

.data
string1 BYTE '127&j~3#^&*#*#45^',0

prompt1 BYTE "# found at index: ",0
prompt2 BYTE "# Not found",0

len DWORD 0


.code

main PROC
    mov edi , OFFSET string1
    mov ecx , LENGTHOF string1
    mov len , ecx
    mov al,'#'
    call Scan_String

    exit
main ENDP


Scan_String PROC
    cld
    repne scasb

    jne notfound
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