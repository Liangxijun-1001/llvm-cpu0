; ModuleID = '/home1/liangnus/learning/xiaoyu1998/llvm-cpu0/input/lxj.cpp'
source_filename = "/home1/liangnus/learning/xiaoyu1998/llvm-cpu0/input/lxj.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable willreturn mustprogress
define dso_local i32 @_Z3divii(i32 %a, i32 %b) local_unnamed_addr #0 {
entry:
  %div = sdiv i32 %a, %b
  ret i32 %div
}

attributes #0 = { norecurse nounwind readnone uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git e8a397203c67adbeae04763ce25c6a5ae76af52c)"}
