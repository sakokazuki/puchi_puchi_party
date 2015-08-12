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
    void setup(ofVec2f p, int w, int h, ofColor col, ofColor hoverCol, int _no, string _shape);
    void draw();
    

    ofVec2f pos;
    int width;
    int height;
    ofColor color;
    ofColor hoverColor;
    int no;
    string shape;
    
    ofEvent<int> event;
    void fireEvent(ofVec2f touch);
    void touchUpEvent(ofVec2f touch);
    bool bHover;
    int hoverWidth;
    
};


#endif /* defined(__puchitics__Button__) */
