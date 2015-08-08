
#include "Egg.h"


//--------------------------------------------------------------
void Egg::setup(){
    ofBackground(255, 255, 255);
    
    font.loadFont("fonts/Arial.ttf", 30, true, true);
    
    video.loadMovie("movies/egg.mov");
    video.setLoopState(OF_LOOP_NONE);
    play = false;
    eventFlag = false;
    
    player = &video;
    player->play();
    ofSetRectMode(OF_RECTMODE_CORNER);

}

//--------------------------------------------------------------
void Egg::update(){
    player->update();
    
    if (player->isFrameNew()) {
        if (player->getCurrentFrame() > 93 && !eventFlag) {
            eventFlag = true;
            play = true;
            player->setPaused(true);
        }
    }
    
    if (player->getIsMovieDone()) {
        eventFlag = false;
        player->setFrame(0);
        player->play();
        changeState("home");
    }
    
}

//--------------------------------------------------------------
void Egg::draw(){
    ofBackground(255, 255, 255);
    ofSetColor(255);
    ofCircle(0, 0, 30);
    
    
    player->getTexture()->draw(0, 0, ofGetWidth(), ofGetHeight());
    
    
    if (play && eventFlag) {
        ofSetColor(255, 0, 0);
        
        
        ofPushMatrix();
        ofTranslate(610, 200);
        font.drawString("touch!", -50, -60);
        ofEllipse(0, 0, 100, 100);
        ofPopMatrix();
        
        
    }

}

//--------------------------------------------------------------

void Egg::touchDown(ofTouchEventArgs &touch){
    if(eventFlag){
        if (touch.x > 610-50 && touch.x < 610+50 && touch.y > 200-50 && touch.y < 200+50) {
            play = false;
            player->setPaused(play);
        }
        
    }
    
}



string Egg::getName(){
    return "Egg";
}
