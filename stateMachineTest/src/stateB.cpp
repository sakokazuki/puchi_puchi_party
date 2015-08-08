#include "stateB.h"

//--------------------------------------------------------------
void stateB::setup(){
    
}

//--------------------------------------------------------------
void stateB::update(){
    
}

//--------------------------------------------------------------
void stateB::draw(){
    ofBackground(0,0,0);
    ofSetColor(0, 255, 0);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 100);
}

//--------------------------------------------------------------


string stateB::getName(){
    return "stateB";
}