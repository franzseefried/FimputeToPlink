#include "rplcString.h"
#include <string>
#include <algorithm>
#include <iostream>
using namespace std;

replaceString::replaceString()
{
}
replaceString::~replaceString()
{
}


std::string replaceString::recodeGenotypes(std::string s)
{
  //Loop over all possible genotype calls
  int gtc=0;
  while (gtc < 10)
  {
    string replacedString;
        
        if      (gtc==0){
          replacedString=("A A ");
        }
        else if (gtc==1){
          replacedString=("A B ");
        }
        else if (gtc==2){
          replacedString=("B B ");
        }
        else            {
          replacedString=("Z Z ");
        }
         
        
        //convert int to string
        std::string sti = std::to_string(gtc);
        string stringToReplace(sti);
        
        int pos = s.find(stringToReplace);
        //cout <<pos<<" "<<string::npos<<endl; 
        
        while(pos != string::npos)
        {
          //Erase the targeted string at the location we set
          s.erase(pos,stringToReplace.length());
          //Insert the new string where we last deleted the old string
          s.insert(pos,replacedString);
          //Get position of targeted string to erase
          pos = s.find(stringToReplace);
        }
         
        ++gtc;
  }

   return s;

}


