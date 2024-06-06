/*
 * @Author: Liangxijun-1001 lxjqq365@126.com
 * @Date: 2024-03-18 09:53:32
 * @LastEditors: Liangxijun-1001 lxjqq365@126.com
 * @LastEditTime: 2024-03-18 09:53:41
 * @FilePath: /llvm-cpu0/input/lxj.cpp
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// int div(int a, int b){
//   return a/b;
// }
// unsigned int MUL(unsigned long long int x, unsigned int y)
// {
//     return x * y;
// }
int main(int argc, char **argv) {
  int i, j, k, t = 0;
  for(i = 0; i < 10; i++) {
    for(j = 0; j < 10; j++) {
      for(k = 0; k < 10; k++) {
        t++;
      }
    }
    for(j = 0; j < 10; j++) {
      t++;
    }
  }
  for(i = 0; i < 20; i++) {
    for(j = 0; j < 20; j++) {
      t++;
    }
    for(j = 0; j < 20; j++) {
      t++;
    }
  }
  return t;
}