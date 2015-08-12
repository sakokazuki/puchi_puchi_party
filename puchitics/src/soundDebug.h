//
//  SoundDebug.h
//  puchitics
//
//  Created by sako on 2015/08/13.
//
//

#ifndef __puchitics__SoundDebug__
#define __puchitics__SoundDebug__

#include "ofxState.h"
#include "sharedData.h"



class SoundDebug: public itg::ofxState<sharedData>{
    
    void setup();
    void update();
    void draw();
    void touchDown(ofTouchEventArgs & touch);
    string getName();
    
    
    
public:
    
    
};
#endif /* defined(__puchitics__SoundDebug__) */
