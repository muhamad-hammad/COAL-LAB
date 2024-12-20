INCLUDE Irvine32.inc
includelib user32.lib
BUFFER_SIZE=1000
.data
Buff BYTE BUFFER_SIZE dup(?)
fmt BYTE "%d", 0
FileMes1 BYTE "Final Bill", 0
FileMes2 BYTE "Order No.: ", 0
FileMes3 BYTE "Name: ", 0
FileMes4 BYTE "Total Bill: Rs ", 0
filename BYTE "ORDER ", 20 DUP(0)
fileHandle HANDLE ?
filesize DWORD ?
filetypeee BYTE ".txt", 0
Ord BYTE "Enter Order Number: ", 0
Order BYTE 50 DUP(?)
NameStr BYTE "Enter Name: ", 0
NameS BYTE 50 DUP(?)
RestName BYTE "Welcome to RT FASTFOOD!!", 0
MenuStr BYTE "Menu", 0
Combo1 BYTE "Combo 1", 0
Combo1pak BYTE "Combo 1 with Pakola Drink", 0
Combo1NXT BYTE "Combo 1 with COLA NEXT Drink", 0
Combo1Apple BYTE "Combo 1 with BIG APPLE Drink", 0
Combo1Menu BYTE "Press 1 for Combo 1", 0
DoubleDecker1 BYTE "1 Double Decker", 0
Drink1 BYTE "250 ML Drink", 0
MedFries BYTE "1 Medium Fries", 0
PriceStr1 BYTE "Price: 800 Rupees", 0
Price1 DWORD 0
Quant1 DWORD 0
Breakfast BYTE "Breakfast Combo", 0
BreakfastMenu BYTE "Press 2 for Breakfast Combo", 0
Egg BYTE "1 Egg Sandwich", 0
Pancake BYTE "1 Pancake", 0
Coffee BYTE "1 Coffee", 0
PriceStr2 BYTE "Price: 1000 Rupees", 0
Price2 DWORD 0
Quant2 DWORD 0
Meal1 BYTE "Press 3 for Happy Meal with 4x Nuggets, 250 ML Drink and Medium Fries", 0
Meal1Str BYTE "Nugget Happy Meal", 0
Meal1Str1 BYTE "Nugget Happy Meal with Pakola Drink", 0
Meal1Str2 BYTE "Nugget Happy Meal with COLA NEXT Drink", 0
Meal1Str3 BYTE "Nugget Happy Meal with BIG APPLE Drink", 0
PriceStr3 BYTE "Price: 500 Rupees", 0
Price3 DWORD 0
Quant3 DWORD 0
Meal2 BYTE "Press 4 for Happy Meal with a Double Decker, 250 ML Drink and Medium Fries", 0
Meal2Str BYTE "Double Decker Happy Meal", 0
Meal2Str1 BYTE "Double Decker Happy Meal with Pakola Drink", 0
Meal2Str2 BYTE "Double Decker Happy Meal with COLA NEXT Drink", 0
Meal2Str3 BYTE "Double Decker Happy Meal with BIG APPLE Drink", 0
PriceStr4 BYTE "Price: 600 Rupees", 0
Price4 DWORD 0
Quant4 DWORD 0
Combo2 BYTE "Combo 2", 0
Combo2pak BYTE "Combo 2 with Pakola Drink", 0
Combo2NXT BYTE "Combo 2 with COLA NEXT Drink", 0
Combo2Apple BYTE "Combo 2 with BIG APPLE Drink", 0
Combo2Menu BYTE "Press 5 for Combo 2", 0
Nuggies BYTE "8 Piece Nuggets", 0
Drinks2 BYTE "2 Medium Drinks", 0
Fries2 BYTE "2 Medium Fries", 0
PriceStr5 BYTE "Price: 1300 Rupees", 0
Price5 DWORD 0
Quant5 DWORD 0
Nuggies4 BYTE "Press 8 for 4 Piece Nuggets", 0
Nuggies4Check BYTE "4 Piece Nuggets", 0
PriceStr6 BYTE "Price: 300 Rupees", 0
Price6 DWORD 0
Quant6 DWORD 0
DrinksMenu BYTE "Press 6 for 1 Medium Drink", 0
pak BYTE "Pakola Drink", 0
ColaNxt BYTE "COLA NEXT Drink", 0
BIGAPPLE BYTE "BIG APPLE Drink", 0
PriceStr7 BYTE "Price: 120 Rupees", 0
Price7 DWORD 0
Quant7 DWORD 0
FriesMenu BYTE "Press 7 for 1 Medium Fries", 0
FriesCheck BYTE "Medium Fries", 0
PriceStr8 BYTE "Price: 100 Rupees", 0
Price8 DWORD 0
Quant8 DWORD 0
ExitChoice BYTE "Press 9 to move to Checkout", 0
WrongIn BYTE "Wrong Input", 0
Choice DWORD 0
QuantChoice BYTE "How many would you like to order: ", 0
TotalBill DWORD 0
FuncChoice BYTE "Would you like to move to checkout?", 0
ChoiceTitle BYTE "Checkout Box", 0
DrinkChoice1 BYTE "Press 1 for Pakola Drink", 0
DrinkChoice2 BYTE "Press 2 for COLA NEXT Drink", 0
DrinkChoice3 BYTE "Press 3 for BIG APPLE Drink", 0
StackCount DWORD 0
BillStr BYTE "BILL", 0
TotStr BYTE "Total Price: ", 0
SpaceStr BYTE " ", 0
RupStr BYTE "Rupees", 0
billstr2 BYTE 20 DUP(0)

