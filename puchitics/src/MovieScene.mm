
#include "MovieScene.h"


//--------------------------------------------------------------
void MovieScene::setup(){
    cout << "load" << endl;
    font.loadFont("fonts/Arial.ttf", 30, true, true);
    
}

//--------------------------------------------------------------
void MovieScene::update(){
    
    

    if (getSharedData().startMovie) {
        ofSetRectMode(OF_RECTMODE_CORNER);
        
        getSharedData().startMovie = false;
        
        movieName = "movies/" + getSharedData().movieName;
        stopPoint = getSharedData().stopPoint;
        bStopPoint = getSharedData().bStopPoint;
        touchPoint = getSharedData().touchPoint;
        
        getSharedData().loadedVideo.loadMovie(movieName);
        player = &getSharedData().loadedVideo;
        player->play();
        loadMovie = false;
        cout << "play!" << endl;
        
    }
    
    if (!loadMovie && player->isLoaded()) {
        loadMovie = true;
    }
    
    player->update();
//    cout << "length: "+ofToString(player->getTotalNumFrames()) << endl;
    
    if (player->isFrameNew()) {
        if (player->getCurrentFrame() > stopPoint && !eventFlag && bStopPoint) {
            eventFlag = true;
            play = true;
            player->setPaused(true);
        }
    }
    
    if (player->getIsMovieDone()) {
        eventFlag = false;
        player->setFrame(0);
        player->play();
        getSharedData().loadedVideo.close();
        changeState("home");
    }

    
}

//--------------------------------------------------------------
void MovieScene::draw(){
    ofBackground(60, 220, 250);
    
    if (loadMovie) {
        ofSetColor(255);
        player->getTexture()->draw(0, 0, ofGetWidth(), ofGetHeight());
    }
    
    
    
    if (play && eventFlag) {
        ofSetColor(231, 255, 67);
        
        
        ofPushMatrix();
        ofTranslate(touchPoint);
        font.drawString("touch!", -50, -60);
        ofEllipse(0, 0, 100, 100);
        ofPopMatrix();
    }

    
}

//--------------------------------------------------------------

void MovieScene::touchDown(ofTouchEventArgs &touch){
    cout << touch << endl;
    if(eventFlag){
        if (touch.x > touchPoint.x-50 && touch.x < touchPoint.x+50 && touch.y > touchPoint.y-50 && touch.y < touchPoint.y+50){
            play = false;
            player->setPaused(play);
        }
        
    }

}



string MovieScene::getName(){
    return "MovieScene";
}