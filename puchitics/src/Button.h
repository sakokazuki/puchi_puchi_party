//
//  Button.h
//  puchitics
//
//  Created by sako on 2015/08/08.
//
//

#ifndef __puchitics__Button__
#define __puchitics__Button__

#include "ofMain.h"

class Button {
public:
    Button();
    void setup(ofVec2f p, int w, int h, ofColor col, int _no, string _shape);
    void draw();
    

    ofVec2f pos;
    int width;
    int height;
    ofColor color;
    int no;
    string shape;
    
    ofEvent<int> event;
    void fireEvent(ofVec2f touch);
    
};


#endif /* defined(__puchitics__Button__) */
