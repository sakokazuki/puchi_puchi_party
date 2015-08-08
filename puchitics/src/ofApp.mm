#include "ofApp.h"

#include "opening.h"
#include "home.h"
#include "Egg.h"


//--------------------------------------------------------------
void ofApp::setup(){
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofSetCircleResolution(64);
    stateMachine.getSharedData().sharedInt = 100;
    
    stateMachine.addState<opening>();
    stateMachine.addState<home>();
    stateMachine.addState<Egg>();
    
    stateMachine.changeState("opening");
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
