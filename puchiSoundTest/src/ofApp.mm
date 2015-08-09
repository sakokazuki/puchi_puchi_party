#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetVerticalSync(true);
    ofBackground(0, 0, 0);
    ofSetFrameRate(60);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    
//    soundStream.setup(this, 0, 2, 44100, BUFFER_SIZE, 4);
    
   
    
    ofSoundStreamSetup(0, 1, this, 44100, BUFFER_SIZE, 1);
    
    _buffer = new float[BUFFER_SIZE];
    
    flag = false;
    amountFlag = false;
    touchFlag = true;
    

}

//--------------------------------------------------------------
void ofApp::update(){
    if (touchFlag) {
        
        //波を平滑化してtmpBufferに補完
        for (int i=0; i<BUFFER_SIZE; i++) {
            if (i<BUFFER_SIZE-4) {
                if (i<BUFFER_SIZE-4) {
                    _tmpBuffer[i] = (abs(_buffer[i])+abs(_buffer[i+1])+abs(_buffer[i+2])+abs(_buffer[i+3])+abs(_buffer[i+4]))/5;
                    
                }else{
                    _tmpBuffer[i] = abs(_buffer[i]);
                }
            }
        }
        
        //flag:変化量
        for (int i=1; i<BUFFER_SIZE-4; i++) {
            if (_tmpBuffer[i]-_tmpBuffer[i-1] > 0.08) {
                cout << "val    " << i << " : " << _tmpBuffer[i]-_tmpBuffer[i-1] << endl;
                flag = true;
            }
        }
        
        //flag:音量
        
        for (int i=0; i<BUFFER_SIZE; i++) {
//            cout << "amount " << i << " : " << abs(_buffer[i]) << endl;
            if (abs(_buffer[i]) > 0.4) {
                cout << "amount " << i << " : " << abs(_buffer[i]) << endl;
                amountFlag = true;
            }
        }
        
        //保存する波はtmpBufferからsaveBufferへ
        if (flag || amountFlag) {
            for (int i=0; i<BUFFER_SIZE; i++) {
                _saveBuffer[i] = _tmpBuffer[i];
            }
        }

    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(0);
    
    if (touchFlag) {
        ofSetColor(255);
        
        //今の音の波形
        float y1 = ofGetHeight() * 0.5;
        ofLine(0, y1, ofGetWidth(), y1);
//        for(int i=0; i<BUFFER_SIZE; i++){
//            float p = i / (float)(BUFFER_SIZE-1);
//            float x = p * ofGetWidth();
//            float y2 = y1 + _buffer[i] * 200;
//            ofLine(x, y1, x, y2);
//        }
        
        //反応した時の波形(saveBuffer)
        for(int i=1; i<BUFFER_SIZE; i++){
            float p = i / (float)(BUFFER_SIZE-1);
            float x = p * ofGetWidth();
            float y2 = y1 + _saveBuffer[i] * 200 * -1;
            ofSetColor(255, 255, 0);
            ofLine(x, y1, x, y2);
            if (i%50 == 0) {
                ofSetColor(255);
                ofLine(x, 0, x, ofGetWidth());
                ofDrawBitmapString(ofToString(i), x+3, 10);
            }
            
        }
        
        if (flag || amountFlag) {
            cout << "--------------" << endl;
        }
        
        flag = false;
        amountFlag = false;
    
    }
    
}

//--------------------------------------------------------------
void ofApp::exit(){

}

void ofApp::audioIn(float *input, int bufferSize, int nChannels){
    if (touchFlag) {
        int minBufferSize = MIN(BUFFER_SIZE, bufferSize);
        for (int i=0; i<minBufferSize; i++) {
            _buffer[i]  = input[i];
        }
    }
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    touchFlag = true;

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
