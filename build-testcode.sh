#!/bin/bash
###
 # @Author: Liangnus
 # @Date: 2024-03-19 05:43:16
 # @LastEditTime: 2024-03-19 22:45:22
 # @LastEditors: Liangnus
 # @Description: 编译测试代码脚本
 # @FilePath: /llvm-cpu0/build-testcode.sh
###

# 检查用户是否提供了测试代码文件
if [ $# -eq 0 ]; then
    echo "\033[1;45m 请提供测试代码文件 \033[4m"
    exit 1
fi

# 提取用户提供的文件名
test_file="$1"

# 检查文件是否存在
if [ ! -f "$test_file" ]; then
    echo "\033[1;45m 文件 $test_file 不存在 \033[4m"
    exit 1
fi

# 使用clang/clang++编译
# 使用shell参数扩展功能获取文件后缀部分和文件名
CLANG=$(pwd)/tutorial/llvm-project/build/bin/clang
CLANG_PLUSPLUS=$(pwd)/tutorial/llvm-project/build/bin/clang
file_extension=${test_file##*.}
file_name_without_extension=${test_file%.*}
subffix=".ll"

if [ "${file_extension}" = "c" ]; then
    ${CLANG} -O2 -S "$test_file" -emit-llvm -o "$file_name_without_extension$subffix"
    echo "\033[1;32m LLVM汇编生成成功！ $file_name_without_extension$subffix \033[4m"
fi

if [ "${file_extension}" = "cpp" ]; then
     ${CLANG_PLUSPLUS} -O2 -S "$test_file" -emit-llvm -o "$file_name_without_extension$subffix"
     echo "\033[1;32m LLVM汇编生成成功！ $file_name_without_extension$subffix \033[4m"
fi

if [ "$file_extension" != "c" ] && [ "$file_extension" != "cpp" ]; then
    echo "\033[1;31m $test_file后缀文件不支持Cpu0编译！ \033[4m"
    exit 1
fi
