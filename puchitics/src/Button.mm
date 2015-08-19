#include "Button.h"

Button::Button(){
    ofSetRectMode(OF_RECTMODE_CENTER);
    bHover = false;
    bTouched = false;
    hoverWidth = 8;
    
    for (int i=0; i<2; i++) {
        ofEvent<int> tmp;
        upEvents.push_back(tmp);
        downEvents.push_back(tmp);
    }
    
}

void Button::setup(ofVec2f p, int w, int h, int _no){
    pos = p;
    width = w;
    height = h;
    no = _no;
}


void Button::draw(){
    if (bHover && !bTouched) {
        ofSetColor(0, 90, 120);
        ofEllipse(pos, width+hoverWidth, height+hoverWidth);
    }
    
    ofSetColor(231, 255, 67);
    if (bTouched) {
        ofSetColor(0, 160, 200);
    }
    ofEllipse(pos, width, height);
    ofSetColor(0);
    ofDrawBitmapString(ofToString(no), pos.x, pos.y+20);
    
}


void Button::touchDownEvent(int scene){
    ofNotifyEvent(downEvent, no);
    for (int i=0; i<3; i++) {
        if (i == scene) {
            if (!bTouched) {
                ofNotifyEvent(downEvents[i], no);
            }
            
        }
    }
    bHover = true;

}

void Button::touchUpEvent(int scene){
    ofNotifyEvent(upEvent, no);
    for (int i=0; i<3; i++) {
        if (i == scene) {
            if (!bTouched) {
                ofNotifyEvent(upEvents[i], no);
            }
            
        }
    }
    bHover = false;
}




