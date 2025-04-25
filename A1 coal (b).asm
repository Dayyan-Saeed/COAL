.model
.stack
.data
 a1 dw 8,5,9,7,2,11,3,4,8
 a2 dw 2,6,8,1,3,7,2,6,9
 a3 dw 9 dup(0)
 .code
 mov ax,@data
 mov ds,ax
 mov cx,9
 mov bx,0
 mov ax,0 
 mov dx,0 
 l1:
 mov ax,[a1+bx]
 mov dx,[a2+bx]
 cmp ax,dx
 ja  gr
 jb  less
 less:
 mov [a3+bx],dx
 add bx,2
 dec cx
 jz e
 jmp l1
 gr:
 mov [a3+bx],ax
 add bx,2
 dec cx
 jz e
 jmp l1

 e:
.exit