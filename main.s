	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #128
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w8, #3
	dup.2d	v0, x8
	str	q0, [sp, #48]
	mov	w0, #72
	bl	__Znwm
	mov	x19, x0
	add	x20, x0, #72
	str	x0, [sp, #64]
	str	x20, [sp, #80]
Lloh0:
	adrp	x1, l_.memset_pattern@PAGE
Lloh1:
	add	x1, x1, l_.memset_pattern@PAGEOFF
	mov	w2, #72
	bl	_memset_pattern16
	str	x20, [sp, #72]
	str	xzr, [x19, #40]
Ltmp0:
	add	x0, sp, #48
	bl	__ZNK6MatrixIdE12print_matrixEv
Ltmp1:
; %bb.1:
Ltmp2:
Lloh2:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh3:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh4:
	adrp	x1, l_.str@PAGE
Lloh5:
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #17
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp3:
; %bb.2:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x0, x0, x8
Ltmp4:
	add	x8, sp, #8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp5:
; %bb.3:
Ltmp6:
Lloh6:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh7:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #8
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp7:
; %bb.4:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp8:
	mov	w1, #10
	blr	x8
Ltmp9:
; %bb.5:
	mov	x20, x0
	add	x0, sp, #8
	bl	__ZNSt3__16localeD1Ev
Ltmp11:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp12:
; %bb.6:
Ltmp13:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp14:
; %bb.7:
Ltmp16:
	add	x8, sp, #8
	add	x0, sp, #48
	bl	__ZN6MatrixIdE9transposeEv
Ltmp17:
; %bb.8:
Ltmp19:
	add	x0, sp, #8
	bl	__ZNK6MatrixIdE12print_matrixEv
Ltmp20:
; %bb.9:
	ldr	x0, [sp, #24]
	cbz	x0, LBB0_11
; %bb.10:
	str	x0, [sp, #32]
	bl	__ZdlPv
LBB0_11:
	ldr	x0, [sp, #64]
	cbz	x0, LBB0_13
; %bb.12:
	str	x0, [sp, #72]
	bl	__ZdlPv
LBB0_13:
	mov	w0, #0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB0_14:
Ltmp21:
	mov	x19, x0
	ldr	x0, [sp, #24]
	cbnz	x0, LBB0_17
; %bb.15:
	ldr	x0, [sp, #64]
	cbnz	x0, LBB0_22
LBB0_16:
	mov	x0, x19
	bl	__Unwind_Resume
LBB0_17:
	str	x0, [sp, #32]
	bl	__ZdlPv
	ldr	x0, [sp, #64]
	cbz	x0, LBB0_16
	b	LBB0_22
LBB0_18:
Ltmp18:
	b	LBB0_21
LBB0_19:
Ltmp10:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__16localeD1Ev
	ldr	x0, [sp, #64]
	cbz	x0, LBB0_16
	b	LBB0_22
LBB0_20:
Ltmp15:
LBB0_21:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB0_16
LBB0_22:
	str	x0, [sp, #72]
	bl	__ZdlPv
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh6, Lloh7
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp5-Ltmp0                    ;   Call between Ltmp0 and Ltmp5
	.uleb128 Ltmp15-Lfunc_begin0            ;     jumps to Ltmp15
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp9-Ltmp6                    ;   Call between Ltmp6 and Ltmp9
	.uleb128 Ltmp10-Lfunc_begin0            ;     jumps to Ltmp10
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 4 <<
	.uleb128 Ltmp14-Ltmp11                  ;   Call between Ltmp11 and Ltmp14
	.uleb128 Ltmp15-Lfunc_begin0            ;     jumps to Ltmp15
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin0            ; >> Call Site 5 <<
	.uleb128 Ltmp17-Ltmp16                  ;   Call between Ltmp16 and Ltmp17
	.uleb128 Ltmp18-Lfunc_begin0            ;     jumps to Ltmp18
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp20-Ltmp19                  ;   Call between Ltmp19 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Lfunc_end0-Ltmp20              ;   Call between Ltmp20 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNK6MatrixIdE12print_matrixEv ; -- Begin function _ZNK6MatrixIdE12print_matrixEv
	.weak_def_can_be_hidden	__ZNK6MatrixIdE12print_matrixEv
	.p2align	2
__ZNK6MatrixIdE12print_matrixEv:        ; @_ZNK6MatrixIdE12print_matrixEv
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	ldr	x8, [x0]
	cbz	x8, LBB1_10
; %bb.1:
	mov	x19, x0
	mov	x24, #0
Lloh8:
	adrp	x20, __ZNSt3__14coutE@GOTPAGE
Lloh9:
	ldr	x20, [x20, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh10:
	adrp	x21, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh11:
	ldr	x21, [x21, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
Lloh12:
	adrp	x22, l_.str.3@PAGE
Lloh13:
	add	x22, x22, l_.str.3@PAGEOFF
LBB1_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_5 Depth 2
	ldr	x9, [x19, #8]
	cbz	x9, LBB1_7
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	cmp	x8, x24
	b.ls	LBB1_11
; %bb.4:                                ;   in Loop: Header=BB1_2 Depth=1
	mov	w23, #1
LBB1_5:                                 ;   Parent Loop BB1_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	madd	x8, x24, x9, x23
	ldr	x9, [x19, #16]
	add	x8, x9, x8, lsl #3
	ldur	d0, [x8, #-8]
	mov	x0, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
	mov	x1, x22
	mov	w2, #2
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	ldr	x9, [x19, #8]
	cmp	x9, x23
	b.ls	LBB1_7
; %bb.6:                                ;   in Loop: Header=BB1_5 Depth=2
	ldr	x8, [x19]
	add	x23, x23, #1
	cmp	x8, x24
	b.hi	LBB1_5
	b	LBB1_11
LBB1_7:                                 ;   in Loop: Header=BB1_2 Depth=1
	ldr	x8, [x20]
	ldur	x8, [x8, #-24]
	add	x0, x20, x8
	add	x8, sp, #8
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp25:
	add	x0, sp, #8
	mov	x1, x21
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp26:
; %bb.8:                                ;   in Loop: Header=BB1_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp27:
	mov	w1, #10
	blr	x8
Ltmp28:
; %bb.9:                                ;   in Loop: Header=BB1_2 Depth=1
	mov	x23, x0
	add	x0, sp, #8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x20
	mov	x1, x23
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	x0, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	add	x24, x24, #1
	ldr	x8, [x19]
	cmp	x8, x24
	b.hi	LBB1_2
LBB1_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB1_11:
	mov	w0, #16
	bl	___cxa_allocate_exception
	mov	x20, x0
Ltmp22:
	bl	__ZNSt12out_of_rangeC1EPKc
Ltmp23:
; %bb.12:
Lloh14:
	adrp	x1, __ZTISt12out_of_range@GOTPAGE
Lloh15:
	ldr	x1, [x1, __ZTISt12out_of_range@GOTPAGEOFF]
Lloh16:
	adrp	x2, __ZNSt12out_of_rangeD1Ev@GOTPAGE
Lloh17:
	ldr	x2, [x2, __ZNSt12out_of_rangeD1Ev@GOTPAGEOFF]
	mov	x0, x20
	bl	___cxa_throw
LBB1_13:
Ltmp29:
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__16localeD1Ev
	mov	x0, x19
	bl	__Unwind_Resume
LBB1_14:
Ltmp24:
	mov	x19, x0
	mov	x0, x20
	bl	___cxa_free_exception
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh14, Lloh15
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp25-Lfunc_begin1            ;   Call between Lfunc_begin1 and Ltmp25
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp28-Ltmp25                  ;   Call between Ltmp25 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin1            ;     jumps to Ltmp29
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp28-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp22-Ltmp28                  ;   Call between Ltmp28 and Ltmp22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin1            ; >> Call Site 4 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin1            ;     jumps to Ltmp24
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp23-Lfunc_begin1            ; >> Call Site 5 <<
	.uleb128 Lfunc_end1-Ltmp23              ;   Call between Ltmp23 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6MatrixIdE9transposeEv      ; -- Begin function _ZN6MatrixIdE9transposeEv
	.weak_def_can_be_hidden	__ZN6MatrixIdE9transposeEv
	.p2align	2
__ZN6MatrixIdE9transposeEv:             ; @_ZN6MatrixIdE9transposeEv
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x20, x0
	mov	x19, x8
	ldp	x25, x24, [x0]
	stp	x24, x25, [x8]
	mov	x22, x8
	str	xzr, [x22, #16]!
	mul	x26, x25, x24
	stp	xzr, xzr, [x8, #24]
	cbz	x26, LBB2_4
; %bb.1:
	lsr	x8, x26, #61
	cbnz	x8, LBB2_17
; %bb.2:
	lsl	x23, x26, #3
Ltmp30:
	mov	x0, x23
	bl	__Znwm
Ltmp31:
; %bb.3:
	mov	x21, x0
	str	x0, [x19, #16]
	add	x22, x0, x26, lsl #3
	str	x22, [x19, #32]
	mov	x1, x23
	bl	_bzero
	str	x22, [x19, #24]
	cbnz	x25, LBB2_5
	b	LBB2_16
LBB2_4:
	mov	x21, #0
	cbz	x25, LBB2_16
LBB2_5:
	mov	x8, #0
	mov	x9, #0
	cmp	x24, #7
	cset	w10, hi
	cmp	x25, #1
	cset	w11, eq
	and	w10, w10, w11
	and	x11, x24, #0xfffffffffffffff8
	lsl	x12, x25, #6
	lsl	x13, x25, #3
	mov	w14, #4
	mov	w15, #4
	cbnz	x24, LBB2_7
	b	LBB2_15
LBB2_6:                                 ;   in Loop: Header=BB2_15 Depth=1
	ldr	x21, [x19, #16]
	add	x15, x15, #1
	add	x14, x14, x24
	add	x8, x8, x24
	cbz	x24, LBB2_15
LBB2_7:
	ldr	x16, [x20, #16]
	cbz	w10, LBB2_12
; %bb.8:
	add	x17, x24, x9
	mul	x0, x24, x9
	add	x1, x24, x0
	add	x2, x21, x9, lsl #3
	add	x17, x21, x17, lsl #3
	add	x0, x16, x0, lsl #3
	add	x1, x16, x1, lsl #3
	cmp	x2, x1
	ccmp	x0, x17, #2, lo
	b.lo	LBB2_12
; %bb.9:
	add	x17, x21, x15, lsl #3
	mov	x0, x11
	add	x1, x16, x14, lsl #3
LBB2_10:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x1, #-32]
	ldp	q2, q3, [x1], #64
	stp	q0, q1, [x17, #-32]
	stp	q2, q3, [x17]
	add	x17, x17, x12
	subs	x0, x0, #8
	b.ne	LBB2_10
; %bb.11:
	mov	x0, x11
	cmp	x24, x11
	b.ne	LBB2_13
	b	LBB2_15
LBB2_12:
	mov	x0, #0
LBB2_13:
	sub	x17, x24, x0
	add	x1, x0, x8
	add	x16, x16, x1, lsl #3
	madd	x0, x25, x0, x9
	add	x0, x21, x0, lsl #3
LBB2_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x16], #8
	str	d0, [x0]
	add	x0, x0, x13
	subs	x17, x17, #1
	b.ne	LBB2_14
LBB2_15:                                ; =>This Inner Loop Header: Depth=1
	add	x9, x9, #1
	cmp	x9, x25
	b.ne	LBB2_6
LBB2_16:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB2_17:
Ltmp32:
	mov	x0, x22
	bl	__ZNKSt3__113__vector_baseIdNS_9allocatorIdEEE20__throw_length_errorEv
Ltmp33:
; %bb.18:
	brk	#0x1
LBB2_19:
Ltmp34:
	mov	x20, x0
	ldr	x0, [x22]
	cbz	x0, LBB2_21
; %bb.20:
	str	x0, [x19, #24]
	bl	__ZdlPv
LBB2_21:
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp30-Lfunc_begin2            ; >> Call Site 1 <<
	.uleb128 Ltmp31-Ltmp30                  ;   Call between Ltmp30 and Ltmp31
	.uleb128 Ltmp34-Lfunc_begin2            ;     jumps to Ltmp34
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp31-Lfunc_begin2            ; >> Call Site 2 <<
	.uleb128 Ltmp32-Ltmp31                  ;   Call between Ltmp31 and Ltmp32
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin2            ; >> Call Site 3 <<
	.uleb128 Ltmp33-Ltmp32                  ;   Call between Ltmp32 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin2            ;     jumps to Ltmp34
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin2            ; >> Call Site 4 <<
	.uleb128 Lfunc_end2-Ltmp33              ;   Call between Ltmp33 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__113__vector_baseIdNS_9allocatorIdEEE20__throw_length_errorEv
__ZNKSt3__113__vector_baseIdNS_9allocatorIdEEE20__throw_length_errorEv: ; @_ZNKSt3__113__vector_baseIdNS_9allocatorIdEEE20__throw_length_errorEv
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt12out_of_rangeC1EPKc
__ZNSt12out_of_rangeC1EPKc:             ; @_ZNSt12out_of_rangeC1EPKc
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh18:
	adrp	x1, l_.str.2@PAGE
Lloh19:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	__ZNSt11logic_errorC2EPKc
Lloh20:
	adrp	x8, __ZTVSt12out_of_range@GOTPAGE
Lloh21:
	ldr	x8, [x8, __ZTVSt12out_of_range@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ; -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	2
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ; @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
Ltmp35:
	add	x0, sp, #8
	mov	x1, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp36:
; %bb.1:
	ldrb	w8, [sp, #8]
	cbz	w8, LBB6_10
; %bb.2:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x22, x19, x8
	ldr	x23, [x22, #40]
	ldr	w25, [x22, #8]
	ldr	w24, [x22, #144]
	cmn	w24, #1
	b.ne	LBB6_7
; %bb.3:
Ltmp38:
	add	x8, sp, #24
	mov	x0, x22
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp39:
; %bb.4:
Ltmp40:
Lloh22:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh23:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #24
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp41:
; %bb.5:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp42:
	mov	w1, #32
	blr	x8
Ltmp43:
; %bb.6:
	mov	x24, x0
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
	str	w24, [x22, #144]
LBB6_7:
	add	x3, x20, x21
	mov	w8, #176
	and	w8, w25, w8
	cmp	w8, #32
	csel	x2, x3, x20, eq
Ltmp45:
	sxtb	w5, w24
	mov	x0, x23
	mov	x1, x20
	mov	x4, x22
	bl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp46:
; %bb.8:
	cbnz	x0, LBB6_10
; %bb.9:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
	ldr	w8, [x0, #32]
	mov	w9, #5
	orr	w1, w8, w9
Ltmp48:
	bl	__ZNSt3__18ios_base5clearEj
Ltmp49:
LBB6_10:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB6_11:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB6_12:
Ltmp50:
	b	LBB6_15
LBB6_13:
Ltmp44:
	mov	x20, x0
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
	b	LBB6_16
LBB6_14:
Ltmp47:
LBB6_15:
	mov	x20, x0
LBB6_16:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB6_18
LBB6_17:
Ltmp37:
	mov	x20, x0
LBB6_18:
	mov	x0, x20
	bl	___cxa_begin_catch
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
Ltmp51:
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp52:
; %bb.19:
	bl	___cxa_end_catch
	b	LBB6_11
LBB6_20:
Ltmp53:
	mov	x19, x0
Ltmp54:
	bl	___cxa_end_catch
Ltmp55:
; %bb.21:
	mov	x0, x19
	bl	__Unwind_Resume
LBB6_22:
Ltmp56:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh22, Lloh23
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp35-Lfunc_begin3            ; >> Call Site 1 <<
	.uleb128 Ltmp36-Ltmp35                  ;   Call between Ltmp35 and Ltmp36
	.uleb128 Ltmp37-Lfunc_begin3            ;     jumps to Ltmp37
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp38-Lfunc_begin3            ; >> Call Site 2 <<
	.uleb128 Ltmp39-Ltmp38                  ;   Call between Ltmp38 and Ltmp39
	.uleb128 Ltmp47-Lfunc_begin3            ;     jumps to Ltmp47
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp40-Lfunc_begin3            ; >> Call Site 3 <<
	.uleb128 Ltmp43-Ltmp40                  ;   Call between Ltmp40 and Ltmp43
	.uleb128 Ltmp44-Lfunc_begin3            ;     jumps to Ltmp44
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp45-Lfunc_begin3            ; >> Call Site 4 <<
	.uleb128 Ltmp46-Ltmp45                  ;   Call between Ltmp45 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin3            ;     jumps to Ltmp47
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp48-Lfunc_begin3            ; >> Call Site 5 <<
	.uleb128 Ltmp49-Ltmp48                  ;   Call between Ltmp48 and Ltmp49
	.uleb128 Ltmp50-Lfunc_begin3            ;     jumps to Ltmp50
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp49-Lfunc_begin3            ; >> Call Site 6 <<
	.uleb128 Ltmp51-Ltmp49                  ;   Call between Ltmp49 and Ltmp51
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp51-Lfunc_begin3            ; >> Call Site 7 <<
	.uleb128 Ltmp52-Ltmp51                  ;   Call between Ltmp51 and Ltmp52
	.uleb128 Ltmp53-Lfunc_begin3            ;     jumps to Ltmp53
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp52-Lfunc_begin3            ; >> Call Site 8 <<
	.uleb128 Ltmp54-Ltmp52                  ;   Call between Ltmp52 and Ltmp54
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin3            ; >> Call Site 9 <<
	.uleb128 Ltmp55-Ltmp54                  ;   Call between Ltmp54 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin3            ;     jumps to Ltmp56
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp55-Lfunc_begin3            ; >> Call Site 10 <<
	.uleb128 Lfunc_end3-Ltmp55              ;   Call between Ltmp55 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ; -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	2
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ; @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	cbz	x0, LBB7_15
; %bb.1:
	mov	x24, x5
	mov	x20, x4
	mov	x22, x3
	mov	x21, x2
	ldr	x8, [x4, #24]
	sub	x9, x3, x1
	subs	x8, x8, x9
	csel	x23, x8, xzr, gt
	sub	x25, x2, x1
	cmp	x25, #1
	b.lt	LBB7_3
; %bb.2:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x2, x25
	blr	x8
	cmp	x0, x25
	b.ne	LBB7_14
LBB7_3:
	cmp	x23, #1
	b.lt	LBB7_11
; %bb.4:
	cmp	x23, #23
	b.hs	LBB7_6
; %bb.5:
	add	x25, sp, #8
	strb	w23, [sp, #31]
	b	LBB7_7
LBB7_6:
	add	x8, x23, #16
	and	x26, x8, #0xfffffffffffffff0
	mov	x0, x26
	bl	__Znwm
	mov	x25, x0
	orr	x8, x26, #0x8000000000000000
	stp	x23, x8, [sp, #16]
	str	x0, [sp, #8]
LBB7_7:
	mov	x0, x25
	mov	x1, x24
	mov	x2, x23
	bl	_memset
	strb	wzr, [x25, x23]
	ldrsb	w8, [sp, #31]
	ldr	x9, [sp, #8]
	cmp	w8, #0
	add	x8, sp, #8
	csel	x1, x9, x8, lt
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
Ltmp57:
	mov	x0, x19
	mov	x2, x23
	blr	x8
Ltmp58:
; %bb.8:
	mov	x24, x0
	ldrsb	w8, [sp, #31]
	tbnz	w8, #31, LBB7_10
; %bb.9:
	cmp	x24, x23
	b.ne	LBB7_14
	b	LBB7_11
LBB7_10:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	cmp	x24, x23
	b.ne	LBB7_14
LBB7_11:
	sub	x22, x22, x21
	cmp	x22, #1
	b.lt	LBB7_13
; %bb.12:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x22
	blr	x8
	cmp	x0, x22
	b.ne	LBB7_14
LBB7_13:
	str	xzr, [x20, #24]
	b	LBB7_15
LBB7_14:
	mov	x19, #0
LBB7_15:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB7_16:
Ltmp59:
	mov	x19, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB7_18
; %bb.17:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
LBB7_18:
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp57-Lfunc_begin4            ;   Call between Lfunc_begin4 and Ltmp57
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin4            ; >> Call Site 2 <<
	.uleb128 Ltmp58-Ltmp57                  ;   Call between Ltmp57 and Ltmp58
	.uleb128 Ltmp59-Lfunc_begin4            ;     jumps to Ltmp59
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin4            ; >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp58              ;   Call between Ltmp58 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"After transposing"

l_.str.2:                               ; @.str.2
	.asciz	"Matrix index out of range"

l_.str.3:                               ; @.str.3
	.asciz	", "

	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; @.memset_pattern
l_.memset_pattern:
	.quad	0x4014000000000000              ; double 5
	.quad	0x4014000000000000              ; double 5

.subsections_via_symbols
