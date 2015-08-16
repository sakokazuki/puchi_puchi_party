
#ifndef __puchitics__home__
#define __puchitics__home__

#include "ofxState.h"
#include "sharedData.h"

#include "Button.h"

class home: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
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
    
    
};

#endif /* defined(__puchitics__home__) */
