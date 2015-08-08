#include "ofApp.h"

#include "stateA.h"
#include "stateB.h"
//#include "stateC.h"

//--------------------------------------------------------------
void ofApp::setup(){
    stateMachine.addState<stateA>();
    stateMachine.addState<stateB>();
    stateMachine.changeState("stateA");

    
    scene = false;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    scene = !scene;
    if (scene) {
        stateMachine.changeState("stateB");
    }else{
        stateMachine.changeState("stateA");
    }

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
//
//</statec>
//</stateb>
//</statea>






