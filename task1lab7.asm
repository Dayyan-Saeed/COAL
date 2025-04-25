.Model Small  

.stack 100h

.data
  
A db 1,2,3,4,5
B db 7,5,6,8,3
C db 9 dup(0)

.code

Main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,5
    Push ax
    Call SUM
    pop bx 

.exit    

Main endp 

SUM proc   
  
  push bp 
  push cx 
  push si 
  mov bp,sp 
  mov cx,[bp+8] 
  mov ax,[bp+18h] 
  mov bp,ax 
  mov ax,0 
  mov si,0   
         
         
l1: 
mov al,[A+si]
Add al,[B+si]  
mov al,[C+si]
inc si 
loop l1
pop si 
pop cx 
pop bp 
ret 

SUM endp