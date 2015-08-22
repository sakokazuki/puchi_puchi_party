
#ifndef __puchitics__MovieScene__
#define __puchitics__MovieScene__

#include "ofxState.h"
#include "sharedData.h"
#include "ofxTween.h"

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
    bool bEndMovie;
    bool bEndEffect;
    
    ofVec2f scale;
    ofVec2f translate;
    
    ofxEasingCirc easing_circ;
    ofxTween puchiCricleTween;
    ofxTween puchiCircleAlpha;
    ofxTween dummy;
    void endMovieSceneCb(int &val);
    void puchiCircleAlphaCb(int &val);
    
    vector<ofxTween> endCircleSize;
    
    bool bThroughSetup;
    
    ofImage soundImg;
    bool displaySoundImg;

};

#endif /* defined(__puchitics__MovieScene__) */
