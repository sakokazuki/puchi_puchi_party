
#include "MovieScene.h"


//--------------------------------------------------------------
void MovieScene::setup(){
    font.loadFont("fonts/Arial.ttf", 30, true, true);
    
    ofAddListener(dummy.end_E, this, &MovieScene::endMovieSceneCb);
    ofAddListener(puchiCircleAlpha.end_E, this, &MovieScene::puchiCircleAlphaCb);
    bThroughSetup = false;
    
    soundImg.loadImage("images/sound.png");
    
    displaySoundImg = true;
}

//--------------------------------------------------------------
void MovieScene::update(){
    //movie scene start setup
    if (getSharedData().startMovie) {
        bThroughSetup = true;
        ofSetRectMode(OF_RECTMODE_CORNER);
        
        getSharedData().startMovie = false;
        
        btnNo = getSharedData().trgBtnNo;
        
        player = &getSharedData().loadedVideo;
        player->play();
        loadMovie = false;
        bEndMovie = false;
        bEndEffect = false;
        
        scale = getSharedData().magnifySize;
        translate = getSharedData().movieTrans;
        
        puchiCricleTween.setParameters(0, easing_circ, ofxTween::easeOut, 118, 400, 800, 0);
        puchiCircleAlpha.setParameters(0, easing_circ, ofxTween::easeOut, 255, 0, 800, 0);
        
        cout << "movie start!!" << endl;
        displaySoundImg = true;
    }
    
    if (bThroughSetup) {
        if (!loadMovie && player->isLoaded()) {
            loadMovie = true;
        }
        
        player->update();
        
        if (player->getIsMovieDone()) {
            bEndEffect = true;
            
            if (!bEndMovie) {
                int max = 0;
                int maxDelayNo;
                for (int i=0; i<getSharedData().button.size(); i++) {
                    ofxTween tmpTwn;
                    endCircleSize.push_back(tmpTwn);
                    int randomDelay = (int)ofRandom(100, 500);
                    int randomSize = (int)ofRandom(200, 400);
                    if (max > randomDelay) {
                        maxDelayNo = i;
                    }
                    endCircleSize[i].setParameters(0, easing_circ, ofxTween::easeOut, 0, randomSize, 800, randomDelay);
                }
                dummy.setParameters(0, easing_circ, ofxTween::easeOut, 0, 0, 800, 500);
                
                
                bEndMovie = true;
            }
            
        }
        
        
        
        //tween updtate
        if (bEndEffect) {
            for (int i=0; i<getSharedData().button.size(); i++) {
                endCircleSize[i].update();
            }
            dummy.update();
        }
        
        puchiCricleTween.update();
        puchiCircleAlpha.update();
        
    }
    
    
}

//--------------------------------------------------------------
void MovieScene::draw(){
    ofBackground(60, 220, 250);
    if (bThroughSetup) {
//        cout << "movie draw()3  " << getSharedData().startMovie << endl;
        if (loadMovie) {
            ofSetColor(255);
            ofPushMatrix();
            ofTranslate(-1*scale.x/2, -1*scale.y/2);
            ofTranslate(translate);
            ofSetRectMode(OF_RECTMODE_CORNER);
            player->getTexture()->draw(0, 0, ofGetWidth()+scale.x, ofGetHeight()+scale.y);
            ofPopMatrix();
        }
        
        ofSetColor(231, 255, 67, puchiCircleAlpha.getTarget(0));
        ofEllipse(getSharedData().button[btnNo].pos, puchiCricleTween.getTarget(0), puchiCricleTween.getTarget(0));
        
        if (bEndEffect) {
            ofSetColor(60, 220, 250);
            for (int i=0; i<getSharedData().button.size(); i++) {
                ofEllipse(getSharedData().button[i].pos, endCircleSize[i].getTarget(0), endCircleSize[i].getTarget(0));
            }
            
        }
        
        if (displaySoundImg) {
            ofSetColor(255);
            ofSetRectMode(OF_RECTMODE_CENTER);
            ofPushMatrix();
            ofTranslate(getSharedData().button[btnNo].pos);
            float degree = 45;
            if (getSharedData().button[btnNo].pos.y<soundImg.getHeight()/2) {
                degree = 135;
            }
            if (getSharedData().button[btnNo].pos.x>ofGetWidth()/2) {
                degree *= -1;
            }
            
            ofRotateZ(degree);
            soundImg.draw(0, -1*(getSharedData().button[btnNo].height/2+20), soundImg.getWidth()/2, soundImg.getHeight()/2);
            ofPopMatrix();
        }
        
        
    }
    
    
}

//--------------------------------------------------------------

void MovieScene::touchDown(ofTouchEventArgs &touch){


}

void MovieScene::touchUp(ofTouchEventArgs &touch){

}

void MovieScene::endMovieSceneCb(int &val){
    player->setFrame(0);
    player->play();
    getSharedData().loadedVideo.close();
    getSharedData().startHome = true;
    changeState("home");
    bThroughSetup = false;
}

void MovieScene::puchiCircleAlphaCb(int &val){\
    displaySoundImg = false;
}

string MovieScene::getName(){
    return "MovieScene";
}


