###
 # @Author: Liangnus
 # @Date: 2024-04-01 02:24:29
 # @LastEditTime: 2024-04-01 09:04:09
 # @LastEditors: Liangnus
 # @Description: 编译LLVM-LPU后端代码
 # @FilePath: /llvm-cpu0/build-lpu.sh
###
#!/bin/bash
ROOT_DIR=$(pwd)
TUTORIAL_DIR=${ROOT_DIR}/tutorial
LLVM_PROJECT_DIR=${TUTORIAL_DIR}/llvm-project/build/bin
LLVM_LPU_DIR=${TUTORIAL_DIR}/lpu

# 检查用户提供的参数个数
if [ $# -eq 0 ]; then
  echo -e "\033[1;31m 请提供具体你需要学习的LPU章节代码[stage1/stage2....]\033[0m"
  return 1
fi

# 提取用户提供的章节代码名称
to_learn_lpu_stage="$1"

# 检查章节代码名称合法性
if [ "${to_learn_lpu_stage}" = "stage1" -o  "${to_learn_lpu_stage}" = "stage2" -o "${to_learn_lpu_stage}" = "stage3" ]; then
  echo -e "\033[1;32m提供的LPU学习章节合法\033[0m"
else
  echo -e "\033[1;31m提供的LPU学习章节不合法, 请检查重新输入\033[0m"
  return 1
fi

# 检查文件夹是否存在，如果不存在
if [ ! -d "${ROOT_DIR}/chapters/LPU/${to_learn_lpu_stage}" ]; then
  echo -e "\033[1;31m ${to_learn_lpu_stage} 文件夹不存在请检查... \033[0m"
  return 1
fi

# 测试lpu文件夹是否存在，如果不存在
if ! test -d ${LLVM_LPU_DIR}; then
  mkdir ${LLVM_LPU_DIR}
  #pushd ${LLVM_TEST_DIR} vscode not support 'pushd' command
  cd ${LLVM_LPU_DIR}
# ln clang is must since Cpu0 asm boot.cpp and start.h need building clang on
# llvm/Cpu0.
  rm -rvf clang
  rm -rvf clang++
  rm -rvf llvm
  ln -s ${LLVM_PROJECT_DIR}/clang clang
  ln -s ${LLVM_PROJECT_DIR}/clang++ clang++
  ln -s ${LLVM_PROJECT_DIR}/../../llvm llvm
  cd -
  # popd vscode not support 'popd' command
  cp -rf ${ROOT_DIR}/llvm/modify_lpu/llvm/* ${LLVM_LPU_DIR}/llvm/.
  cp -rf ${ROOT_DIR}/chapters/LPU/${to_learn_lpu_stage}/* ${LLVM_LPU_DIR}/llvm/lib/Target/.
  OS=`uname -s`
  echo "OS =" ${OS}
  #pushd ${LLVM_TEST_DIR} vscode not support 'pushd' command
  cd  ${LLVM_LPU_DIR}
  mkdir -p  build
  cd build
# clang has better diagnosis in report error message
  # 在编译LLVM-LPU后端的时候直接使用之前编译的LLVM clang和clang++编译代码
  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=${LLVM_LPU_DIR}/clang++ -DCMAKE_C_COMPILER=${LLVM_LPU_DIR}/clang \
  -DLLVM_TARGETS_TO_BUILD=LPU \
  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=LPU \
  -DLLVM_OPTIMIZED_TABLEGEN=On  \
  -DLLVM_PARALLEL_COMPILE_JOBS=16 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
  time ninja
#  -G "Unix Makefiles" ../llvm
#  time make -j4
  #popd vscode not support 'popd' command
else #如果存在lpu文件夹
  echo  -e "\033[1;32;37m ${LLVM_LPU_DIR} has existed already \033[0m"
  # 如果build目录不存在就创建
  if [ ! -d ${LLVM_LPU_DIR}/build ];then
    mkdir -p ${LLVM_LPU_DIR}/build
  fi

  cd ${LLVM_LPU_DIR}/build
  # 判断build.ninja文件是否存在
  if [ -e build.ninja ]; then
    echo -e "\033[1;32 build.ninja file exist, perform incremental compilation... \033[0m"
    cd ${LLVM_LPU_DIR}
    cd ${LLVM_LPU_DIR}/build
    time ninja
  else # 如果文件不存在
    echo -e "\033[1;31 build.ninja file not exist, make reconfiguration... \033[0m"
    cd ${LLVM_LPU_DIR}
    rm -rvf clang
    rm -rvf clang++
    rm -rvf llvm
    ln -s ${LLVM_PROJECT_DIR}/clang clang
    ln -s ${LLVM_PROJECT_DIR}/clang++ clang++
    ln -s ${LLVM_PROJECT_DIR}/../../llvm llvm
    cd -
    # popd vscode not support 'popd' command
    cp -rf ${ROOT_DIR}/llvm/modify_lpu/llvm/* ${LLVM_LPU_DIR}/llvm/.
    rm -rf ${LLVM_LPU_DIR}/llvm/lib/Target/LPU
    cp -rf ${ROOT_DIR}/chapters/LPU/${to_learn_lpu_stage}/* ${LLVM_LPU_DIR}/llvm/lib/Target/.
    mkdir -p ${LLVM_LPU_DIR}/build
    cd ${LLVM_LPU_DIR}/build
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=${LLVM_LPU_DIR}/clang++ -DCMAKE_C_COMPILER=${LLVM_LPU_DIR}/clang \
    -DLLVM_TARGETS_TO_BUILD=LPU \
    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=LPU \
    -DLLVM_OPTIMIZED_TABLEGEN=On  \
    -DLLVM_PARALLEL_COMPILE_JOBS=16 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
  time ninja
  fi
fi
