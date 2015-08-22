

#ifndef __puchitics__sharedData__
#define __puchitics__sharedData__

#include "ofMain.h"
#include "Button.h"
#include "ofxJSON.h"

class sharedData{
public:
    void btnSetup();
    
    
    int sharedInt;
    bool startMovie = false;
    bool startHome = false;
    
    ofxiOSVideoPlayer loadedVideo;
    
    bool bUseAudio = true;
    bool bPuchi = false;
    bool bSoundDebug = false;
    
    int btnSize;
    int btnSpaceX;
    int btnSpaceY;
    ofVec2f btnBeginPoint;
    int colmn;
    int row ;
    vector<ofVec2f> btnPos;
    vector<Button> button;
    void touchUpEventCbOp(int &val);
    void touchDownEventCbOp(int &val);
    void touchUpEventCbHome(int &val);
    void touchDownEventCbHome(int &val);

    bool bHoverButton;
    int targetBtnNo;
    int trgBtnNo = -1;
    string movieName = "purin.mp4";

    ofVec2f magnifySize = ofVec2f(160, 90);
    ofVec2f movieTrans = ofVec2f(0, 0);
    
    ofxJSONElement json;
    bool bCredit = false;
    bool bFb = false;
    bool bTw = false;

    
    
};
#endif /* defined(__puchitics__sharedData__) */