.code
main PROC
    mov eax, blue + (white * 16)
    call ClrScr
    call SetTextColor
    call ClrScr
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov edx, OFFSET Ord
    call WriteString
    mov edx, OFFSET Order
    mov ecx, LENGTHOF Order
    call ReadString
    mov edx, OFFSET NameStr
    call WriteString
    mov edx, OFFSET NameS
    mov ecx, LENGTHOF NameS
    call ReadString
BadInput:
    mov eax, Choice
    cmp eax, 9
    JE ByeByeBlock
    call ClrScr
    mov edx, OFFSET RestName
    call WriteString
    call Crlf
    mov edx, OFFSET MenuStr
    call WriteString
    call Crlf
    mov edx, OFFSET Combo1Menu
    call WriteString
    call Crlf
    mov edx, OFFSET BreakfastMenu
    call WriteString
    call Crlf
    mov edx, OFFSET Meal1
    call WriteString
    call Crlf
    mov edx, OFFSET Meal2
    call WriteString
    call Crlf
    mov edx, OFFSET Combo2Menu
    call WriteString
    call Crlf
    mov edx, OFFSET DrinksMenu
    call WriteString
    call Crlf
    mov edx, OFFSET FriesMenu
    call WriteString
    call Crlf
    mov edx, OFFSET Nuggies4
    call WriteString
    call Crlf
    mov edx, OFFSET ExitChoice
    call WriteString
    call Crlf
    call ReadDec
    mov Choice, eax
    cmp eax, 1
    JE Combo1Block
    cmp eax, 2
    JE BreakfastBlock
    cmp eax, 3
    JE NuggMealBlock
    cmp eax, 4
    JE DoubleDeckerBlock
    cmp eax, 5
    JE Combo2Block
    cmp eax, 6
    JE DrinksBlock
    cmp eax, 7
    JE FriesBlock
    cmp eax, 8
    JE Nuggie4Block
    cmp eax, 9
    JE ByeByeBlock
    push eax
    mov eax, 1000
    mov edx, OFFSET WrongIn
    call WriteString
    call delay
    pop eax
    call Crlf
    JMP BadInput
Combo1Block:
    call Combo1Func
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
BreakfastBlock:
    call BreakfastFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
NuggMealBlock:
    call NuggMealFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
DoubleDeckerBlock:
    call BigMacMealFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
Combo2Block:
    call Combo2Func
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
DrinksBlock:
    call DrinksFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
FriesBlock:
    call FriesFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
Nuggie4Block:
    call NuggieFunc
    push eax
    push edx
    push ecx
    inc StackCount
    JMP BadInput
ByeByeBlock:
    mov eax, StackCount
    cmp eax, 0
    JE ByeBye2
    call CheckoutFunc
    JMP EXITT
EXITT:
    mov ecx, StackCount
    mov eax, 3
    mul ecx
    mov ecx, eax
L1:
    pop eax
    loop L1
ByeBye2:
    exit
main ENDP

