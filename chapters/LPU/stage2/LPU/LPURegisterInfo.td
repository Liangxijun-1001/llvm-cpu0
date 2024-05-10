  class LPUReg<bits<5> enc, string name, list<string> alt = []>
       : Register<name, alt> {
     let HWEncoding{4-0} = enc;
     let Namespace = "LPU";
   }
   
   def ABIRegAltName : RegAltNameIndex;
   
   let RegAltNameIndices = [ABIRegAltName] in {
    def X0  : LPUReg<0,  "x0",  ["zero"]>;
    def X1  : LPUReg<1,  "x1",  ["ra"]>;
    def X2  : LPUReg<2,  "x2",  ["sp"]>;
    def X3  : LPUReg<3,  "x3",  ["gp"]>;
    def X4  : LPUReg<4,  "x4",  ["tp"]>;
    def X5  : LPUReg<5,  "x5",  ["t0"]>;
    def X6  : LPUReg<6,  "x6",  ["t1"]>;
    def X7  : LPUReg<7,  "x7",  ["t2"]>;
    def X8  : LPUReg<8,  "x8",  ["s0", "fp"]>;
    def X9  : LPUReg<9,  "x9",  ["s1"]>;
    def X10 : LPUReg<10, "x10", ["a0"]>;
    def X11 : LPUReg<11, "x11", ["a1"]>;
    def X12 : LPUReg<12, "x12", ["a2"]>;
    def X13 : LPUReg<13, "x13", ["a3"]>;
    def X14 : LPUReg<14, "x14", ["a4"]>;
    def X15 : LPUReg<15, "x15", ["a5"]>;
    def X16 : LPUReg<16, "x16", ["a6"]>;
    def X17 : LPUReg<17, "x17", ["a7"]>;
    def X18 : LPUReg<18, "x18", ["s2"]>;
    def X19 : LPUReg<19, "x19", ["s3"]>;
    def X20 : LPUReg<20, "x20", ["s4"]>;
    def X21 : LPUReg<21, "x21", ["s5"]>;
    def X22 : LPUReg<22, "x22", ["s6"]>;
    def X23 : LPUReg<23, "x23", ["s7"]>;
    def X24 : LPUReg<24, "x24", ["s8"]>;
    def X25 : LPUReg<25, "x25", ["s9"]>;
    def X26 : LPUReg<26, "x26", ["s10"]>;
    def X27 : LPUReg<27, "x27", ["s11"]>;
    def X28 : LPUReg<28, "x28", ["t3"]>;
    def X29 : LPUReg<29, "x29", ["t4"]>;
    def X30 : LPUReg<30, "x30", ["t5"]>;
    def X31 : LPUReg<31, "x31", ["t6"]>;
  }
  
  def GPR : RegisterClass<"LPU", [i32], 32, (add
    (sequence "X%u", 10, 17),
    (sequence "X%u", 5, 7),
    (sequence "X%u", 28, 31),
    (sequence "X%u", 8, 9),
    (sequence "X%u", 18, 27),
    (sequence "X%u", 0, 4)
  )>;