#include "opening.h"


//--------------------------------------------------------------
void opening::setup(){
    ofAddListener(button.event, this, &opening::callback);
    button.setup(ofVec2f(ofGetHeight()/2, ofGetWidth()/2), 118, 118, ofColor(231, 255, 67), 0, "circle");
    
    ofSetRectMode(OF_RECTMODE_CENTER);
}

//--------------------------------------------------------------
void opening::update(){
    
}

//--------------------------------------------------------------
void opening::draw(){
    ofBackground(60,220,250);

    
    button.draw();
    
    ofSetColor(30);
    ofDrawBitmapString("opening", 20, 20);
}

//--------------------------------------------------------------

void opening::touchDown(ofTouchEventArgs &touch){

    ofVec2f touchPoint = ofVec2f(touch.x, touch.y);    
    button.fireEvent(touchPoint);
    
}

void opening::callback(int &val){
    changeState("home");
}




string opening::getName(){
    return "opening";
}
