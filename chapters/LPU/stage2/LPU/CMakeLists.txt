set(LLVM_TARGET_DEFINITIONS LPU.td)
add_llvm_component_group(LPU)

tablegen(LLVM LPURegisterInfo.inc -gen-register-info)
# tablegen(LLVM LPUGenInstrInfo.inc -gen-instr-info)
# tablegen(LLVM LPUGenSubtargetInfo.inc -gen-subtarget)
# tablegen(LLVM LPUGenMCPseudoLowering.inc -gen-pseudo-lowering)


add_public_tablegen_target(LPUCommonTableGen)
# Cpu0CodeGen should match with LLVMBuild.txt Cpu0CodeGen
# all_llvm_target好像是必须要有的
add_llvm_target(LPUCodeGen LPUTargetMachine.cpp
ADD_TO_COMPONENT
LPU
)

add_subdirectory(TargetInfo) #[必须存在项]这个子工程的LLVMInitializeLPUTargetInfo函数是llc --version会返回的后端注册信息
add_subdirectory(MCTargetDesc)

