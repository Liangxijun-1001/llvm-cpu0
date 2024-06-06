# llvm 10.0.0 change from add_llvm_library to add_llvm_component_library
add_llvm_component_library(LLVMLPUInfo
    LPUTargetInfo.cpp
    ADD_TO_COMPONENT
    LPU
)
