; RUN: llc  -march=cpu0 -mcpu=cpu032I -relocation-model=pic -O3 < %s | FileCheck %s -check-prefix=16
%struct.ua = type <{ i16, i32 }>

@foo = common global %struct.ua zeroinitializer, align 1

define i32 @main() nounwind {
entry:
  store i32 10, i32* getelementptr inbounds (%struct.ua, %struct.ua* @foo, i32 0, i32 1), align 1
; 16:   sb  ${{[0-9]+|t9}}, {{[0-9]+|t9}}(${{[0-9]+|t9}})
; 16:   sb  ${{[0-9]+|t9}}, {{[0-9]+|t9}}(${{[0-9]+|t9}})
; 16:   sb  ${{[0-9]+|t9}}, {{[0-9]+|t9}}(${{[0-9]+|t9}})
; 16:   sb  ${{[0-9]+|t9}}, {{[0-9]+|t9}}(${{[0-9]+|t9}})
  ret i32 0
}
