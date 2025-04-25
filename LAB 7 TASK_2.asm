.model small

.data

Array DB "M","A","A","M"

.code

Main proc
    
MOV AX,@data

MOV DS,AX

MOV AX,2

PUSH AX

Call palindrome

POP BX

.exit

Main endp

palindrome proc
    
PUSH BP

MOV BP,SP
MOV CX,[BP+4]

MOV SI,0
MOV DI,3

L1:

MOV AL,Array[SI]
MOV BL,Array[DI]

CMP AL,BL

JNE CHECK

MOV DL,1

CHECK: JE CHECK1

MOV DL,0

CHECK1:

INC SI
DEC DI

Loop L1  

POP BP

RET

palindrome endp