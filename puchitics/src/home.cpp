#include "home.h"

//--------------------------------------------------------------
void home::setup(){

    
}

//--------------------------------------------------------------
void home::update(){
    
}

//--------------------------------------------------------------
void home::draw(){
    ofBackground(255, 255, 255);
    ofSetColor(255, 255, 0);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 100);
    
    ofSetColor(30);
    ofDrawBitmapString("home", 20, 20);
}

//--------------------------------------------------------------

void home::touchDown(ofTouchEventArgs &touch){
    
}

string home::getName(){
    return "home";
}
