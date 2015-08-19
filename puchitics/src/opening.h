
#ifndef __puchitics__opening__
#define __puchitics__opening__


#include "ofxState.h"
#include "sharedData.h"

#include "Button.h"
#include "ofxTrueTypeFontUC.h"


class opening: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
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
    
};

#endif /* defined(__puchitics__opening__) */
