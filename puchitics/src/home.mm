#include "home.h"

//--------------------------------------------------------------
void home::setup(){
    btnSize = 118;
    btnSpace = 30;
    colmn = 5;
    row = 10;
    bHoverButton = false;
    img.loadImage("select.png");
    ofSetRectMode(OF_RECTMODE_CORNER);

    
  
    
}

//--------------------------------------------------------------
void home::update(){
    if (getSharedData().bPuchi) {
        if (getSharedData().bHoverButton) {
            changeState("MovieScene");
            getSharedData().bHoverButton = false;
            
            int trgNo = getSharedData().targetBtnNo;
            getSharedData().button[trgNo].touchUpEvent(1);
            getSharedData().button[trgNo].bTouched = true;
        }
        getSharedData().bPuchi = false;
    }
    
}

//--------------------------------------------------------------
void home::draw(){
    
    ofBackground(60, 220, 250);
    for (int i=0; i<getSharedData().button.size(); i++) {
        getSharedData().button[i].draw();
    }
    ofSetColor(255, 200);
//    img.draw(0, 0);
    
}

//--------------------------------------------------------------

void home::touchDown(ofTouchEventArgs &touch){

    for (int i=0; i<getSharedData().button.size(); i++) {
        ofVec2f pos = getSharedData().button[i].pos;
        int width = getSharedData().button[i].width;
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            getSharedData().button[i].touchDownEvent(1);
        }
    }
}

void home::touchUp(ofTouchEventArgs &touch){
    
    for (int i=0; i<getSharedData().button.size(); i++) {
        ofVec2f pos = getSharedData().button[i].pos;
        int width = getSharedData().button[i].width;
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            getSharedData().button[i].touchUpEvent(1);
        }
    }
    
}
//
//void home::callback(int &val){
//    cout << "homeCallback" << endl;
//    getSharedData().startMovie = true;
//    if (val == 1) {
//        getSharedData().movieName = "egg.mov";
//        getSharedData().stopPoint = 93;
//        getSharedData().bStopPoint = true;
//        getSharedData().touchPoint = ofVec2f(610, 200);
//        getSharedData().trgBtnNo = 16;
//    }else if(val == 6){
//        getSharedData().movieName = "tomato.mp4";
//        getSharedData().stopPoint = 35;
//        getSharedData().bStopPoint = true;
//        getSharedData().touchPoint = ofVec2f(560, 180);
//    }else{
//        getSharedData().movieName = "purin.mp4";
//        getSharedData().bStopPoint = false;
//    }
//    bHoverButton = true;
//    targetBtnNo = val;
//     
////    changeState("MovieScene");
//}
//
//void home::touchUpEventCallback(int &val){
//    bHoverButton = false;
//}



string home::getName(){
    return "home";
}
