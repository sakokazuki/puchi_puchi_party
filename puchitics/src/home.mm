#include "home.h"

//--------------------------------------------------------------
void home::setup(){
    btnSize = 118;
    btnSpace = 30;
    colmn = 5;
    row = 10;
    bHoverButton = false;
    img.loadImage("select.png");
    
    homeUnderTextFont.loadFont("fonts/ヒラギノ角ゴ Pro W6.otf", 30, true, true);
    homeUnderTextFont.setLetterSpacing(0.9);
    homeUnderText = "好きなところをプチプチしてね！";
    underTextAlpha = 0;
    bFirstLabel = false;
    bComplete = false;
    completeText[0] = "ぷちぷちが全部つぶれた！";
    completeText[1] = "ぷちぷちマスター";
    
    
    ofAddListener(uTTween.end_E, this, &home::uTTweenCb);


  
    
}

//--------------------------------------------------------------
void home::update(){
    if (getSharedData().startHome) {
        
        getSharedData().startHome = false;
        twn.clear();
        for (int i=0; i<getSharedData().button.size(); i++) {
            ofxTween tmpTwn;
            twn.push_back(tmpTwn);
            int randomDelay = (int)ofRandom(100, 300);
            twn[i].setParameters(0, easing_circ, ofxTween::easeOut, 0, 118, 500, randomDelay);
        }
        ofSetRectMode(OF_RECTMODE_CENTER);
        uTTween.setParameters(0, easing_circ, ofxTween::easeOut, 0, 255, 500, 600);
        
        bool bCompTmp = true;
        for (int i=0; i<getSharedData().button.size(); i++) {
            if (!getSharedData().button[i].bTouched) {
                bCompTmp = false;
            }
        }
        bComplete = bCompTmp;
        
        
    }
    
    for (int i=0; i<twn.size(); i++) {
        twn[i].update();
    }
    uTTween.update();
//    underTextAlpha = uTTween.update();
    
    
    
    if (getSharedData().bPuchi) {
        if (getSharedData().bHoverButton) {
            changeState("MovieScene");
            getSharedData().bHoverButton = false;
            
            int trgNo = getSharedData().targetBtnNo;
            getSharedData().button[trgNo].touchUpEvent(1);
            getSharedData().button[trgNo].bTouched = true;
            
            if (!bFirstLabel) {
                bFirstLabel = true;
            }
        }
        getSharedData().bPuchi = false;
    }
    
    
    
}

//--------------------------------------------------------------
void home::draw(){
    
    ofBackground(60, 220, 250);
    if (twn.size() != 0 && !getSharedData().startHome) {
        for (int i=0; i<getSharedData().button.size(); i++) {
            getSharedData().button[i].width = twn[i].getTarget(0);
            getSharedData().button[i].height = twn[i].getTarget(0);
            getSharedData().button[i].draw();
            
        }
        
        underTextAlpha = uTTween.getTarget(0);
        
        if (bComplete) {
            ofSetColor(0, 90, 120, underTextAlpha);
            ofRectRounded(ofGetWidth()/2, ofGetHeight()/2, 500, 150, 75);
            ofSetColor(231, 255, 67, underTextAlpha);
            float w = homeUnderTextFont.stringWidth(completeText[0]);
            homeUnderTextFont.drawString(completeText[0], ofGetWidth()/2-w/2, ofGetHeight()/2-10);
            w = homeUnderTextFont.stringWidth(completeText[1]);
            homeUnderTextFont.drawString(completeText[1], ofGetWidth()/2-w/2, ofGetHeight()/2+40);
        }else{
            if (!bFirstLabel) {
                ofSetColor(0, 90, 120, underTextAlpha);
                ofRectRounded(ofGetWidth()/2, 9*ofGetHeight()/10, 600, 80, 40);
                ofSetColor(231, 255, 67, underTextAlpha);
                float w = homeUnderTextFont.stringWidth(homeUnderText);
                homeUnderTextFont.drawString(homeUnderText, ofGetWidth()/2-w/2, 9*ofGetHeight()/10+14);
            }
            
        }
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

void home::uTTweenCb(int &e){
    if (!bComplete) {
        switch (e) {
            case 0:
                uTTween.setParameters(1, easing_circ, ofxTween::easeOut, 255, 0, 500, 2000);
                break;
            default:
                break;
        }
    }
    
}

string home::getName(){
    return "home";
}
