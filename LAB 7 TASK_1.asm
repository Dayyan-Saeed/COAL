.model small

.data

ArrayA db 1H,2H,3H,4H,5H    ;Array 1
ArrayB db 6H,7H,8H,9H,10H   ;Array 2
ArrayC db 0H,0H,0H,0H,0H    ;Array 3 For Saving Sum

.code

Main proc

MOV AX,@data

MOV DS,AX

MOV AX,05H ;Moving Size of Array into AX

PUSH AX    ;Pushing Size of Array into Stack (parameters)

Call Sum   ;Calling Function Sum

POP BX ;Poping the size of array from stack

.exit ; Exiting From the Program

Main endp


Sum proc
    
PUSH BP ;Saving BP Value into Stack       

MOV BP,SP ;Using BP as handler 

MOV CX,[BP+4] ;Moving Size of Array into CX because we want to run Loop 5 Times 

L1:

MOV AL,ArrayA[SI] ;Moving Index no 1 into AL of Array 1
MOV BL,ArrayB[SI] ;Moving Index no 2 into BL of Array 2 

ADC AL,BL ;Adding Both Values

MOV ArrayC[SI],AL  ; Moving Sum of index 0 of Array1 and Array2 into Array3 

INC SI ;Incrementing SI by 1 because we have DB Size of Arrays

Loop L1 ;Loop Will excute 5 times

POP BP ;Poping the previous value of BP into BP 
 
RET ;Returning to the Calling Function

Sum endp