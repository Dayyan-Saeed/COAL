.model small
.data
 
A dw 1,2,3,4,5,6,3,12,0      
B dw 8,10,9,6,4,2,13,5,1      

C dw 9 dup(0)                   

.code 

Mov ax,@data                  
Mov ds,ax                      

Mov cx, 9                      

l1:                           

Mov ax, A + si                 

Mov dx, B + si                


Add ax,dx                       

Mov C + si, ax                

Add si,2                     

loop l1                       

.exit