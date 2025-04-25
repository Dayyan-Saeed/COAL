  ;For each bit position i in the multiplier (going from right to left):
   ;If the bit at position i in the multiplier is 1,
      ;then add the multiplicand to the product.
   ;Left shift the product by 1
    ;After all bits in the multiplier have been processed, the product will contain the correct value 
    
    ;Program starts from here
.model small

.stack 100

.data
     multiplicand db  ?      ;we can assign any value to arrays
     multiplier  db   ?      ;since we don't have values yet, added "?" on that place
     product db    ?
.code    
mov ax,@data
mov ds,ax      ;initiliazed ds


mov cx, 8
mov si, 0
mov di, 0

mul1:

    mov al, [multiplicand + si]
    add product[di], al
    add di, 1
    mov al, [multiplicand + si + 1]
    add product[di], al
    add di, 1
    shl product, 1
    inc si
    loop mul1



mov cx, 8
mov si, 0
mov di, 0

mul2: 

    mov al, [multiplier + si]
    and al, 1
    jz skip 
    mov dl, product[di]
    add dl, [multiplicand + si]
    add di, 1
    mov al, [multiplicand + si + 1]
    add product[di], al
    add di, 1
    
skip:

    shl product, 1
    inc si
    loop mul2
    
.exit