
#include "sharedData.h"

void sharedData::btnSetup(){
    cout << "btnset" << endl;
    btnSize = 118;
    btnSpace = 30;
    colmn = 5;
    row = 10;
    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            ofVec2f tmp = ofVec2f(i*(btnSize+btnSpace), j*(btnSize+btnSpace));
            if (j%2==1) {
                tmp = ofVec2f(i*(btnSize+btnSpace)+(btnSize+btnSpace)/2, j*(btnSize+btnSpace));
            }
            btnPos.push_back(tmp);
        }
    }
}