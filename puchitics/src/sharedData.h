

#ifndef __puchitics__sharedData__
#define __puchitics__sharedData__

#include "ofMain.h"

class sharedData{
public:
    void btnSetup();
    
    
    int sharedInt;
    bool startMovie = false;
    
    string movieName = "purin.mp4";
    int stopPoint = 0;
    int bStopPoint = false;
    ofVec2f touchPoint = ofVec2f(0, 0);
    
    struct movieData{
        string name = "purin.mp4";
        int stopPoint = 0;
        bool bStopPoint = false;
        ofVec2f touchPoint = ofVec2f(0, 0);
    };
    
    ofxiOSVideoPlayer loadedVideo;
    
    bool bUseAudio = true;
    bool bPuchi = false;
    bool bSoundDebug = false;
    
    int btnSize;
    int btnSpace;
    int colmn;
    int row ;
    vector<ofVec2f> btnPos;
    
    
};
#endif /* defined(__puchitics__sharedData__) */
