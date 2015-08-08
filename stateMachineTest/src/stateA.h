
#include "ofxState.h"

class stateA : public itg::ofxState<>{
    
    void setup();
    void update();
    void draw();
    void mousePressed(int x, int y, int button);
    string getName();
    
};


