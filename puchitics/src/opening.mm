#include "opening.h"


//--------------------------------------------------------------
void opening::setup(){
    ofAddListener(button.event, this, &opening::callback);
    ofAddListener(button.event, this, &opening::touchUpEventCallback);
    button.setup(ofVec2f(ofGetHeight()/2, ofGetWidth()/2), 118, 118, ofColor(231, 255, 67), ofColor(0, 90, 120), 0, "circle");
    
    ofSetRectMode(OF_RECTMODE_CENTER);
    bHoverButton = false;
}

//--------------------------------------------------------------
void opening::update(){
//    cout << bHoverButton << endl;
    if (getSharedData().bPuchi) {
        cout << bHoverButton << endl;
        if (bHoverButton) {
            changeState("home");
        }
        getSharedData().bPuchi = false;
    }
    

}

//--------------------------------------------------------------
void opening::draw(){
    
    ofBackground(60,220,250);

    
    button.draw();
    
}

//--------------------------------------------------------------

void opening::touchDown(ofTouchEventArgs &touch){

    ofVec2f touchPoint = ofVec2f(touch.x, touch.y);    
    button.fireEvent(touchPoint);
    
    
    
}

void opening::touchUp(ofTouchEventArgs &touch){
    ofVec2f touchPoint = ofVec2f(touch.x, touch.y);
    button.touchUpEvent(touchPoint);
    
}

void opening::callback(int &val){
//    changeState("home");
    bHoverButton = true;
    cout << "touch" << endl;
}

void opening::touchUpEventCallback(int &val){
    bHoverButton = false;
    cout << "touchup" << endl;
    
    
}




string opening::getName(){
    return "opening";
}
