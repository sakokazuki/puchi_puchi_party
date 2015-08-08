//
//  Button.cpp
//  puchitics
//
//  Created by sako on 2015/08/08.
//
//

#include "Button.h"

Button::Button(){
    
}

void Button::setup(ofVec2f p, int w, int h, ofColor col, int _no, string _shape){
    pos = p;
    width = w;
    height = h;
    color = col;
    no = _no;
    shape = _shape;
}


void Button::draw(){
    ofSetColor(color);
    if (shape == "rect"){
        ofRect(pos, width, height);
    }
    
    if (shape == "circle") {
        ofEllipse(pos, width, height);
        ofSetColor(0);
        ofDrawBitmapString(ofToString(no), pos.x, pos.y+20);
    }
    
}


void Button::fireEvent(ofVec2f touch){
    if (shape == "rect") {
        if (touch.x > pos.x-width/2 && touch.x < pos.x+width/2 && touch.y > pos.y-height/2 && touch.y < pos.y+height/2) {
            ofNotifyEvent(event, no);
        }
    }
    
    
    if (shape == "circle"){
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            ofNotifyEvent(event, no);
            cout << "notify: " << no << endl;
        }
    }
    
    
    
}