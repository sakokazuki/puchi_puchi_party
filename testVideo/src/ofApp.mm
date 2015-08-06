#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(30);
    ofBackground(255, 255, 255);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);

    
    font.loadFont("Arial.ttf", 30, true, true);
    
    video0.loadMovie("egg.MOV");
    video1.loadMovie("video0.mov");
    video0.setLoopState(OF_LOOP_NORMAL);
    video1.setLoopState(OF_LOOP_NORMAL);
    play = false;
    eventFlag = false;
    selectedVideo = 0;
    
    player = &video0;
    player->play();
    
}

//--------------------------------------------------------------
void ofApp::update(){
    player->update();
    
    if (player->getCurrentFrame() > 93 && !eventFlag) {
        eventFlag = true;
        play = true;
        player->setPaused(true);
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(255, 255, 255);
    ofSetColor(255);
    
    
    player->getTexture()->draw(0, 0, ofGetWidth(), ofGetHeight());

    
    if (play && eventFlag) {
        ofSetColor(255, 0, 0);
        ofEllipse(449, 630, 100, 100);
        
        ofPushMatrix();
        ofTranslate(449+60, 600);
        ofRotateZ(90);
        font.drawString("touch!", 0, 0);
        ofPopMatrix();
        
        
    }

    
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    cout << touch << endl;
    if(eventFlag){
        play = false;
        player->setPaused(play);
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
