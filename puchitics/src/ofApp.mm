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
    _buffer2 = new float[BUFFER_SIZE];
    
    bgmPlayer.loadSound("sounds/puchi_bgm.mp3");
    bgmPlayer.setLoop(true);
    bgmPlayer.setVolume(0.2f);
    bgmPlayer.play();
}

//--------------------------------------------------------------
void ofApp::update(){
    if (stateMachine.getSharedData().bUseAudio) {
        if (flag1) {
            int zeroCount = 0;
            int tmpIndex = -1;
            flag3 = true;
            for (int i=0; i<BUFFER_SIZE; i+=50) {
                float sum = 0.0;
                for (int j=0; j<50; j++) {
                    
                    sum += abs(_buffer2[i+j]);
                    
                    
                    if (abs(_buffer2[i+j]) > 0.9) {
                        if (tmpIndex < 0) {
                            tmpIndex = i+j;
                            int diff = (i+j)-tmpIndex;
                            if (diff > 20) {
                                flag3 = false;
                                cout << "flag3" << endl;
                                
                            }
                        }
//                        cout << "dfkal:" << (i+j)-tmpIndex << endl;
                        
                        tmpIndex = i+j;
                        
                    }
                }
                
//                cout << "averagesum: " << i << " : " << sum/50 << endl;
                
                if (sum/50 < 0.08) {
                    zeroCount++;
                }
            }
            
            if (zeroCount > 10) {
                flag2 = true;
                cout << "zero num flag" << endl;
            }
            if (flag3) {
                cout << "wave flag" << endl;
            }
            flag1 = false;
        }
        
        
        if (flag2 && flag3) {
            for (int i=0; i<BUFFER_SIZE; i++) {
                tmpBuffer[i] = _buffer2[i];
                stateMachine.getSharedData().bPuchi = true;
            }
            bg = !bg;
            
        }
        flag2 = false;
        flag3 = false;
        
        volumeFlag = false;
        variationFlag = false;
    }

}

//--------------------------------------------------------------
void ofApp::draw(){
    if (stateMachine.getSharedData().bUseAudio && stateMachine.getSharedData().bSoundDebug) {
        if (bg) {
            ofBackground(0);
        }else{
            ofBackground(255);
        }
        
        ofSetColor(255);

        
        //今の音の波形
        float y1 = ofGetHeight() * 0.5;
        ofLine(0, y1, ofGetWidth(), y1);
        for(int i=0; i<BUFFER_SIZE; i++){
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + _buffer[i] * 200;
            if (bg) {
                ofSetColor(255);
            }else{
                ofSetColor(0);
            }
            if (_buffer[i]>=0.7) {
                ofSetColor(0, 0, 255);
            }
            ofLine(x, y1, x, y2);
            
            if (i%50 == 0) {
                if (bg) {
                    ofSetColor(255);
                }else{
                    ofSetColor(0);
                }
                ofLine(x, 0, x, ofGetWidth());
                ofDrawBitmapString(ofToString(i), x+3, 10);
            }
            for (int i=0; i<10; i++) {
                float h = ofGetHeight()/2 + 0.1*i*200;
                float h2 = ofGetHeight()/2 + 0.1*i*200*-1;
                ofLine(0, h, ofGetWidth(), h);
                ofLine(0, h2, ofGetWidth(), h2);
            }
        }
        
        for (int i=0; i<BUFFER_SIZE; i++) {
            ofSetColor(255, 0, 255);
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + _buffer2[i] * 200;
            if (abs(_buffer2[i])>0.1) {
                ofSetColor(0, 255, 0);
            }
            ofLine(x, y1, x, y2);
        }
        
        for(int i=1; i<BUFFER_SIZE; i++){
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + tmpBuffer[i] * 200 * -1;
            ofSetColor(255, 255, 0);
            ofLine(x, y1, x, y2);
            
        }

    }
    
	
}

void ofApp::audioIn(float *input, int bufferSize, int nChannels){
    int minBufferSize = MIN(BUFFER_SIZE, bufferSize);
    bool save = false;
    for (int i=0; i<minBufferSize; i++) {
        _buffer[i]  = input[i];
        if (input[i] >= 0.7) {
            save = true;
            
            flag1 = true;
            cout << i << endl;
        }
    }
    if (save) {
        for (int i=0; i<minBufferSize; i++) {
            _buffer2[i]  = input[i];
        }
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
