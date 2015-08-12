

#ifndef __puchitics__PuchiSound__
#define __puchitics__PuchiSound__

#include "ofMain.h"
#include "ofxiOS.h"

#define BUFFER_SIZE 1024


class PuchiSound : public ofxiOSApp {
public:
    PuchiSound();
    void update();
    void draw();
    void audioIn(float *input, int bufferSize, int nChannels);
    
    ofSoundStream soundStream;
    
    float buffer[BUFFER_SIZE];
    float tmpBuffer[BUFFER_SIZE];
    float saveBuffer[BUFFER_SIZE];
    
    float highpass[BUFFER_SIZE];
    float  magnitude[BUFFER_SIZE];
    float  phase[BUFFER_SIZE];
    float  power[BUFFER_SIZE];
    
    bool volumeFlag;
    bool variationFlag;
    
    bool bSound;
    
};

#endif /* defined(__puchitics__PuchiSound__) */
