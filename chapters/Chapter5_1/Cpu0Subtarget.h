//===-- Cpu0Subtarget.h - Define Subtarget for the Cpu0 ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the Cpu0 specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_CPU0_CPU0SUBTARGET_H
#define LLVM_LIB_TARGET_CPU0_CPU0SUBTARGET_H

#include "Cpu0Config.h"

#include "Cpu0FrameLowering.h"
#include "Cpu0ISelLowering.h"
#include "Cpu0InstrInfo.h"
#include "llvm/CodeGen/SelectionDAGTargetInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/MC/MCInstrItineraries.h"
#include <string>

#define GET_SUBTARGETINFO_HEADER
#include "Cpu0GenSubtargetInfo.inc"

//@1
namespace llvm {
class StringRef;

class Cpu0TargetMachine;

class Cpu0Subtarget : public Cpu0GenSubtargetInfo {
  virtual void anchor();

public:

  bool HasChapterDummy;
  bool HasChapterAll;

  bool hasChapter3_1() const {
    return true;
  }

  bool hasChapter3_2() const {
    return true;
  }

  bool hasChapter3_3() const {
    return true;
  }

  bool hasChapter3_4() const {
    return true;
  }

  bool hasChapter3_5() const {
    return true;
  }

  bool hasChapter4_1() const {
    return true;
  }

  bool hasChapter4_2() const {
    return true;
  }

  bool hasChapter5_1() const {
    return true;
  }

  bool hasChapter6_1() const {
    return false;
  }

  bool hasChapter7_1() const {
    return false;
  }

  bool hasChapter8_1() const {
    return false;
  }

  bool hasChapter8_2() const {
    return false;
  }

  bool hasChapter9_1() const {
    return false;
  }

  bool hasChapter9_2() const {
    return false;
  }

  bool hasChapter9_3() const {
    return false;
  }

  bool hasChapter10_1() const {
    return false;
  }

  bool hasChapter11_1() const {
    return false;
  }

  bool hasChapter11_2() const {
    return false;
  }

  bool hasChapter12_1() const {
    return false;
  }

protected:
  enum Cpu0ArchEnum {
    Cpu032I,
    Cpu032II
  };

  // Cpu0 architecture version
  Cpu0ArchEnum Cpu0ArchVersion;

  // IsLittle - The target is Little Endian
  bool IsLittle;

  bool EnableOverflow;

  // HasCmp - cmp instructions.
  bool HasCmp;

  // HasSlt - slt instructions.
  bool HasSlt;

  InstrItineraryData InstrItins;

  const Cpu0TargetMachine &TM;

  Triple TargetTriple;

  const SelectionDAGTargetInfo TSInfo;

  std::unique_ptr<const Cpu0InstrInfo> InstrInfo;
  std::unique_ptr<const Cpu0FrameLowering> FrameLowering;
  std::unique_ptr<const Cpu0TargetLowering> TLInfo;

public:
  bool isPositionIndependent() const;
  const Cpu0ABIInfo &getABI() const;

  /// This constructor initializes the data members to match that
  /// of the specified triple.
  Cpu0Subtarget(const Triple &TT, StringRef CPU, StringRef FS,
                bool little, const Cpu0TargetMachine &_TM);

//- Vitual function, must have
  /// ParseSubtargetFeatures - Parses features string setting specified
  /// subtarget options.  Definition of function is auto generated by tblgen.
  void ParseSubtargetFeatures(StringRef CPU, StringRef TuneCPU, StringRef FS);

  bool isLittle() const { return IsLittle; }
  bool hasCpu032I() const { return Cpu0ArchVersion >= Cpu032I; }
  bool isCpu032I() const { return Cpu0ArchVersion == Cpu032I; }
  bool hasCpu032II() const { return Cpu0ArchVersion >= Cpu032II; }
  bool isCpu032II() const { return Cpu0ArchVersion == Cpu032II; }

  /// Features related to the presence of specific instructions.
  bool enableOverflow() const { return EnableOverflow; }
  bool disableOverflow() const { return !EnableOverflow; }
  bool hasCmp()   const { return HasCmp; }
  bool hasSlt()   const { return HasSlt; }

  bool abiUsesSoftFloat() const;

  bool enableLongBranchPass() const {
    return hasCpu032II();
  }

  unsigned stackAlignment() const { return 8; }

  Cpu0Subtarget &initializeSubtargetDependencies(StringRef CPU, StringRef FS,
                                                 const TargetMachine &TM);

  const SelectionDAGTargetInfo *getSelectionDAGInfo() const override {
    return &TSInfo;
  }
  const Cpu0InstrInfo *getInstrInfo() const override { return InstrInfo.get(); }
  const TargetFrameLowering *getFrameLowering() const override {
    return FrameLowering.get();
  }
  const Cpu0RegisterInfo *getRegisterInfo() const override {
    return &InstrInfo->getRegisterInfo();
  }
  const Cpu0TargetLowering *getTargetLowering() const override {
    return TLInfo.get();
  }
  const InstrItineraryData *getInstrItineraryData() const override {
    return &InstrItins;
  }
};
} // End llvm namespace

#endif // #if CH >= CH3_1
