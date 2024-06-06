; ModuleID = 'lxj.cpp'
source_filename = "lxj.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable mustprogress
define dso_local i32 @_Z3MULyj(i64 %x, i32 %y) #0 {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = load i64, i64* %x.addr, align 8
  %1 = load i32, i32* %y.addr, align 4
  %conv = zext i32 %1 to i64
  %mul = mul i64 %0, %conv
  %conv1 = trunc i64 %mul to i32
  ret i32 %conv1
}

attributes #0 = { noinline nounwind optnone uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git e8a397203c67adbeae04763ce25c6a5ae76af52c)"}
