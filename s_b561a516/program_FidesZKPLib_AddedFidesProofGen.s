	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"program_FidesZKPLib.cpp"
	.text
	.section	.text._ZSt23__is_constant_evaluatedv,"axG",%progbits,_ZSt23__is_constant_evaluatedv,comdat
	.align	1
	.weak	_ZSt23__is_constant_evaluatedv
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt23__is_constant_evaluatedv, %function
_ZSt23__is_constant_evaluatedv:
	.fnstart
.LFB1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
.global zkp_start
zkp_start: nop
	@ sp needed
	ldr	r7, [sp], #4
.global zkp_end
zkp_end: nop
	bx	lr
	.cantunwind
	.fnend
	.size	_ZSt23__is_constant_evaluatedv, .-_ZSt23__is_constant_evaluatedv
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",%progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.align	1
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt11char_traitsIcE6lengthEPKc, %function
_ZNSt11char_traitsIcE6lengthEPKc:
	.fnstart
.LFB1551:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	bl	_ZSt23__is_constant_evaluatedv(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L4
	ldr	r0, [r7, #4]
	bl	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc(PLT)
	mov	r3, r0
	b	.L5
.L4:
	ldr	r0, [r7, #4]
	bl	strlen(PLT)
	mov	r3, r0
	nop
.L5:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
	.syntax unified
	.globl _ZSt21ios_base_library_initv
	.thumb
	.syntax unified
	.section	.rodata
	.align	2
	.type	_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kAlphaE, %object
	.size	_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kAlphaE, 4
_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kAlphaE:
	.word	-60
	.align	2
	.type	_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kGammaE, %object
	.size	_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kGammaE, 4
_ZN8nlohmann16json_abi_v3_11_36detail9dtoa_implL6kGammaE:
	.word	-32
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	.fnstart
.LFB8728:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	.syntax unified
@ 17 "program_FidesZKPLib.cpp" 1
	mov x18, #25
mov x17, #159
mul x17, x17, x18
add x17, x17, #28

@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #0
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	main, .-main
	.section	.text._ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,"axG",%progbits,_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,comdat
	.align	1
	.weak	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, %function
_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc:
	.fnstart
.LFB8731:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L13
.LPIC0:
	add	r2, pc
	ldr	r3, .L13+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3, #0
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L9
.L10:
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L9:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #16]
	add	r3, r3, r2
	movs	r2, #0
	strb	r2, [r7, #15]
	add	r2, r7, #15
	mov	r1, r2
	mov	r0, r3
	bl	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_(PLT)
	mov	r3, r0
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L10
	ldr	r3, [r7, #16]
	ldr	r1, .L13+8
.LPIC1:
	add	r1, pc
	ldr	r2, .L13+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L12
	bl	__stack_chk_fail(PLT)
.L12:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, .-_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",%progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align	1
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
	.fnstart
.LFB8838:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.thumb_set _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.rodata
	.align	2
.LC0:
	.ascii	"basic_string: construction from null is not valid\000"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",%progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align	1
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
	.fnstart
.LFB9068:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	.save {r4, r5, r7, lr}
	.pad #24
	sub	sp, sp, #24
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r4, [r7, #12]
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv(PLT)
	mov	r3, r0
	ldr	r2, [r7, #4]
	mov	r1, r3
	mov	r0, r4
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_(PLT)
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L19
	ldr	r3, .L24
.LPIC2:
	add	r3, pc
	mov	r0, r3
.LEHB0:
	bl	_ZSt19__throw_logic_errorPKc(PLT)
.L19:
	ldr	r0, [r7, #8]
	bl	_ZNSt11char_traitsIcE6lengthEPKc(PLT)
	mov	r2, r0
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #20]
	mov	r3, r5
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag(PLT)
.LEHE0:
	ldr	r3, [r7, #12]
	b	.L23
.L22:
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev(PLT)
.LEHB1:
	bl	__cxa_end_cleanup(PLT)
.LEHE1:
.L23:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L25:
	.align	2
.L24:
	.word	.LC0-(.LPIC2+4)
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA9068:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9068-.LLSDACSB9068
.LLSDACSB9068:
	.uleb128 .LEHB0-.LFB9068
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L22-.LFB9068
	.uleb128 0
	.uleb128 .LEHB1-.LFB9068
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE9068:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",%progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.fnend
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.thumb_set _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,"axG",%progbits,_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,comdat
	.align	1
	.weak	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, %function
_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_:
	.fnstart
.LFB9215:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, .-_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.section	.text._ZNSt15__new_allocatorIcED2Ev,"axG",%progbits,_ZNSt15__new_allocatorIcED5Ev,comdat
	.align	1
	.weak	_ZNSt15__new_allocatorIcED2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt15__new_allocatorIcED2Ev, %function
_ZNSt15__new_allocatorIcED2Ev:
	.fnstart
.LFB9223:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt15__new_allocatorIcED2Ev, .-_ZNSt15__new_allocatorIcED2Ev
	.weak	_ZNSt15__new_allocatorIcED1Ev
	.thumb_set _ZNSt15__new_allocatorIcED1Ev,_ZNSt15__new_allocatorIcED2Ev
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_,"axG",%progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC5EPS4_,comdat
	.align	1
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_:
	.fnstart
.LFB9253:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	.thumb_set _ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",%progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.align	1
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev:
	.fnstart
.LFB9256:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv(PLT)
.L33:
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA9256:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9256-.LLSDACSB9256
.LLSDACSB9256:
.LLSDACSE9256:
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",%progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.fnend
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	.thumb_set _ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",%progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align	1
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
	.fnstart
.LFB9251:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #48
	sub	sp, sp, #48
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strb	r3, [r7]
	ldr	r2, .L42
.LPIC3:
	add	r2, pc
	ldr	r3, .L42+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #44]
	mov	r3, #0
	ldr	r3, [r7, #8]
	str	r3, [r7, #24]
	ldr	r3, [r7, #4]
	str	r3, [r7, #28]
	ldr	r3, [r7, #24]
	nop
	str	r3, [r7, #32]
	ldr	r3, [r7, #28]
	str	r3, [r7, #36]
	ldr	r2, [r7, #36]
	ldr	r3, [r7, #32]
	subs	r3, r2, r3
	nop
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #15
	bls	.L39
	add	r3, r7, #20
	movs	r2, #0
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc(PLT)
	ldr	r3, [r7, #20]
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEj(PLT)
	b	.L40
.L39:
	ldr	r3, [r7, #12]
	str	r3, [r7, #40]
	nop
.L40:
	add	r3, r7, #24
	ldr	r1, [r7, #12]
	mov	r0, r3
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_(PLT)
	ldr	r0, [r7, #12]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv(PLT)
	mov	r3, r0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_(PLT)
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #20]
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEj(PLT)
	add	r3, r7, #24
	mov	r0, r3
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev(PLT)
	ldr	r2, .L42+8
.LPIC4:
	add	r2, pc
	ldr	r3, .L42+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #44]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L41
	bl	__stack_chk_fail(PLT)
.L41:
	adds	r7, r7, #48
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L43:
	.align	2
.L42:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+4)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+4)
	.fnend
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.section	.rodata
	.align	2
.LC1:
	.ascii	"~1\000"
	.align	2
.LC2:
	.ascii	"/\000"
	.align	2
.LC3:
	.ascii	"~0\000"
	.align	2
.LC4:
	.ascii	"~\000"
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN8nlohmann16json_abi_v3_11_36detailL8unescapeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_, %function
_ZN8nlohmann16json_abi_v3_11_36detailL8unescapeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_:
	.fnstart
.LFB9789:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #88
	sub	sp, sp, #88
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L77
.LPIC9:
	add	r2, pc
	ldr	r3, .L77+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #84]
	mov	r3, #0
	add	r3, r7, #12
	str	r3, [r7, #20]
	add	r2, r7, #12
	add	r3, r7, #36
	ldr	r1, .L77+8
.LPIC5:
	add	r1, pc
	mov	r0, r3
.LEHB2:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_(PLT)
.LEHE2:
	add	r3, r7, #16
	str	r3, [r7, #24]
	add	r2, r7, #16
	add	r3, r7, #60
	ldr	r1, .L77+12
.LPIC6:
	add	r1, pc
	mov	r0, r3
.LEHB3:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_(PLT)
.LEHE3:
	add	r2, r7, #60
	add	r3, r7, #36
	mov	r1, r3
	ldr	r0, [r7, #4]
.LEHB4:
	bl	_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_(PLT)
.LEHE4:
	add	r3, r7, #60
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	add	r3, r7, #16
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	add	r3, r7, #36
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	add	r3, r7, #12
	str	r3, [r7, #28]
	add	r2, r7, #12
	add	r3, r7, #36
	ldr	r1, .L77+16
.LPIC7:
	add	r1, pc
	mov	r0, r3
.LEHB5:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_(PLT)
.LEHE5:
	add	r3, r7, #16
	str	r3, [r7, #32]
	add	r2, r7, #16
	add	r3, r7, #60
	ldr	r1, .L77+20
.LPIC8:
	add	r1, pc
	mov	r0, r3
.LEHB6:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_(PLT)
.LEHE6:
	add	r2, r7, #60
	add	r3, r7, #36
	mov	r1, r3
	ldr	r0, [r7, #4]
.LEHB7:
	bl	_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_(PLT)
.LEHE7:
	add	r3, r7, #60
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	add	r3, r7, #16
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	add	r3, r7, #36
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	nop
	ldr	r2, .L77+24
.LPIC10:
	add	r2, pc
	ldr	r3, .L77+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #84]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L69
	b	.L76
.L72:
	add	r3, r7, #60
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	b	.L58
.L71:
.L58:
	add	r3, r7, #16
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	add	r3, r7, #36
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	b	.L60
.L70:
.L60:
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	ldr	r2, .L77+28
.LPIC11:
	add	r2, pc
	ldr	r3, .L77+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #84]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L62
	bl	__stack_chk_fail(PLT)
.L62:
.LEHB8:
	bl	__cxa_end_cleanup(PLT)
.L75:
	add	r3, r7, #60
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	b	.L64
.L74:
.L64:
	add	r3, r7, #16
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	add	r3, r7, #36
	mov	r0, r3
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(PLT)
	b	.L66
.L73:
.L66:
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSt15__new_allocatorIcED2Ev(PLT)
	ldr	r2, .L77+32
.LPIC12:
	add	r2, pc
	ldr	r3, .L77+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #84]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L68
	bl	__stack_chk_fail(PLT)
.L68:
	bl	__cxa_end_cleanup(PLT)
.LEHE8:
.L76:
	bl	__stack_chk_fail(PLT)
.L69:
	adds	r7, r7, #88
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC9+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC1-(.LPIC5+4)
	.word	.LC2-(.LPIC6+4)
	.word	.LC3-(.LPIC7+4)
	.word	.LC4-(.LPIC8+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC11+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC12+4)
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA9789:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9789-.LLSDACSB9789
.LLSDACSB9789:
	.uleb128 .LEHB2-.LFB9789
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L70-.LFB9789
	.uleb128 0
	.uleb128 .LEHB3-.LFB9789
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L71-.LFB9789
	.uleb128 0
	.uleb128 .LEHB4-.LFB9789
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L72-.LFB9789
	.uleb128 0
	.uleb128 .LEHB5-.LFB9789
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L73-.LFB9789
	.uleb128 0
	.uleb128 .LEHB6-.LFB9789
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L74-.LFB9789
	.uleb128 0
	.uleb128 .LEHB7-.LFB9789
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L75-.LFB9789
	.uleb128 0
	.uleb128 .LEHB8-.LFB9789
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
.LLSDACSE9789:
	.text
	.fnend
	.size	_ZN8nlohmann16json_abi_v3_11_36detailL8unescapeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_, .-_ZN8nlohmann16json_abi_v3_11_36detailL8unescapeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_
	.section	.rodata
	.align	2
.LC5:
	.ascii	"void nlohmann::json_abi_v3_11_3::detail::replace_su"
	.ascii	"bstring(StringType&, const StringType&, const Strin"
	.ascii	"gType&) [with StringType = std::__cxx11::basic_stri"
	.ascii	"ng<char>]\000"
	.align	2
.LC6:
	.ascii	"lib/json.hpp\000"
	.align	2
.LC7:
	.ascii	"!f.empty()\000"
	.section	.text._ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_,"axG",%progbits,_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_,comdat
	.align	1
	.weak	_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_, %function
_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_:
	.fnstart
.LFB10067:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #24
	sub	sp, sp, #24
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r0, [r7, #8]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(PLT)
	mov	r3, r0
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L80
	ldr	r3, .L83
.LPIC13:
	add	r3, pc
	movw	r2, #2974
	ldr	r1, .L83+4
.LPIC14:
	add	r1, pc
	ldr	r0, .L83+8
.LPIC15:
	add	r0, pc
	bl	__assert_fail(PLT)
.L80:
	movs	r2, #0
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findERKS4_j(PLT)
	str	r0, [r7, #20]
	b	.L81
.L82:
	ldr	r0, [r7, #8]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv(PLT)
	mov	r2, r0
	ldr	r3, [r7, #4]
	ldr	r1, [r7, #20]
	ldr	r0, [r7, #12]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7replaceEjjRKS4_(PLT)
	ldr	r0, [r7, #4]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv(PLT)
	mov	r2, r0
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	mov	r2, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findERKS4_j(PLT)
	str	r0, [r7, #20]
.L81:
	ldr	r3, [r7, #20]
	cmp	r3, #-1
	bne	.L82
	nop
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L84:
	.align	2
.L83:
	.word	.LC5-(.LPIC13+4)
	.word	.LC6-(.LPIC14+4)
	.word	.LC7-(.LPIC15+4)
	.fnend
	.size	_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_, .-_ZN8nlohmann16json_abi_v3_11_36detail17replace_substringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvRT_RKS9_SC_
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILx1ELx1000000000EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILx1ELx1000000000EEE, 1
_ZSt12__is_ratio_vISt5ratioILx1ELx1000000000EEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILx1ELx1EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILx1ELx1EEE, 1
_ZSt12__is_ratio_vISt5ratioILx1ELx1EEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILx1000000000ELx1EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILx1000000000ELx1EEE, 1
_ZSt12__is_ratio_vISt5ratioILx1000000000ELx1EEE:
	.byte	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",%progbits
