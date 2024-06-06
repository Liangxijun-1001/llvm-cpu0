include "llvm/Target/Target.td"
include "LPURegisterInfo.td"
include "LPUInstrInfo.td"

def LPUInstrInfo : InstrInfo;

def LPU : Target {
    let InstructionSet = LPUInstrInfo;
}