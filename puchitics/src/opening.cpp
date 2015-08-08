#include "opening.h"

//--------------------------------------------------------------
void opening::setup(){
    hoge = 100;
    
    
}

//--------------------------------------------------------------
void opening::update(){
    
}

//--------------------------------------------------------------
void opening::draw(){
    ofBackground(255,255,255);
    ofSetColor(255, 0, 0);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 100);
    
    ofSetColor(30);
    ofDrawBitmapString("opening", 20, 20);
}

//--------------------------------------------------------------

void opening::touchDown(ofTouchEventArgs &touch){
    changeState("home");
    
}



string opening::getName(){
    return "opening";
}
