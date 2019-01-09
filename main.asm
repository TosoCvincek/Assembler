TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
	Draci DB 3,6,12
	DB 5,8,14
	DB 10,9,15
	DB 6, 12, 18
	DB 7, 15, 20
	DB 4, 16, 21
	Pocet DB 0;
	DlzkaRiadku EQU sizeof Draci;
.code
UlohaC PROC USES EAX EBX ECX EDX EDI ESI;
	xor edi, edi;
	xor eax, eax;
	mov esi, 1;
	mov ecx, 6;
Cyklus:
	mov al, Draci[edi + esi];
	cmp al, 12;
	jbe Schopny;
	jmp Koniec;
Schopny:
	mov al, Draci[edi + esi + 1];
	cmp al, 14;
	jae Pripocitaj;
	jmp Koniec;
Pripocitaj:
	mov bl, Draci[edi + esi - 1];
	add Pocet, bl;
Koniec:
	add edi, DlzkaRiadku;
	loop Cyklus;
	ret;
UlohaC ENDP;
UlohaA PROC USES EAX EBX ECX EDX EDI ESI;
		xor edi, edi;
	xor eax, eax;
	mov esi, 1;
	mov ecx, 6;
Cyklus:
	mov al, Draci[edi + esi];
	cmp al, 16;
	jbe Schopny;
	jmp Koniec;
Schopny:
	mov al, Draci[edi + esi + 1];
	cmp al, 16;
	jae Pripocitaj;
	jmp Koniec;
Pripocitaj:
	inc Pocet;
Koniec:
	add edi, DlzkaRiadku;
	loop Cyklus;
	ret;
UlohaA ENDP;
main PROC
	INVOKE UlohaA;
	movzx eax, Pocet;
	call WriteInt;
	mov Pocet, 0;
	INVOKE UlohaC;
	movzx eax, Pocet;
	call WriteInt;
	exit
main ENDP

END main