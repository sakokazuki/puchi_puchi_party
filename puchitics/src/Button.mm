#include "Button.h"

Button::Button(){
    ofSetRectMode(OF_RECTMODE_CENTER);
    bHover = false;
    hoverWidth = 8;
    
}

void Button::setup(ofVec2f p, int w, int h, ofColor col, ofColor hoverCol, int _no, string _shape){
    pos = p;
    width = w;
    height = h;
    color = col;
    hoverColor = hoverCol;
    no = _no;
    shape = _shape;
}


void Button::draw(){
    ofSetColor(color);
    if (shape == "rect"){
        if (bHover) {
            ofSetColor(hoverColor);
            ofRect(pos, width+hoverWidth, height+hoverWidth);
        }
        
        ofSetColor(color);
        ofRect(pos, width, height);
    }
    
    if (shape == "circle") {
        if (bHover) {
            ofSetColor(hoverColor);
            ofEllipse(pos, width+hoverWidth, height+hoverWidth);
        }
        
        ofSetColor(color);
        ofEllipse(pos, width, height);
        ofSetColor(0);
        ofDrawBitmapString(ofToString(no), pos.x, pos.y+20);
    }
    
}


void Button::fireEvent(ofVec2f touch){
    if (shape == "rect") {
        if (touch.x > pos.x-width/2 && touch.x < pos.x+width/2 && touch.y > pos.y-height/2 && touch.y < pos.y+height/2) {
            ofNotifyEvent(event, no);
            bHover = true;
        }
    }
    
    
    if (shape == "circle"){
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            ofNotifyEvent(event, no);
            bHover = true;
        }
    }
    
}

void Button::touchUpEvent(ofVec2f touch){
    
    if (shape == "rect") {
        if (touch.x > pos.x-width/2 && touch.x < pos.x+width/2 && touch.y > pos.y-height/2 && touch.y < pos.y+height/2) {
            ofNotifyEvent(event, no);
            bHover = false;
        }
    }
    
    
    if (shape == "circle"){
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            ofNotifyEvent(event, no);
            bHover = false;
        }
    }
}




