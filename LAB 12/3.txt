;3. Create IsCompare procedure to compare two strings.


INCLUDE Irvine32.inc

.data
string1 BYTE 'abcde',0
string2 BYTE 'abcdeee',0

promptG BYTE "String1 > String2",0
promptE BYTE "String1 = String2",0
promptL BYTE "String1 < String2",0


.code

main PROC
    mov esi , OFFSET string1
    mov edi , OFFSET string2

    push esi
    push edi

    call Compare_String

    exit
main ENDP


Compare_String PROC
    push ebp
    mov ebp,esp

    mov esi , [ebp+12]
    mov edi , [ebp+8]

    repe cmpsb 
    JA greater
    JB less
    JZ equal


    greater:
    mov edx,OFFSET promptG
    call WriteString
    jmp quit


    equal:
    mov edx,OFFSET promptE
    call WriteString
    jmp quit


    less:
    mov edx,OFFSET promptL
    call WriteString
    jmp quit


    quit:
    exit
Compare_String ENDP

END main