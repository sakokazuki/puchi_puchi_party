
#include "MovieScene.h"


//--------------------------------------------------------------
void MovieScene::setup(){
    cout << "load" << endl;
    font.loadFont("fonts/Arial.ttf", 30, true, true);
    eventFlag = false;
}

//--------------------------------------------------------------
void MovieScene::update(){
    
    
    //movie scene start setup
    if (getSharedData().startMovie) {
        ofSetRectMode(OF_RECTMODE_CORNER);
        
        getSharedData().startMovie = false;
        
        movieName = "movies/" + getSharedData().movieName;
        stopPoint = getSharedData().stopPoint;
        bStopPoint = getSharedData().bStopPoint;
        btnNo = getSharedData().trgBtnNo;
        
        getSharedData().loadedVideo.loadMovie(movieName);
        player = &getSharedData().loadedVideo;
        player->play();
        loadMovie = false;
        
        scale = getSharedData().magnifySize;
        translate = getSharedData().movieTrans;

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
    
    if (play && eventFlag) {
        if (getSharedData().bPuchi) {
            if (getSharedData().bHoverButton) {
                getSharedData().bHoverButton = false;

                play = false;
                player->setPaused(play);
            }
            cout << "puchi" << endl;
            getSharedData().bPuchi = false;
        }
    }
    
    if (player->getIsMovieDone()) {
        eventFlag = false;
        player->setFrame(0);
        player->play();
        getSharedData().button[btnNo].bTouched = true;
        getSharedData().loadedVideo.close();
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
        ofSetColor(231, 255, 67);
        
        ofPopMatrix();

    }
    
    
    
    if (play && eventFlag) {
        getSharedData().button[btnNo].draw();
        
        ofPushMatrix();
        ofTranslate(getSharedData().button[btnNo].pos);
        ofSetColor(231, 255, 67);
        font.drawString("touch!", -50, -70);
        ofPopMatrix();
    }

    
}

//--------------------------------------------------------------

void MovieScene::touchDown(ofTouchEventArgs &touch){
    cout << touch << endl;
    if(eventFlag){
        ofVec2f tP = getSharedData().button[btnNo].pos;
        if (touch.x > tP.x-50 && touch.x < tP.x+50 && touch.y > tP.y-50 && touch.y < tP.y+50){
//            play = false;
//            player->setPaused(play);
            getSharedData().button[btnNo].touchDownEvent(2);
            cout << "touchDown movie" << endl;
        }
        
    }

}

void MovieScene::touchUp(ofTouchEventArgs &touch){
    if(eventFlag){
        ofVec2f tP = getSharedData().button[btnNo].pos;
        if (touch.x > tP.x-50 && touch.x < tP.x+50 && touch.y > tP.y-50 && touch.y < tP.y+50){
            getSharedData().button[btnNo].touchUpEvent(2);
        }
        
    }
}


string MovieScene::getName(){
    return "MovieScene";
}


