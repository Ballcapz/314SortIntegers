%include "/usr/local/share/csc314/asm_io.inc"


segment .data
	arr		dd	2, 3, 5, 12, 78, 34, 2, 33, 8, 10

segment .bss
	sortedArr	resd	10
segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; for loop to read in data
	mov 	ecx, 0
	top_for_loop_get:
	cmp 	ecx, 10
	jge		end_for_loop_get
		call	read_int					; gets each integer
		mov		DWORD [arr + ecx*4], eax	; stores ints in the arr
		call	read_char					; clears \n
	inc 	ecx
	jmp 	top_for_loop_get
	end_for_loop_get:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; Sort the array

	mov 	ecx, 0		; first iterator = i
	mov 	edi, 0		; edi = tmp
	
	; Outer for loop to iterate over ecx (i)
	top_out_sort:
	cmp 	ecx, 10
	jge		end_out_sort

		mov 	esi, 0		; second iterator	= j
		top_inner_sort:
		cmp		esi, 10
		jge		end_inner_sort		
			mov		eax, DWORD [arr + esi*4]		; arr[j] = eax = pos in arr (j)
			inc		esi								; esi++ ( j = j + 1)
			mov		ebx, DWORD [arr + esi*4]		; ebx = arr[j + 1]
			cmp		ebx, eax
			jge		end_if_sort
					mov 	edi, eax				; temp = a[j]
					dec		esi						; esi--
					mov		DWORD [arr + esi*4], ebx	; arr[j] = arr[j+1]
					inc		esi						; esi++			
					mov		DWORD [arr + esi*4], edi	; arr[j+1] = tmp
			end_if_sort:			
		jmp		top_inner_sort
		end_inner_sort:


	inc 	ecx
	jmp top_out_sort
	end_out_sort:		; end of outer for loop to sort array



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call 	print_nl
	call	print_nl

	; for loop to print array
	mov 	ecx, 0
	top_print_loop:
	cmp 	ecx, 10
	jge 	end_print_loop
		mov		eax, DWORD [arr + ecx*4]
		call	print_int
		call	print_nl
	inc 	ecx
	jmp		top_print_loop
	end_print_loop:	


	

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret











