; RUN: llc -march=cpu0el -mcpu=cpu032I -cpu0-s32-calls=true -relocation-model=static < %s | FileCheck %s -check-prefix=CHECK_ADDIU

@i = global i32 6, align 4
@j = global i32 12, align 4
@k = global i32 15, align 4
@l = global i32 20, align 4
@.str = private unnamed_addr constant [13 x i8] c"%i %i %i %i\0A\00", align 1

define void @foo() nounwind {
entry:
  %0 = load i32, i32* @i, align 4
  %add = add nsw i32 %0, 5
  store i32 %add, i32* @i, align 4
  %1 = load i32, i32* @j, align 4
  %sub = sub nsw i32 %1, 5
  store i32 %sub, i32* @j, align 4
  %2 = load i32, i32* @k, align 4
  %add1 = add nsw i32 %2, 10000
  store i32 %add1, i32* @k, align 4
  %3 = load i32, i32* @l, align 4
  %sub2 = sub nsw i32 %3, 10000
  store i32 %sub2, i32* @l, align 4
; CHECK_ADDIU: 	addiu	${{[0-9]+|t9}}, ${{[0-9]+|t9}}, 5
; CHECK_ADDIU: 	addiu	${{[0-9]+|t9}}, ${{[0-9]+|t9}}, -5
; CHECK_ADDIU: 	addiu	${{[0-9]+|t9}}, ${{[0-9]+|t9}}, 10000
; CHECK_ADDIU: 	addiu	${{[0-9]+|t9}}, ${{[0-9]+|t9}}, -10000
  ret void
}
