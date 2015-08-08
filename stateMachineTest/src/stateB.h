#include "ofxState.h"

class stateB : public itg::ofxState<>{
    
    void setup();
    void update();
    void draw();
    void mousePressed(int x, int y, int button);
    string getName();
    
};

