#include "opening.h"


//--------------------------------------------------------------
void opening::setup(){
    getSharedData().btnSetup();    
    startPoint = ofVec2f(ofGetHeight()/2, 3*ofGetWidth()/4);
    
    float len = (getSharedData().button[0].pos - startPoint).length();
    for (int i=1; i<getSharedData().button.size(); i++) {
        float tmp = (getSharedData().button[i].pos - startPoint).length();
        if (tmp < len) {
            opBtnNo = i;
            len = tmp;
        }
        cout << i << ": "<< (getSharedData().button[i].pos - startPoint) << " : " << tmp << endl;
    }
}

//--------------------------------------------------------------
void opening::update(){
    if (getSharedData().bPuchi) {
        if (getSharedData().bHoverButton) {
            changeState("home");
            getSharedData().button[opBtnNo].bTouched = true;
            getSharedData().bHoverButton = false;
        }
        getSharedData().bPuchi = false;
    }
    
    

}

//--------------------------------------------------------------
void opening::draw(){
    
    ofBackground(60,220,250);
    

    
    getSharedData().button[opBtnNo].draw();
    

    
}

//--------------------------------------------------------------

void opening::touchDown(ofTouchEventArgs &touch){
    ofVec2f pos = getSharedData().button[opBtnNo].pos;
    int width = getSharedData().button[opBtnNo].width;
    if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
        getSharedData().button[opBtnNo].touchDownEvent(0);
    }
}

void opening::touchUp(ofTouchEventArgs &touch){
    ofVec2f pos = getSharedData().button[opBtnNo].pos;
    int width = getSharedData().button[opBtnNo].width;
    if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
        getSharedData().button[opBtnNo].touchUpEvent(0);
    }
}


string opening::getName(){
    return "opening";
}
