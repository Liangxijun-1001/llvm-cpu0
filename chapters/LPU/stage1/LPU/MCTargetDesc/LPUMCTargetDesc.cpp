/***
 * @Author: Liangnus
 * @Date: 2024-03-28 14:14:21
 * @LastEditTime: 2024-04-01 02:50:55
 * @LastEditors: Liangnus
 * @Description:
 * @FilePath: /llvm-cpu0/tutorial/test/llvm/lib/Target/LPU/MCTargetDesc/LPUMCTargetDesc.cpp
 */
//===-- Cpu0MCTargetDesc.cpp - Cpu0 Target Descriptions ---------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides Cpu0 specific target descirptions.
//
//===----------------------------------------------------------------------===//

#include "llvm/MC/MachineLocation.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstPrinter.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

// #define GET_INSTRINFO_MC_DESC
// #include "Cpu0GenInstrInfo.inc"

// #define GET_SUBTARGETINFO_MC_DESC
// #include "Cpu0GenSubtargetInfo.inc"

// #define GET_REGINFO_MC_DESC
// #include "Cpu0GenRegisterInfo.inc"

extern "C" void LLVMInitializeLPUTargetMC() {
}
