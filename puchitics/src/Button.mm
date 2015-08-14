#include "Button.h"

Button::Button(){
    ofSetRectMode(OF_RECTMODE_CENTER);
    bHover = false;
    hoverWidth = 8;
    
}

void Button::setup(ofVec2f p, int w, int h, ofColor col, ofColor hoverCol, int _no){
    pos = p;
    width = w;
    height = h;
    color = col;
    hoverColor = hoverCol;
    no = _no;
}


void Button::draw(){
    ofSetColor(color);
    if (bHover) {
        ofSetColor(hoverColor);
        ofEllipse(pos, width+hoverWidth, height+hoverWidth);
    }
    
    ofSetColor(color);
    ofEllipse(pos, width, height);
    ofSetColor(0);
    ofDrawBitmapString(ofToString(no), pos.x, pos.y+20);
    
}


void Button::fireEvent(){

    ofNotifyEvent(event, no);
    bHover = true;

}

void Button::touchUpEvent(){
    ofNotifyEvent(event2, no);
    bHover = false;
}




