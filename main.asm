;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Cum Mar 11 2016
; Processor: 8086
; Compiler:  MASM32
;
; Before starting simulation set Internal Memory Size 
; in the 8086 model properties to 0x10000
;====================================================================
STAK    SEGMENT PARA STACK 'STACK'
        DW 20 DUP(?)
STAK    ENDS

DATA    SEGMENT PARA 'DATA'
DATA    ENDS

CODE    SEGMENT PARA 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STAK
START:
        MOV AX, DATA
	MOV DS, AX
	
	MOV AL, 00110101B ; 00 -> counter 0 ; 11 -> LSB then MSB ; 010 -> MODE 2 ; 1 -> BCD 
	OUT 09EH, AL ; 09EH CONTROL WORD
 	
	MOV AL, 01110111B ; 01 -> counter 1 ; 11 -> LSB then MSB ; 011 -> MODE 3 ; 1 -> BCD
	OUT 09EH, AL ; 09EH CONTROL WORD
	
	
	; 25 sn�de 400 tane kare dalga u�retmek i�in 
	; input frekans = 10=MHz ,output ferkans = 16Hz
	; 10MHz/ 16Hz = 625000 = 625 * 1000
	; We send 625 to counter 0
	MOV AL, 25H ; LSB = 25
	OUT 98H, AL  ; counter 0
	MOV AL, 6H ; MSB 06
	OUT 98H, AL ; counter 0
	
	XOR AL,AL ; LSB = 00
	OUT 9AH, AL ; counter 1
	MOV AL, 10H ; MSB = 10
	OUT 9AH, AL ; counter 1

	

ENDLESS:

	
	
        JMP ENDLESS
CODE    ENDS
        END START