#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "fft.h"

#define BUFFER_SIZE 256
#define NUM_WINDOWS 80

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
    
    float *_subBuffer;
    fft _fft;
    
    float  _magnitude[BUFFER_SIZE];
    float  _phase[BUFFER_SIZE];
    float  _power[BUFFER_SIZE];
    float  _freq[NUM_WINDOWS][BUFFER_SIZE/2];
    
    float _highpass[BUFFER_SIZE];
    float  _magnitude2[BUFFER_SIZE];
    float  _phase2[BUFFER_SIZE];
    float  _power2[BUFFER_SIZE];
    float  _freq2[NUM_WINDOWS][BUFFER_SIZE/2];
    
    ofSoundStream soundStream;
    

};


