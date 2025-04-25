.model small

.stack 100H

.data
     
Array1 DB 10H,11H,12H,13H,14H,15H,16H,17H,18H,19H

SUM DB 00H
          
.code

MOV BX,@data

MOV DS,BX

MOV SI,0

MOV CX,10

L1:

MOV DL,Array1[SI]

ADC AL,DL

INC SI

LOOP L1

MOV SUM,AL

JNC NEXT

ADD SUM,01H

NEXT: HLT


.exit