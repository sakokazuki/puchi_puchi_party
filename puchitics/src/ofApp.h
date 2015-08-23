#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxStateMachine.h"
#include "sharedData.h"

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
    
    
    itg::ofxStateMachine<sharedData> stateMachine;
    
    void audioIn(float *input, int bufferSize, int nChannels);
    ofSoundStream soundStream;
    ofSoundPlayer bgmPlayer;
    
    float *_buffer;
    float *_buffer2;
    float tmpBuffer[BUFFER_SIZE];
    float saveBuffer[BUFFER_SIZE];
    
    bool volumeFlag;
    bool variationFlag;
    
    bool flag1;
    bool flag2;
    bool flag3;
    
    bool bg;
    
    
    
};


