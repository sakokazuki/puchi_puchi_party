

#ifndef __puchitics__Egg__
#define __puchitics__Egg__

#include "ofxState.h"
#include "sharedData.h"

class Egg: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    string getName();
    
    ofTrueTypeFont font;
    ofxiOSVideoPlayer video;
    ofxiOSVideoPlayer *player;
    bool play;
    bool eventFlag;
    
};

#endif /* defined(__puchitics__Egg__) */
