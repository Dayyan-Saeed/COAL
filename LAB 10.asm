.model small

.stack 65h

.data

num1 dw 8h
num2 dw 2h

sum dw 0000h

.code

main proc

mov ax,@data
mov ds,ax
mov ax,0000
mov es,ax

mov word ptr es:[65h*4],offset isr0
mov word ptr es:[65h*4+2],cs

mov si,offset num1
mov di,offset num2
mov bx,offset sum

mov ah,1
int 65h

.exit

main endp

isr0 proc

cmp ah,1

jne jump

mov ax,[si]
mov dx,[di]

add ax,dx
mov [bx],ax

hlt

jump:

cmp ah,2

jne jump2

mov ax,[si]
mul [di]

mov [bx],ax

hlt

jump2:

cmp ah,3

jne jump3

mov ax,[si]
div [di]

jump3:

hlt

isr0 endp    
    