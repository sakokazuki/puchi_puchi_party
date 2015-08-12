#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "fft.h"

#define BUFFER_SIZE 1024

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    void audioIn(float *input, int bufferSize, int nChannels);
    
    float *_buffer;
    float _tmpBuffer[BUFFER_SIZE];
    float _saveBuffer[BUFFER_SIZE];
    fft _fft;

    float _highpass[BUFFER_SIZE];
    float  _magnitude[BUFFER_SIZE];
    float  _phase[BUFFER_SIZE];
    float  _power[BUFFER_SIZE];
    
//    ofSoundStream soundStream;

    bool flag;
    bool amountFlag;
    bool touchFlag;

};


