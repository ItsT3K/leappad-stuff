;**********************************
;*	LeapPad Reset Vector		      *
;**********************************
;* This Reset Vector is a cleaned *
;* up version of the ghidra output*
;**********************************
;* By ItsT3K *
;*************

;*****************************
;* unk0-3 start with @dptr=> **
;* program start with @a+dptr *
;************************
;*	R E F E R E N C E	*****
;* unk0 = dat_extmem_fc06	*
;* unk1	= dat_extmem_fc07	*
;* unk2	= dat_extmem_fc08	*
;* unk3 = dat_extmem_fc09	**********
;* program = lab_code_801e (@a+dptr) *
;*************************************

jump:
	ljmp	vector
vector:
	mov	dptr,#0xfc06			;Move 0xfc06 to DPTR
	movx	a,unk0			  	;Move external RAM fc06 to Accumulator
	mov	r0,a				      ;Move Accumulator to Register 0
	inc	dptr				      ;Increment Data Pointer

	movx	a,unk1	
	mov	r1,a				      ;Move Accumulator to Register 1
	mov	dptr,#0xfc08			
	mov	a,r0				      ;Move Register 0 to Accumulator

	movx	unk2,a
	inc	dptr				      ;Increment Data Pointer
	mov	a,r1				

	movx	unk3,a				
	mov	dptr,#0x1e			
	mov	a,dph				
	add	a,#0x80				
	mov	dph,a				
	clr	a				          ;Clear the Acc.
	jmp	program				    ;Jump to 801e
