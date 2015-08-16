#include "stateA.h"

//--------------------------------------------------------------
void stateA::setup(){
    twn.setParameters(0,easing_bounce, ofxTween::easeOut, 100, ofGetWidth()-100, 1000, 0);
    twn.setParameters(1,easing_bounce, ofxTween::easeOut, 100, ofGetWidth()-100, 500, 0);

    
}

//--------------------------------------------------------------
void stateA::update(){
    twn.update();
    
}

//--------------------------------------------------------------
void stateA::draw(){
    
    ofBackground(0,0,0);
    ofSetColor(255, 0, 0);
    ofCircle(ofGetWidth()/2, ofGetHeight()/2, 100);
    ofSetColor(255, 255, 0);
    ofCircle(twn.getTarget(0), ofGetHeight()/2, 50);
}

//--------------------------------------------------------------

    
string stateA::getName(){
    return "stateA";
}