.model small

.stack 100h

.data

X db 0F6h,0C1h,0B6h,0D4h  
Y db 0C4h,0DEh,0A8h,031h 

temp db 4 dup(0) 

result db 8 dup(0)             


.code

    main proc 
        
    mov ax,@data
    mov ds,ax
    
    mov cx,4 
    mov si,0
    
    l1:
      
    mov al,[Y+si]
    mov [temp+si],al
    inc si
    loop l1  
    
    call multiplier 
    
    main endp                   
  
   multiplier proc
        
        
    push cx
    push bx
    push dx
    push si
    push di
    push bp
    mov bp,sp     
    
   
    mov ch,4   
    
    mov ax,0
    
    mov si,0   
    mov di,0
 
    mov ax,0    
     
 Outer: 
      
    
    mov bl,[X+si] 
    
    mov dl,[Y+si]  
   
    mov cl,8  
     
    mov ax,0
 
 Inner:   
     
    shr [temp+si],1
    
    jnc no 
    
    
    add ax,bx   
    jmp no
    
    no:
    
    shl bl,1
    
    shr dl,1    
    
    dec cl 
    
    cmp cl,0
    
    jne Inner
     
    
    mov [result+di],ah      
    mov [result+di+1],al 
    

     inc di
     inc di
    
     inc si 
    
    dec ch
    jnz Outer
   
           
    pop bp
    pop di
    pop si
    pop dx
    pop bx
    pop cx
     
    
   multiplier endp