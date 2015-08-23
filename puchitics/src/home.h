
#ifndef __puchitics__home__
#define __puchitics__home__

#include "ofxState.h"
#include "sharedData.h"

#include "Button.h"
#include "ofxTween.h"
#include "ofxTrueTypeFontUC.h"

class home: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    string getName();
    
    int btnSize;
    int btnSpace;
    int colmn;
    int row;
    
    vector<Button> buttons;

    void callback(int &val);
    void touchUpEventCallback(int &val);

    
    bool bHoverButton;
    int targetBtnNo;
    int puchiWaitCount;
    
    ofImage img;
    
    vector <ofxTween> twn;
    ofxEasingCirc 	easing_circ;
    
    int underTextAlpha;
    ofxTrueTypeFontUC homeUnderTextFont;
    string homeUnderText;
    ofxTween uTTween;
    void uTTweenCb(int &e);
    
    bool bFirstLabel;
    bool bComplete;
    string completeText[2];
    
    void changeStateToMovie();
    
    ofImage creditImg;
    ofxTween creditTween;
    void creditTweenCb(int &e);
    bool bDisplayCredit;
    
    ofImage fbImg;
    ofImage twImg;

    int creditCount;
    
};

#endif /* defined(__puchitics__home__) */
