
#include "sharedData.h"

void sharedData::btnSetup(){
    cout << "btnset" << endl;
    btnSize = 118;
    btnSpaceX = 23;
    btnSpaceY = 5;
    btnBeginPoint = ofVec2f(75, 75);
    colmn = 5;
    row = 10;
    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            ofVec2f tmp = ofVec2f(i*(btnSize+btnSpaceX)+btnBeginPoint.x, j*(btnSize+btnSpaceY)+btnBeginPoint.y);
            if (j%2==1) {
                tmp -= ofVec2f((btnSize+btnSpaceX)/2, 0);
            }
            btnPos.push_back(tmp);
        }
    }
    
    for (int i=0; i<btnPos.size(); i++) {
        Button btn;
        button.push_back(btn);
        ofVec2f p = btnPos[i];
        int w = btnSize;
        int h = btnSize;
        button[i].setup(p, w, h, i);
    }
    for (int i=0; i<button.size(); i++) {
//        ofAddListener(button[i].downEvent, this, &sharedData::touchDownEventCallback);
//        ofAddListener(button[i].upEvent, this, &sharedData::touchUpEventCallback);
        
        ofAddListener(button[i].downEvents[0], this, &sharedData::touchDownEventCbOp);
        ofAddListener(button[i].upEvents[0], this, &sharedData::touchUpEventCbOp);
        ofAddListener(button[i].downEvents[1], this, &sharedData::touchDownEventCbHome);
        ofAddListener(button[i].upEvents[1], this, &sharedData::touchUpEventCbHome);
        ofAddListener(button[i].downEvents[2], this, &sharedData::touchDownEventCbMv);
        ofAddListener(button[i].upEvents[2], this, &sharedData::touchUpEventCbMv);

    }
}

void sharedData::touchDownEventCallback(int &val){
    cout << "sharedData touchDown: " << val << endl;
    bHoverButton = true;
}

void sharedData::touchUpEventCallback(int &val){
    cout << "sharedData touchUp: " << val << endl;
    bHoverButton = false;
}


void sharedData::touchDownEventCbOp(int &val){
    cout << "sharedData(op) touchDown: " << val << endl;
    bHoverButton = true;
}

void sharedData::touchUpEventCbOp(int &val){
    cout << "sharedData(op) touchUp: " << val << endl;
    bHoverButton = false;
}

void sharedData::touchDownEventCbHome(int &val){
    cout << "sharedData(home) touchDown: " << val << endl;
    startMovie = true;
    if (val == 1) {
        movieName = "egg.mov";
        stopPoint = 93;
        bStopPoint = true;
        touchPoint = ofVec2f(610, 200);
        trgBtnNo = 16;
    }else if(val == 6){
        movieName = "tomato.mp4";
        stopPoint = 35;
        bStopPoint = true;
        touchPoint = ofVec2f(560, 180);
    }else{
        movieName = "purin.mp4";
        bStopPoint = false;
    }
    bHoverButton = true;
    targetBtnNo = val;

}

void sharedData::touchUpEventCbHome(int &val){
    cout << "sharedData(home) touchUp: " << val << endl;
    bHoverButton = false;
}


void sharedData::touchDownEventCbMv(int &val){
    cout << "sharedData(mv) touchDown: " << val << endl;
    bHoverButton = true;
}

void sharedData::touchUpEventCbMv(int &val){
    cout << "sharedData(mv) touchUp: " << val << endl;
    bHoverButton = false;
}










