; ModuleID = '/home1/liangnus/learning/llvm-cpu0/input/lxj.cpp'
source_filename = "/home1/liangnus/learning/llvm-cpu0/input/lxj.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind optnone uwtable mustprogress
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %t, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc8, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 10
  br i1 %cmp2, label %for.body3, label %for.end10

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32, i32* %k, align 4
  %cmp5 = icmp slt i32 %2, 10
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %t, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %t, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %4 = load i32, i32* %k, align 4
  %inc7 = add nsw i32 %4, 1
  store i32 %inc7, i32* %k, align 4
  br label %for.cond4, !llvm.loop !2

for.end:                                          ; preds = %for.cond4
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %5 = load i32, i32* %j, align 4
  %inc9 = add nsw i32 %5, 1
  store i32 %inc9, i32* %j, align 4
  br label %for.cond1, !llvm.loop !4

for.end10:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc15, %for.end10
  %6 = load i32, i32* %j, align 4
  %cmp12 = icmp slt i32 %6, 10
  br i1 %cmp12, label %for.body13, label %for.end17

for.body13:                                       ; preds = %for.cond11
  %7 = load i32, i32* %t, align 4
  %inc14 = add nsw i32 %7, 1
  store i32 %inc14, i32* %t, align 4
  br label %for.inc15

for.inc15:                                        ; preds = %for.body13
  %8 = load i32, i32* %j, align 4
  %inc16 = add nsw i32 %8, 1
  store i32 %inc16, i32* %j, align 4
  br label %for.cond11, !llvm.loop !5

for.end17:                                        ; preds = %for.cond11
  br label %for.inc18

for.inc18:                                        ; preds = %for.end17
  %9 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %9, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond, !llvm.loop !6

for.end20:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc38, %for.end20
  %10 = load i32, i32* %i, align 4
  %cmp22 = icmp slt i32 %10, 20
  br i1 %cmp22, label %for.body23, label %for.end40

for.body23:                                       ; preds = %for.cond21
  store i32 0, i32* %j, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc28, %for.body23
  %11 = load i32, i32* %j, align 4
  %cmp25 = icmp slt i32 %11, 20
  br i1 %cmp25, label %for.body26, label %for.end30

for.body26:                                       ; preds = %for.cond24
  %12 = load i32, i32* %t, align 4
  %inc27 = add nsw i32 %12, 1
  store i32 %inc27, i32* %t, align 4
  br label %for.inc28

for.inc28:                                        ; preds = %for.body26
  %13 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %13, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond24, !llvm.loop !7

for.end30:                                        ; preds = %for.cond24
  store i32 0, i32* %j, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc35, %for.end30
  %14 = load i32, i32* %j, align 4
  %cmp32 = icmp slt i32 %14, 20
  br i1 %cmp32, label %for.body33, label %for.end37

for.body33:                                       ; preds = %for.cond31
  %15 = load i32, i32* %t, align 4
  %inc34 = add nsw i32 %15, 1
  store i32 %inc34, i32* %t, align 4
  br label %for.inc35

for.inc35:                                        ; preds = %for.body33
  %16 = load i32, i32* %j, align 4
  %inc36 = add nsw i32 %16, 1
  store i32 %inc36, i32* %j, align 4
  br label %for.cond31, !llvm.loop !8

for.end37:                                        ; preds = %for.cond31
  br label %for.inc38

for.inc38:                                        ; preds = %for.end37
  %17 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %17, 1
  store i32 %inc39, i32* %i, align 4
  br label %for.cond21, !llvm.loop !9

for.end40:                                        ; preds = %for.cond21
  %18 = load i32, i32* %t, align 4
  ret i32 %18
}

attributes #0 = { noinline norecurse nounwind optnone uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git e8a397203c67adbeae04763ce25c6a5ae76af52c)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
!4 = distinct !{!4, !3}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = distinct !{!9, !3}
