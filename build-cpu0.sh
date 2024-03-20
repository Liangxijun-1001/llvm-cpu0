#!/usr/bin/env bash
###
 # @Author: Liangnus
 # @Date: 2024-03-18 08:17:37
 # @LastEditTime: 2024-03-20 03:58:33
 # @LastEditors: Liangnus
 # @Description: 编译带有cpu0后端的llvm代码
 # @FilePath: /llvm-cpu0/build-cpu0.sh
###

ROOT_DIR=$(pwd)
TUTORIAL_DIR=${ROOT_DIR}/tutorial
LLVM_PROJECT_DIR=${TUTORIAL_DIR}/llvm-project
LLVM_TEST_DIR=${TUTORIAL_DIR}/test

if ! test -d ${LLVM_TEST_DIR}; then
  mkdir ${LLVM_TEST_DIR}
  #pushd ${LLVM_TEST_DIR} vscode not support 'pushd' command
  cd ${LLVM_TEST_DIR}
# ln clang is must since Cpu0 asm boot.cpp and start.h need building clang on
# llvm/Cpu0.
  rm -rvf clang
  rm -rvf llvm
  ln -s ${LLVM_PROJECT_DIR}/clang clang
  ln -s ${LLVM_PROJECT_DIR}/llvm llvm
  cd -
  # popd vscode not support 'popd' command
  cp -rf llvm/modify/llvm/* ${LLVM_TEST_DIR}/llvm/.
  cp -rf Cpu0 ${LLVM_TEST_DIR}/llvm/lib/Target/.
  cp -rf regression-test/Cpu0 ${LLVM_TEST_DIR}/llvm/test/CodeGen/.
  OS=`uname -s`
  echo "OS =" ${OS}
  #pushd ${LLVM_TEST_DIR} vscode not support 'pushd' command
  cd  ${LLVM_TEST_DIR}
  mkdir build
  cd build
# clang has better diagnosis in report error message
  # 在编译LLVM-Cpu0后端的时候直接使用之前编译的LLVM clang和clang++编译代码
  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
  -DLLVM_TARGETS_TO_BUILD=Cpu0 \
  -DLLVM_OPTIMIZED_TABLEGEN=On  \
  -DLLVM_PARALLEL_COMPILE_JOBS=16 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
  time ninja
#  -G "Unix Makefiles" ../llvm
#  time make -j4
  #popd vscode not support 'popd' command
else
  echo  -e "\033[1;32;37m ${LLVM_TEST_DIR} has existed already \033[0m"
  cd ${LLVM_TEST_DIR}/build
  if [ -e build.ninja ]; then
    echo -e "\033[1;32 build.ninja file exist, perform incremental compilation... \033[0m"
    cd ${LLVM_TEST_DIR}
    cd ${LLVM_TEST_DIR}/build
    time ninja
  else
    echo -e "\033[1;31 build.ninja file not exist, make reconfiguration... \033[0m"
    cd ${LLVM_TEST_DIR}
    rm -rvf clang
    rm -rvf llvm
    ln -s ${LLVM_PROJECT_DIR}/clang clang
    ln -s ${LLVM_PROJECT_DIR}/llvm llvm
    cd -
    # popd vscode not support 'popd' command
    cp -rf llvm/modify/llvm/* ${LLVM_TEST_DIR}/llvm/.
    cp -rf Cpu0 ${LLVM_TEST_DIR}/llvm/lib/Target/.
    cp -rf regression-test/Cpu0 ${LLVM_TEST_DIR}/llvm/test/CodeGen/.
    cd ${LLVM_TEST_DIR}/build
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
    -DLLVM_TARGETS_TO_BUILD=Cpu0 \
    -DLLVM_OPTIMIZED_TABLEGEN=On  \
    -DLLVM_PARALLEL_COMPILE_JOBS=16 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
  time ninja
  fi
fi
