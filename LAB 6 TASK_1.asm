.model small

.data

Array DB 01H,02H,01H,02H,03H,05H,07H,08H,20H,10H,11H,12H,16H,14H,15H,16H,17H,18H,19H,20H ; Taking 20 Elements in Array 

.code

MOV BX,@DATA

MOV DS,BX

MOV SI,0 ; Initializing SI with 0 and DI with 1 Because at First Iteration we want to Compare First and Second index
MOV DI,1

MOV CX,190 ; We Want Loop to Execute 190 times because there are 20 element.Therefore, 1 element will be compare with remaining 19 elements. So 20 x 19 = 390/2 = 190   
           ; We will divide 380 by 2 because we dont want to compare the same number that has been compare before
L1:

MOV AL,Array[SI] ;Moving First Element into AL
MOV DL,Array[DI] ;Moving Second Element into DL

CMP AL,DL ; Comparing AL AND DL , If AL and DL are equal then the zero flag will set to 1 

JE CHECK1 ; If Zero Flag is set to 1 than it will jump

INC DI ;Otherwise we will increment DI ( THE SECOND COMPARING ELEMENT )

CHECK1: JNE CHECK2 ; IF AL and DL Are Equal it will not Jump and its Means the program has finds a Number that is Same as Second Comparing Element , Then it will Add 1 into AL  

ADD AH,1 ; Adding 1 into AL to Calculate the number of occurrences
      
INC DI ; and then incrementing DI ( THE SECOND COMPARING ELEMENT )
                
CHECK2: CMP DI,0014H ; When DI ( INDEX ) will reach at the location DS:0014H Than it will Increment SI( THE FIRST COMPARING ELEMENT )

JNE CHECK3

INC SI
MOV DI,SI ; MOVING SI INTO DI Beacause if SI = 1 , THAN It will Add 1 into DI and the below statment will increment one more time so it will point the next memory location of SI
INC DI
        
CHECK3:     
        
Loop L1


.exit