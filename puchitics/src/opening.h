
#ifndef __puchitics__opening__
#define __puchitics__opening__


#include "ofxState.h"
#include "sharedData.h"

class opening: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    string getName();
    
    
public:
    int hoge;
    
};

#endif /* defined(__puchitics__opening__) */
