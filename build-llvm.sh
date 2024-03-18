#!/usr/bin/env bash

# If your memory is large enough, add swap size ubuntu as follows,
# 1. search "add swap size ubuntu"
# 2. https://bogdancornianu.com/change-swap-size-in-ubuntu/
# 3. add to boot by change to /swapfile                                 swap            swap    default              0       0
# https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-18-04/
# 4. reboot

ROOT_DIR=/home1/liangnus/learning/xiaoyu1998/llvm-cpu0

TUTORIAL_DIR=${ROOT_DIR}/tutorial
LLVM_PROJECT_DIR=${TUTORIAL_DIR}/llvm-project
LLVM_TEST_DIR=${TUTORIAL_DIR}/test

get_llvm()
{
  if ! test -d ${TUTORIAL_DIR}/llvm-project; then
    git clone https://github.com/llvm/llvm-project.git  --recursive
    cd llvm-project
    git checkout -b 12.x origin/release/12.x
    git checkout e8a397203c67adbeae04763ce25c6a5ae76af52c
    cd ..
  else
    echo "${TUTORIAL_DIR}/llvm-project has existed already"
  #  exit 1
  fi
}

build_llvm()
{
  if ! test -d ${LLVM_PROJECT_DIR}/build; then
    mkdir -p  ${LLVM_PROJECT_DIR}/build
    pushd ${LLVM_PROJECT_DIR}/build
    OS=`uname -s`
    echo "OS =" ${OS}
    cmake -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_PROJECTS="clang" \
    -DLLVM_OPTIMIZED_TABLEGEN=On \
    -DLLVM_PARALLEL_COMPILE_JOBS=16 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
    time ninja
    popd
  fi
}

if [ ! -d ${TUTORIAL_DIR} ]; then
    echo "Tutorial Folder not exist, make dir..."
    mkdir -p ${TUTORIAL_DIR}
    echo "Success！"
fi

pushd ${TUTORIAL_DIR}
get_llvm
build_llvm
popd
#echo "Please remember to add ${LLVM_PROJECT_DIR}/llvm-project/build/bin to variable \${PATH} to your \
#  environment for clang++, clang."