Combo1Func PROC
    call ClrScr
    mov edx, OFFSET Combo1
    call WriteString
    call Crlf
    mov edx, OFFSET DoubleDecker1
    call WriteString
    call Crlf
    mov edx, OFFSET Drink1
    call WriteString
    call Crlf
    mov edx, OFFSET MedFries
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice2
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice3
    call WriteString
    call Crlf
DrinkIn:
    mov eax, 0
    call ReadDec
    cmp eax, 1
    JE pakr
    cmp eax, 2
    JE ColaNx
    cmp eax, 3
    JE BigApp
    mov edx, OFFSET WrongIn
    call WriteString
    call Crlf
    JMP DrinkIn
pakr:
    mov edx, OFFSET Combo1pak
    push edx
    JMP GetOut
ColaNx:
    mov edx, OFFSET Combo1NXT
    push edx
    JMP GetOut
BigApp:
    mov edx, OFFSET Combo1Apple
    push edx
    JMP GetOut
GetOut:
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant1, eax
    mov ebx, 800
    mul ebx
    mov Price1, eax
    push eax
    add TotalBill, eax
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop eax
    pop edx
    mov ecx, Quant1
    ret
Combo1Func ENDP

BreakfastFunc PROC
    call ClrScr
    mov edx, OFFSET Breakfast
    call WriteString
    call Crlf
    mov edx, OFFSET Egg
    call WriteString
    call Crlf
    mov edx, OFFSET Pancake
    call WriteString
    call Crlf
    mov edx, OFFSET Coffee
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr2
    call WriteString
    call Crlf
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant2, eax
    mov ebx, 1000
    mul ebx
    push eax
    mov Price2, eax
    add TotalBill, eax
    mov edx, OFFSET Breakfast
    push edx
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop edx
    pop eax
    mov ecx, Quant2
    ret
BreakfastFunc ENDP

NuggMealFunc PROC
    call ClrScr
    mov edx, OFFSET Meal1Str
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr3
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice2
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice3
    call WriteString
    call Crlf
DrinkIn:
    call ReadDec
    cmp eax, 1
    JE pakr
    cmp eax, 2
    JE ColaNx
    cmp eax, 3
    JE BigApp
    mov edx, OFFSET WrongIn
    call WriteString
    call Crlf
    JMP DrinkIn
pakr:
    mov edx, OFFSET Meal1Str1
    push edx
    JMP GetOut
ColaNx:
    mov edx, OFFSET Meal1Str2
    push edx
    JMP GetOut
BigApp:
    mov edx, OFFSET Meal1Str3
    push edx
    JMP GetOut
GetOut:
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant3, eax
    mov ebx, 500
    mul ebx
    push eax
    mov Price3, eax
    add TotalBill, eax
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop eax
    pop edx
    mov ecx, Quant3
    ret
NuggMealFunc ENDP

BigMacMealFunc PROC
    call ClrScr
    mov edx, OFFSET Meal2Str
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr4
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice2
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice3
    call WriteString
    call Crlf
DrinkIn:
    call ReadDec
    cmp eax, 1
    JE pakr
    cmp eax, 2
    JE ColaNx
    cmp eax, 3
    JE BigApp
    mov edx, OFFSET WrongIn
    call WriteString
    call Crlf
    JMP DrinkIn
pakr:
    mov edx, OFFSET Meal2Str1
    push edx
    JMP GetOut
ColaNx:
    mov edx, OFFSET Meal2Str2
    push edx
    JMP GetOut
BigApp:
    mov edx, OFFSET Meal2Str3
    push edx
    JMP GetOut
GetOut:
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant4, eax
    mov ebx, 600
    mul ebx
    push eax
    mov Price4, eax
    add TotalBill, eax
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop eax
    pop edx
    mov ecx, Quant4
    ret
BigMacMealFunc ENDP

Combo2Func PROC
    call ClrScr
    mov edx, OFFSET Combo2
    call WriteString
    call Crlf
    mov edx, OFFSET Nuggies
    call WriteString
    call Crlf
    mov edx, OFFSET Drinks2
    call WriteString
    call Crlf
    mov edx, OFFSET Fries2
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr5
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice2
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice3
    call WriteString
    call Crlf
