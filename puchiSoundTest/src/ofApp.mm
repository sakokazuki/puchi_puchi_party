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
    _subBuffer = new float[BUFFER_SIZE];
    

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    
    float avg_power = 0.0f;
    
    ofSetColor(255);
    
    _fft.powerSpectrum(0, (int)BUFFER_SIZE/2, _buffer, BUFFER_SIZE, &_magnitude[0], &_phase[0], &_power[0], &avg_power);
    
    float width = (float)ofGetWidth() / (float)(BUFFER_SIZE/2-1);
    for(int i = 1; i < (int)(BUFFER_SIZE); i++){
        ofSetColor(255);
        ofRect((i - 1)*width, ofGetHeight(), width, -(_magnitude[i] * 200.0));
    }
    
    
    for(int i = 0; i < BUFFER_SIZE; i++){
        float freq = 3000;
        float q    = 1.0;
        float omega = 2.0f * 3.14159265f *  freq / 44100;
        float alpha = sin(omega) / (2.0f * q);
        float in1, in2, out1, out2;
        
        //        float a0 =  1.0f + alpha;
        //        float a1 = -2.0f * cos(omega);
        //        float a2 =  1.0f - alpha;
        //        float b0 = (1.0f - cos(omega)) / 2.0f;
        //        float b1 =  1.0f - cos(omega);
        //        float b2 = (1.0f - cos(omega)) / 2.0f;
        
        float a0 =   1.0f + alpha;
        float a1 =  -2.0f * cos(omega);
        float a2 =   1.0f - alpha;
        float b0 =  (1.0f + cos(omega)) / 2.0f;
        float b1 = -(1.0f + cos(omega));
        float b2 =  (1.0f + cos(omega)) / 2.0f;
        
        _subBuffer[i] = b0/a0 * _buffer[i] + b1/a0 * in1  + b2/a0 * in2 - a1/a0 * out1 - a2/a0 * out2;
        
        in2  = in1;
        in1  = _buffer[i];
        
        out2 = out1;
        out1 = _subBuffer[i];
    }
    
    _fft.powerSpectrum(0, (int)BUFFER_SIZE/2, _subBuffer, BUFFER_SIZE, &_magnitude2[0], &_phase2[0], &_power2[0], &avg_power);
    
    
    for(int i = 1; i < (int)(BUFFER_SIZE); i++){
        ofSetColor(255, 0, 0);
        ofRect((i - 1)*width, ofGetHeight(), width, -(_magnitude2[i] * 200.0));
    }
    
    

    
    
    
    float y1 = ofGetHeight() * 0.5;
    ofLine(0, y1, ofGetWidth(), y1);
    
    for(int i=0; i<BUFFER_SIZE; i++){
        float p = i / (float)(BUFFER_SIZE-1);
        float x = p * ofGetWidth();
        float y2 = y1 + _buffer[i] * 200;
        
        ofLine(x, y1, x, y2);
    }

    
    
    
    
}

//--------------------------------------------------------------
void ofApp::exit(){

}

void ofApp::audioIn(float *input, int bufferSize, int nChannels){
    int minBufferSize = MIN(BUFFER_SIZE, bufferSize);
    for (int i=0; i<minBufferSize; i++) {
        _buffer[i]  = input[i];
    }
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
