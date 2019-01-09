TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
Array DW 2181, 57, 1122;
Cislo DW 1122;
Answer DB 2 dup(0);
.code
vysledok PROC USES ECX EAX
mov ecx, lengthofArray;
Cyklus:
	cmp ax,Array[2*ecx - 2];
	je Hodnota;
	mov Answer,'n';
	loop Cyklus;
	jmp Koniec;
Hodnota:
	mov Answer,'a';
Koniec:
	ret;


vysledok ENDP


main PROC
mov ax, Cislo;
call vysledok;
mov edx, offset Answer;
call WriteString;
	exit
main ENDP

END main