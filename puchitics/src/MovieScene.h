//
//  MovieScene.h
//  puchitics
//
//  Created by sako on 2015/08/11.
//
//

#ifndef __puchitics__MovieScene__
#define __puchitics__MovieScene__

#include "ofxState.h"
#include "sharedData.h"

class MovieScene: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    string getName();
    
    ofTrueTypeFont font;
    ofxiOSVideoPlayer video;
    ofxiOSVideoPlayer *player;
    bool loadMovie;
    
    int btnNo;
    
    bool bHoverButton;
    
    ofVec2f scale;
    ofVec2f translate;
    
};

#endif /* defined(__puchitics__MovieScene__) */
