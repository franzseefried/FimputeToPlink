#include <Rcpp.h>
#include <iostream>
using namespace std;
#include "rplcString.h"

// [[Rcpp::export]]
std::string rplcString_main(std::string x) {
  replaceString rplc;
  return rplc.recodeGenotypes(x);
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
rplcString_main("12345678")
*/