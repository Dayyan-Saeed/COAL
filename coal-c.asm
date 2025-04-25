.model small
.stack 64
.data 
mes db 5,15 dup(0ffh)
.code
main proc far
    mov ax,@data
    mov ds,ax
     
    mov ah,02h
    mov dl,'k'
    int 21h
              
    mov ah,02h
    mov bh,00h
    mov dl,27h
    mov dh,0ch
    int 10h 
           
    mov ah,0ah
    mov dx, offset mes
    int 21h 
    
    
    mov al,-128
    mov bl,+127
    add al,bl
    into
   
    
    mov ah,01h
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
