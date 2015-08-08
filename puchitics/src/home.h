
#ifndef __puchitics__home__
#define __puchitics__home__

#include "ofxState.h"
#include "sharedData.h"

class home: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    string getName();
    
    
};

#endif /* defined(__puchitics__home__) */
