
#include "SoundDebug.h"


//--------------------------------------------------------------
void SoundDebug::setup(){
    
}

//--------------------------------------------------------------
void SoundDebug::update(){
    sound.update();
    cout << sound.bSound << endl;
    
}

//--------------------------------------------------------------
void SoundDebug::draw(){
    sound.draw();

}

//--------------------------------------------------------------

void SoundDebug::touchDown(ofTouchEventArgs &touch){
    cout << touch << " (in sound debug)" << endl;
    
}


string SoundDebug::getName(){
    return "SoundDebug";
}
