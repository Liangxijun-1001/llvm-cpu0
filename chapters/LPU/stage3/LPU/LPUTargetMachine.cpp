/***
 * @Author: Liangnus
 * @Date: 2024-03-28 14:13:29
 * @LastEditTime: 2024-04-01 02:55:21
 * @LastEditors: Liangnus
 * @Description:
 * @FilePath: /llvm-cpu0/tutorial/test/llvm/lib/Target/LPU/LPUTargetMachine.cpp
 */
//===-- Cpu0TargetMachine.cpp - Define TargetMachine for Cpu0 ---*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Implements the info about Cpu0 target spec
//
//===----------------------------------------------------------------------===//
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "lpu"

extern "C" void LLVMInitializeLPUTarget() {
}
