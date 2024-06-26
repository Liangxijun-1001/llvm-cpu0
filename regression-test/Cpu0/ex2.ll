; RUN: llc  -march=cpu0el -relocation-model=pic < %s | FileCheck %s -check-prefix=16

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@_ZTIPKc = external constant i8*

define i32 @main() {
; 16: main:
; 16: 	.cfi_startproc
; 16: 	st	$lr,
; 16:   .cfi_offset 14, -4
; 16: 	.cfi_offset
; 16: 	.cprestore
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %exception = call i8* @__cxa_allocate_exception(i32 4) nounwind
  %0 = bitcast i8* %exception to i8**
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8** %0
  call void @__cxa_throw(i8* %exception, i8* bitcast (i8** @_ZTIPKc to i8*), i8* null) noreturn
  unreachable

return:                                           ; No predecessors!
  %1 = load i32, i32* %retval
  ret i32 %1
}

declare i8* @__cxa_allocate_exception(i32)

declare void @__cxa_throw(i8*, i8*, i8*)
