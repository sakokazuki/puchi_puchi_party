
#ifndef __puchitics__opening__
#define __puchitics__opening__


#include "ofxState.h"
#include "sharedData.h"

#include "Button.h"
#include "ofxTrueTypeFontUC.h"
#include "ofxTween.h"


class opening: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    string getName();
    

    
public:
    ofTrueTypeFont font;
    void toHome();
    
    void callback(int &val);
    void touchUpEventCallback(int &val);
    ofVec2f startPoint;
    int opBtnNo;
    
    ofxTrueTypeFontUC opUnderTextFont;
    string opUnderText;
    bool bEndOpening;
    int endCircle;
    
    void changeStateFunc();
    
    ofxEasingCirc 	easing_circ;
    ofxTween endCircleTween;
    ofxTween circleCol[3];
    void circleEndCb(int &e);
    
    ofImage logoImg;
    ofImage testImg;
    

    
};

#endif /* defined(__puchitics__opening__) */
