#include "opening.h"


//--------------------------------------------------------------
void opening::setup(){
    getSharedData().btnSetup();    
    startPoint = ofVec2f(ofGetHeight()/2, 3*ofGetWidth()/4);
    
    logoImg.loadImage("images/start-logo.png");
    
    float len = (getSharedData().button[0].pos - startPoint).length();
    for (int i=1; i<getSharedData().button.size(); i++) {
        float tmp = (getSharedData().button[i].pos - startPoint).length();
        if (tmp < len) {
            opBtnNo = i;
            len = tmp;
        }
    }
    
    bEndOpening = true;
    
    opUnderTextFont.loadFont("fonts/ヒラギノ角ゴ Pro W6.otf", 26, true, true);
    opUnderTextFont.setLetterSpacing(0.9);
    opUnderText = "はじめる";
    ofSetRectMode(OF_RECTMODE_CENTER);
    
    ofAddListener(endCircleTween.end_E, this, &opening::circleEndCb);
    
    testImg.loadImage("images/test.png");
    
    
}

//--------------------------------------------------------------
void opening::update(){
    if (getSharedData().bPuchi) {
        if (getSharedData().bHoverButton) {
            changeStateFunc();
        }
        getSharedData().bPuchi = false;
    }
    
    if (bEndOpening) {
        for (int i=0; i<3; i++) {
             circleCol[i].update();
        }
        endCircleTween.update();
    }
    

}

//--------------------------------------------------------------
void opening::draw(){
    
    ofBackground(60,220,250);
    for (int i=0; i<getSharedData().button.size(); i++) {
        ofSetColor(94, 227, 213, 255);
        if (i != opBtnNo) {
            ofEllipse(getSharedData().button[i].pos, 118, 118);
        }
    }
    
    ofSetColor(0, 90, 120);
    ofRect(ofGetWidth()/2, 8*ofGetHeight()/9, 180, 60);
    ofSetColor(231, 255, 67);
    float w = opUnderTextFont.stringWidth(opUnderText);
    opUnderTextFont.drawString(opUnderText, ofGetWidth()/2-w/2, 8*ofGetHeight()/9+14);
    
    getSharedData().button[opBtnNo].draw();
    
    ofSetColor(255);
    logoImg.draw(ofGetWidth()/2, ofGetHeight()/2-80);
  
    
    if (bEndOpening) {
        ofSetColor(circleCol[0].getTarget(0), circleCol[1].getTarget(0), circleCol[2].getTarget(0));
        ofEllipse(getSharedData().button[opBtnNo].pos, endCircleTween.getTarget(0), endCircleTween.getTarget(0));
    }
    
    ofSetColor(255);
    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);
    
//    testImg.draw(ofGetWidth()/2, ofGetHeight() /2);
    
    ofEnableBlendMode(OF_BLENDMODE_ALPHA);
    
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


void opening::touchDoubleTap(ofTouchEventArgs &touch){
    changeStateFunc();

}

void opening::changeStateFunc(){
    bEndOpening = true;
    getSharedData().sePlay();
    endCircleTween.setParameters(0, easing_circ, ofxTween::easeOut, 118, 1500, 800, 0);
    int beforeColor[3] =  {231, 255, 67};
    int afterColor[3] =  {60, 220, 250};
    for (int i=0; i<3; i++) {
        circleCol[i].setParameters(0, easing_circ, ofxTween::easeOut, beforeColor[i], afterColor[i], 800, 0);
    }
}

void opening::circleEndCb(int &e){
    changeState("home");
    getSharedData().startHome = true;
    getSharedData().button[opBtnNo].bTouched = true;
    getSharedData().bHoverButton = false;
}


string opening::getName(){
    return "opening";
}
