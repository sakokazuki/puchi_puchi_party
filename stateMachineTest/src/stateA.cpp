#include "stateA.h"

//--------------------------------------------------------------
void stateA::setup(){
    
}

//--------------------------------------------------------------
void stateA::update(){
    
}

//--------------------------------------------------------------
void stateA::draw(){
    ofBackground(0,0,0);
    ofSetColor(255, 0, 0);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 100);
}

//--------------------------------------------------------------

    
string stateA::getName(){
    return "stateA";
}