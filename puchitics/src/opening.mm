#include "opening.h"


//--------------------------------------------------------------
void opening::setup(){
    getSharedData().btnSetup();    
    ofSetRectMode(OF_RECTMODE_CENTER);
}

//--------------------------------------------------------------
void opening::update(){
    if (getSharedData().bPuchi) {
        if (getSharedData().bHoverButton) {
            changeState("home");
            getSharedData().button[18].bTouched = true;
            getSharedData().bHoverButton = false;
        }
        getSharedData().bPuchi = false;
    }
    

}

//--------------------------------------------------------------
void opening::draw(){
    
    ofBackground(60,220,250);

    
    getSharedData().button[18].draw();
    
}

//--------------------------------------------------------------

void opening::touchDown(ofTouchEventArgs &touch){
    getSharedData().button[18].touchDownEvent(0);
}

void opening::touchUp(ofTouchEventArgs &touch){
    getSharedData().button[18].touchUpEvent(0);
}


string opening::getName(){
    return "opening";
}
