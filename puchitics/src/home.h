
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
    string getName();
    
    int btnSize;
    int btnSpace;
    int colmn;
    int row;
    

    vector<vector<Button> > button;
    void callback(int &val);
    
    
    
    
};

#endif /* defined(__puchitics__home__) */
