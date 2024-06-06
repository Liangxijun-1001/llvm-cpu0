class LPU32 : Instruction {
   let Size = 4;
   let Namespace = "LPU";
   bits<32> Inst;
}
 
def LPURetFlag : SDNode<"LPUISD::RET_FLAG", SDTNone,
                             [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;
 
def simm12 : Operand<i32>, ImmLeaf<i32, [{return isInt<12>(Imm);}]>;
  
def ADDI : LPU32 {
    let OutOperandList = (outs GPR:$rd);
    let InOperandList = (ins GPR:$rs1, simm12:$imm12);
    let AsmString = "addi $rd, $rs1, $imm12";
    let Pattern = [(set GPR:$rd, (add GPR:$rs1, simm12:$imm12))];
    bits<5> rd;
    bits<5> rs1;
    bits<12> imm12;
    let Inst{31-20} = imm12;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0010011;
}
  
def JALR : LPU32 {
    let OutOperandList = (outs GPR:$rd);
    let InOperandList = (ins GPR:$rs1, simm12:$imm12);
    let AsmString = "jalr $rd, ${imm12}(${rs1})";
    bits<5> rd;
    bits<5> rs1;
    bits<12> imm12;
    let Inst{31-20} = imm12;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1101111;
    let isCall = 1;
}
  
def : InstAlias<"ret", (JALR X0, X1, 0), 4>;
  
def PseudoRET : LPU32, PseudoInstExpansion<(JALR X0, X1, 0)> {
    let OutOperandList = (outs);
    let InOperandList = (ins);
    let Pattern = [(LPURetFlag)];
    let isPseudo = 1;
    let isReturn = 1;
    let isTerminator = 1;
}