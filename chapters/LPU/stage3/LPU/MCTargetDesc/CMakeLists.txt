# MCTargetDesc/CMakeLists.txt
add_llvm_component_library(LLVMLPUDesc
  LPUMCTargetDesc.cpp

  ADD_TO_COMPONENT
  LPU
  )
