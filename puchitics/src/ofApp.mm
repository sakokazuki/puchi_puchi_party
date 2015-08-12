#include "ofApp.h"

#include "opening.h"
#include "home.h"
#include "MovieScene.h"
#include "SoundDebug.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofSetCircleResolution(64);
    stateMachine.getSharedData().sharedInt = 100;
    
    stateMachine.addState<opening>();
    stateMachine.addState<home>();
    stateMachine.addState<MovieScene>();
    stateMachine.addState<SoundDebug>();
    
    stateMachine.changeState("opening");
    ofSoundStreamSetup(0, 1, this, 44100, BUFFER_SIZE, 1);
    
    _buffer = new float[BUFFER_SIZE];

}

//--------------------------------------------------------------
void ofApp::update(){
    if (stateMachine.getSharedData().bUseAudio) {
        //波を平滑化してtmpBufferに補完
        for (int i=0; i<BUFFER_SIZE; i++) {
            if (i<BUFFER_SIZE-4) {
                if (i<BUFFER_SIZE-4) {
                    tmpBuffer[i] = (abs(_buffer[i])+abs(_buffer[i+1])+abs(_buffer[i+2])+abs(_buffer[i+3])+abs(_buffer[i+4]))/5;
                    
                }else{
                    tmpBuffer[i] = abs(_buffer[i]);
                }
            }
        }
        
        //flag:変化量
        for (int i=1; i<BUFFER_SIZE-4; i++) {
            if (tmpBuffer[i]-tmpBuffer[i-1] > 0.08) {
                cout << "val    " << i << " : " << tmpBuffer[i]-tmpBuffer[i-1] << endl;
                variationFlag = true;
            }
        }
        
        //flag:音量
        for (int i=0; i<BUFFER_SIZE; i++) {
            //            cout << "amount " << i << " : " << abs(_buffer[i]) << endl;
            if (abs(_buffer[i]) > 0.4) {
                cout << "amount " << i << " : " << abs(_buffer[i]) << endl;
                volumeFlag = true;
            }
        }
        
        //保存する波はtmpBufferからsaveBufferへ
        if (variationFlag || volumeFlag) {
            for (int i=0; i<BUFFER_SIZE; i++) {
                saveBuffer[i] = tmpBuffer[i];
                stateMachine.getSharedData().bPuchi = true;
            }
        }
        
        volumeFlag = false;
        variationFlag = false;
    }

}

//--------------------------------------------------------------
void ofApp::draw(){
    if (stateMachine.getSharedData().bUseAudio && stateMachine.getSharedData().bSoundDebug) {
        ofBackground(0);
        ofSetColor(255);
        
        //今の音の波形
        float y1 = ofGetHeight() * 0.5;
        ofLine(0, y1, ofGetWidth(), y1);
        for(int i=0; i<BUFFER_SIZE; i++){
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + _buffer[i] * 200;
            ofLine(x, y1, x, y2);
        }
        
        //反応した時の波形(saveBuffer)
        for(int i=1; i<BUFFER_SIZE; i++){
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + saveBuffer[i] * 200 * -1;
            ofSetColor(255, 255, 0);
            ofLine(x, y1, x, y2);
            if (i%50 == 0) {
                ofSetColor(255);
                ofLine(x, 0, x, ofGetWidth());
                ofDrawBitmapString(ofToString(i), x+3, 10);
            }
            
        }

    }
    
	
}

void ofApp::audioIn(float *input, int bufferSize, int nChannels){
    int minBufferSize = MIN(BUFFER_SIZE, bufferSize);
    for (int i=0; i<minBufferSize; i++) {
        _buffer[i]  = input[i];
    }
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