DrinkIn:
    call ReadDec
    cmp eax, 1
    JE pakr
    cmp eax, 2
    JE ColaNx
    cmp eax, 3
    JE BigApp
    mov edx, OFFSET WrongIn
    call WriteString
    call Crlf
    JMP DrinkIn
pakr:
    mov edx, OFFSET Combo2pak
    push edx
    JMP GetOut
ColaNx:
    mov edx, OFFSET Combo2NXT
    push edx
    JMP GetOut
BigApp:
    mov edx, OFFSET Combo2Apple
    push edx
    JMP GetOut
GetOut:
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant5, eax
    mov ebx, 1300
    mul ebx
    push eax
    mov Price5, eax
    add TotalBill, eax
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop eax
    pop edx
    mov ecx, Quant5
    ret
Combo2Func ENDP

DrinksFunc PROC
    call ClrScr
    mov edx, OFFSET DrinksMenu
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr7
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice1
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice2
    call WriteString
    call Crlf
    mov edx, OFFSET DrinkChoice3
    call WriteString
    call Crlf
DrinkIn:
    call ReadDec
    cmp eax, 1
    JE pakr
    cmp eax, 2
    JE ColaNx
    cmp eax, 3
    JE BigApp
    mov edx, OFFSET WrongIn
    call WriteString
    call Crlf
    JMP DrinkIn
pakr:
    mov edx, OFFSET pak
    push edx
    JMP GetOut
ColaNx:
    mov edx, OFFSET ColaNxt
    push edx
    JMP GetOut
BigApp:
    mov edx, OFFSET BIGAPPLE
    push edx
    JMP GetOut
GetOut:
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant7, eax
    mov ebx, 120
    mul ebx
    push eax
    mov Price7, eax
    add TotalBill, eax
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop eax
    pop edx
    mov ecx, Quant7
    ret
DrinksFunc ENDP

FriesFunc PROC
    call ClrScr
    mov edx, OFFSET FriesCheck
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr8
    call WriteString
    call Crlf
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant8, eax
    mov ebx, 100
    mul ebx
    push eax
    mov Price8, eax
    add TotalBill, eax
    mov edx, OFFSET FriesCheck
    push edx
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop edx
    pop eax
    mov ecx, Quant8
    ret
FriesFunc ENDP

NuggieFunc PROC
    call ClrScr
    mov edx, OFFSET Nuggies4Check
    call WriteString
    call Crlf
    mov edx, OFFSET PriceStr6
    call WriteString
    call Crlf
    mov edx, OFFSET QuantChoice
    call WriteString
    call ReadDec
    mov Quant6, eax
    mov ebx, 300
    mul ebx
    push eax
    mov Price6, eax
    add TotalBill, eax
    mov edx, OFFSET Nuggies4Check
    push edx
    mov edx, OFFSET FuncChoice
    mov ebx, OFFSET ChoiceTitle
    mov eax, 0
    call MsgBoxAsk
    cmp eax, 6
    JNE NotCheckOut
    mov eax, 9
    mov Choice, eax
NotCheckOut:
    mov eax, 0
    mov edx, 0
    pop edx
    pop eax
    mov ecx, Quant6
    ret
NuggieFunc ENDP


CheckoutFunc PROC
    call ClrScr
    push ebp
    mov ebp, esp
    mov ebx, 8
    mov edx, OFFSET BillStr
    call WriteString
    call Crlf
    mov ecx, StackCount
L1:
    mov eax, 0
    mov eax, [ebp + ebx]
    call WriteDec
    add ebx, 4
    mov edx, OFFSET SpaceStr
    call WriteString
    mov edx, [ebp + ebx]
    call WriteString
    add ebx, 4
    mov edx, OFFSET SpaceStr
    call WriteString
    mov eax, [ebp + ebx]
    call WriteDec
    add ebx, 4
    mov edx, OFFSET SpaceStr
    call WriteString
    mov edx, OFFSET RupStr
    call WriteString
    call Crlf
    loop L1
    mov edx, OFFSET TotStr
    call WriteString
    mov eax, TotalBill
    call WriteDec
    mov edx, OFFSET SpaceStr
    call WriteString
    mov edx, OFFSET RupStr
    call WriteString
    call Crlf
    mov esp, ebp
    pop ebp
    ret
CheckoutFunc ENDP

END main