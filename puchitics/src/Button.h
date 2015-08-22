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
    void setup(ofVec2f p, int w, int h, int _no);
    void draw();
    

    ofVec2f pos;
    int width;
    int height;
    int no;
    bool bTouched;
    
    ofEvent<int> downEvent;
    ofEvent<int> upEvent;
    vector< ofEvent<int> > downEvents;
    vector< ofEvent<int> > upEvents;
    
    void touchDownEvent(int scene);
    void touchUpEvent(int scene);
    bool bHover;
    int hoverWidth;
};


#endif /* defined(__puchitics__Button__) */
