
#include "SoundDebug.h"


//--------------------------------------------------------------
void SoundDebug::setup(){
    
}

//--------------------------------------------------------------
void SoundDebug::update(){
    if (!getSharedData().bSoundDebug) {
        getSharedData().bSoundDebug = true;
    }
    
}

//--------------------------------------------------------------
void SoundDebug::draw(){

}

//--------------------------------------------------------------

void SoundDebug::touchDown(ofTouchEventArgs &touch){
    cout << touch << " (in sound debug)" << endl;
    
}


string SoundDebug::getName(){
    return "SoundDebug";
}
