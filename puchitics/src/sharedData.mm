
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
    if (val == 6) {
        movieName = "egg.mov";
        stopPoint = 93;
        
        movieChoose(ofVec2f(1068, 352));
        
    }else if(val == 11){
        movieName = "tomato.mp4";
        stopPoint = 35;
        
        movieChoose(ofVec2f(884, 296));
        
    }else{
        randomMovieChoose();
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

void sharedData::movieChoose(ofVec2f p){
    bStopPoint = true;
    touchPoint = ofVec2f(p.x/1920.0*(ofGetWidth()+magnifySize.x)-magnifySize.x/2,
                         p.y/1080.0*(ofGetHeight()+magnifySize.y)-magnifySize.y/2);
    int nearly = searchNearlyBtn(touchPoint);
    trgBtnNo = nearly;
    cout  << "nearybtn :" << nearly << endl;
    movieTrans = button[nearly].pos - touchPoint;
    if (nearly == -1) {
        randomMovieChoose();
    }
}

void sharedData::randomMovieChoose(){
    bStopPoint = false;
    
    movieTrans = ofVec2f(0, 0);
    movieName = "purin.mp4";
}


int sharedData::searchNearlyBtn(ofVec2f trg){
    float min = (trg-button[0].pos).length();
    int btnNo = 0;
    for (int i=1; i<button.size(); i++) {
        if (!button[i].bTouched) {
            float tmp = (trg-button[i].pos).length();
            if (tmp < min) {
                min = tmp;
                btnNo = i;
            }
        }
    }
    
    if (abs(trg.x - button[btnNo].pos.x) < magnifySize.x/2 && abs(trg.y - button[btnNo].pos.y) < magnifySize.y/2) {
        return btnNo;
    }else{
        return -1;
    }
}










