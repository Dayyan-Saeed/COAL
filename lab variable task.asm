.model small

.stack 100h

.data

v1 db 12h
v2 dw 3456h
v3 dd 67894h


.code  

mov ax,@data
mov ds,ax


mov bx,offset v1

mov ah,[bx] 
 
mov bx,offset v2

mov ax,[bx] 

mov bx,offset v3

mov ax,[bx]  


.exit