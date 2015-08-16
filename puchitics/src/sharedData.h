

#ifndef __puchitics__sharedData__
#define __puchitics__sharedData__

#include "ofMain.h"
#include "Button.h"

class sharedData{
public:
    void btnSetup();
    
    
    int sharedInt;
    bool startMovie = false;
    
    string movieName = "purin.mp4";
    int stopPoint = 0;
    int bStopPoint = false;
    ofVec2f touchPoint = ofVec2f(0, 0);
    int trgBtnNo = -1;
    
    struct movieData{
        string name = "purin.mp4";
        int stopPoint = 0;
        bool bStopPoint = false;
        ofVec2f touchPoint = ofVec2f(0, 0);
        int trgBtnNo = -1;
    };
    
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
    void touchUpEventCbMv(int &val);
    void touchDownEventCbMv(int &val);
    
    
    void touchDownEventCallback(int &val);
    void touchUpEventCallback(int &val);
    bool bHoverButton;
    
    int targetBtnNo;
    
    int searchNearlyBtn(ofVec2f trg);
    void randomMovieChoose();
    void movieChoose(ofVec2f p);
    ofVec2f magnifySize = ofVec2f(160, 90);
    ofVec2f movieTrans = ofVec2f(0, 0);
    
};
#endif /* defined(__puchitics__sharedData__) */
