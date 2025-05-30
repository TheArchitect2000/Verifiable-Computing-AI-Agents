	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w0, #0                          ; =0x0
	str	wzr, [sp, #12]
	; InlineAsm Start
	mov	x18, #25                        ; =0x19
	mov	x17, #159                       ; =0x9f
	mul	x17, x17, x18
	add	x17, x17, #28

	; InlineAsm End
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
