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
    void setup(ofVec2f p, int w, int h, ofColor col, ofColor hoverCol, int _no);
    void draw();
    

    ofVec2f pos;
    int width;
    int height;
    ofColor color;
    ofColor hoverColor;
    int no;
    
    ofEvent<int> event;
    ofEvent<int> event2;
    void fireEvent();
    void touchUpEvent();
    bool bHover;
    int hoverWidth;
    
};


#endif /* defined(__puchitics__Button__) */
