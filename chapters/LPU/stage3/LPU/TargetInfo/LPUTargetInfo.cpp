/***
 * @Author: Liangnus
 * @Date: 2024-03-27 06:20:57
 * @LastEditTime: 2024-04-01 02:54:32
 * @LastEditors: Liangnus
 * @Description:
 * @FilePath: /llvm-cpu0/tutorial/test/llvm/lib/Target/LPU/TargetInfo/LPUTargetInfo.cpp
 */
//===-- LPUTargetInfo.cpp - LPU Target Implementation -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target &getTheLPUTarget() {
  static Target TheLPUTarget;
  return TheLPUTarget;
}

Target &getTheLPUelTarget() {
  static Target TheLPUelTarget;
  return TheLPUelTarget;
}

extern "C" void LLVMInitializeLPUTargetInfo() {
  RegisterTarget<Triple::lpu,
        true> X(getTheLPUTarget(), "lpu", "LPU (32-bit big endian)", "LPU");
}
