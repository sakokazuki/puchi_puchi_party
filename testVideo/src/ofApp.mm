#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(30);
    ofBackground(255, 255, 255);
    
    video0.loadMovie("video0.mov");
    video1.loadMovie("video1.mov");
    video0.setLoopState(OF_LOOP_NORMAL);
    video1.setLoopState(OF_LOOP_NORMAL);
    play = false;
    selectedVideo = 0;
    
    player = &video0;
    player->play();
    
}

//--------------------------------------------------------------
void ofApp::update(){
    player->update();
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(255, 255, 255);
    player->getTexture()->draw(0, 0);
    
    
    
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    if (play) {
        play = false;
    }else{
        play = true;
        
        if (selectedVideo == 0) {
            player = &video0;
            video0.play();
            video1.setPaused(true);
            selectedVideo = 1;
        }else{
            player = &video1;
            video1.play();
            video0.setPaused(true);
            selectedVideo = 0;
        }
    }
    player->setPaused(play);
    
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
