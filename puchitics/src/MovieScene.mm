
#include "MovieScene.h"


//--------------------------------------------------------------
void MovieScene::setup(){
    font.loadFont("fonts/Arial.ttf", 30, true, true);
}

//--------------------------------------------------------------
void MovieScene::update(){
    //movie scene start setup
    if (getSharedData().startMovie) {
        ofSetRectMode(OF_RECTMODE_CORNER);
        
        getSharedData().startMovie = false;
        
        btnNo = getSharedData().trgBtnNo;
        
        player = &getSharedData().loadedVideo;
        player->play();
        loadMovie = false;
        
        scale = getSharedData().magnifySize;
        translate = getSharedData().movieTrans;
    }
    
    if (!loadMovie && player->isLoaded()) {
        loadMovie = true;
    }
    
    player->update();
    
    if (player->getIsMovieDone()) {
        player->setFrame(0);
        player->play();
        getSharedData().loadedVideo.close();
        getSharedData().startHome = true;
        changeState("home");
    }
    
}

//--------------------------------------------------------------
void MovieScene::draw(){
    ofBackground(60, 220, 250);
    
    if (loadMovie) {
        ofSetColor(255);
        ofPushMatrix();
        ofTranslate(-1*scale.x/2, -1*scale.y/2);
        ofTranslate(translate);
        player->getTexture()->draw(0, 0, ofGetWidth()+scale.x, ofGetHeight()+scale.y);
        ofPopMatrix();
    }

    
}

//--------------------------------------------------------------

void MovieScene::touchDown(ofTouchEventArgs &touch){


}

void MovieScene::touchUp(ofTouchEventArgs &touch){

}


string MovieScene::getName(){
    return "MovieScene";
}


