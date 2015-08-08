#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(30);
    ofBackground(255, 255, 255);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofSetCircleResolution(32);
    ofEnableSmoothing();

    
    font.loadFont("Arial.ttf", 30, true, true);
    
    video0.loadMovie("egg.MOV");
    video1.loadMovie("video0.mov");
    video0.setLoopState(OF_LOOP_NONE);
    video1.setLoopState(OF_LOOP_NONE);
    play = false;
    eventFlag = false;
    selectedVideo = 0;
    
    player = &video0;
    player->play();
    
}

//--------------------------------------------------------------
void ofApp::update(){
    player->update();
    
    if (player->isFrameNew()) {
        if (player->getCurrentFrame() > 93 && !eventFlag) {
            eventFlag = true;
            play = true;
            player->setPaused(true);
        }
        
        
    }
    cout << player->getIsMovieDone() << endl;
    if (player->getIsMovieDone()) {
        eventFlag = false;
        player->setFrame(0);
        player->play();
    }
    
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(255, 255, 255);
    ofSetColor(255);
    
    
    player->getTexture()->draw(0, 0, ofGetWidth(), ofGetHeight());

    
    if (play && eventFlag) {
        ofSetColor(255, 0, 0);
        
        
        ofPushMatrix();
        ofTranslate(610, 200);
        font.drawString("touch!", -50, -60);
        ofEllipse(0, 0, 100, 100);
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
        if (touch.x > 610-50 && touch.x < 610+50 && touch.y > 200-50 && touch.y < 200+50) {
            play = false;
            player->setPaused(play);
        }
        
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
