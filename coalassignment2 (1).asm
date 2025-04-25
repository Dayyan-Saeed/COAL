.model small  
org 100h

.data
num1 dw 0, 0, 0FFFFh, 0FFFFh
num2 dw 0FFFFh, 0FFFFh
result dw 0, 0, 0, 0
.code
 
   mov cx, 32
startse:
   mov ax, [num2]
   rcr ax, 1
   mov [num2], ax
   mov ax, [num2+2]
   rcr ax, 1
   mov [num2+2], ax
   Jnc first
         mov dx, [num1+6]
         add [result+6], dx
         mov dx, [num1+4]
         adc [result+4], dx
         mov dx, [num1+2]
         adc [result+2], dx
         mov dx, [num1]
         adc [result], dx   
   first:
         mov dx, [num1+6]
         rcl dx, 1
         mov [num1+6], dx
         mov dx, [num1+4]
         rcl dx, 1
         mov [num1+4], dx
         mov dx, [num1+2]
         rcl dx, 1
         mov [num1+2], dx
         mov dx, [num1]
         rcl dx, 1
         mov [num1], dx
         loop startse
         .exit