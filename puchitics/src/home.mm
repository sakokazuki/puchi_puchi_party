#include "home.h"

//--------------------------------------------------------------
void home::setup(){
    creditImg.loadImage("images/credit.png");
    twImg.loadImage("images/tw.png");
    fbImg.loadImage("images/fb.png");
    credit_buttonImg.loadImage("images/credit_icon.png");
    
    homeUnderTextFont.loadFont("fonts/ヒラギノ角ゴ Pro W6.otf", 26, true, true);
    homeUnderTextFont.setLetterSpacing(0.9);
    homeUnderText = "好きなところをプチプチしてね！";
    underTextAlpha = 0;
    bFirstLabel = false;
    bComplete = false;
    completeText[0] = "ぷちぷちが全部つぶれた！";
    completeText[1] = "ぷちぷちマスター";
    
    bDisplayCredit = false;
    ofAddListener(uTTween.end_E, this, &home::uTTweenCb);
    ofAddListener(creditTween.end_E, this, &home::creditTweenCb);
    
    puchiWaitCount = 0;
    
    creditCount = 0;
}

//--------------------------------------------------------------
void home::update(){
    if (getSharedData().startHome) {
        cout << "home" << endl;
        getSharedData().startHome = false;
        twn.clear();
        for (int i=0; i<getSharedData().button.size(); i++) {
            ofxTween tmpTwn;
            twn.push_back(tmpTwn);
            int delay = (int)getSharedData().button[i].pos.length()/2;
            twn[i].setParameters(0, easing_circ, ofxTween::easeOut, 0, 118, 500, delay);
        }
        ofSetRectMode(OF_RECTMODE_CENTER);
        uTTween.setParameters(0, easing_circ, ofxTween::easeOut, 0, 255, 500, 600);
        
        bool bCompTmp = true;
        for (int i=0; i<getSharedData().button.size(); i++) {
            if (!getSharedData().button[i].bTouched) {
                bCompTmp = false;
            }
        }
        bComplete = bCompTmp;
        
        
    }
    
    for (int i=0; i<twn.size(); i++) {
        twn[i].update();
    }
    uTTween.update();
    creditTween.update();
    
    
    if (getSharedData().bPuchi) {
        puchiWaitCount++;
        if (getSharedData().bHoverButton && bDisplayCredit == false) {
            cout << "before change state--------------------" <<endl;
            changeStateToMovie();
        }
        if (puchiWaitCount>10) {
            getSharedData().bPuchi = false;
            puchiWaitCount = 0;
        }
        
    }
    
    
    
}

//--------------------------------------------------------------
void home::draw(){
    
    ofBackground(60, 220, 250);
    if (twn.size() != 0 && !getSharedData().startHome) {
        for (int i=0; i<getSharedData().button.size(); i++) {
            getSharedData().button[i].width = twn[i].getTarget(0);
            getSharedData().button[i].height = twn[i].getTarget(0);
            getSharedData().button[i].draw();
            
        }
        
        underTextAlpha = uTTween.getTarget(0);
        
        if (bComplete) {
            ofSetColor(0, 90, 120, underTextAlpha);
            ofRectRounded(ofGetWidth()/2, ofGetHeight()/2, 500, 150, 75);
            ofSetColor(231, 255, 67, underTextAlpha);
            float w = homeUnderTextFont.stringWidth(completeText[0]);
            homeUnderTextFont.drawString(completeText[0], ofGetWidth()/2-w/2, ofGetHeight()/2-10);
            w = homeUnderTextFont.stringWidth(completeText[1]);
            homeUnderTextFont.drawString(completeText[1], ofGetWidth()/2-w/2, ofGetHeight()/2+40);
        }else{
            if (!bFirstLabel) {
                ofSetColor(0, 90, 120, underTextAlpha);
                ofRect(ofGetWidth()/2, 8*ofGetHeight()/9, 600, 60);
                ofSetColor(231, 255, 67, underTextAlpha);
                float w = homeUnderTextFont.stringWidth(homeUnderText);
                homeUnderTextFont.drawString(homeUnderText, ofGetWidth()/2-w/2, 8*ofGetHeight()/9+14);
            }
        }
        
        ofSetColor(255, 255);
        twImg.draw(getSharedData().button[0].pos);
        fbImg.draw(getSharedData().button[getSharedData().colmn].pos);
        
        int rightUpNo = ofGetWidth()/(getSharedData().btnSize + getSharedData().btnSpaceX);
        credit_buttonImg.draw(getSharedData().button[rightUpNo*getSharedData().colmn].pos);
        
        
        ofSetColor(255, creditTween.getTarget(0));
        creditImg.draw(ofGetWidth()/2, ofGetHeight()/2);
        
    }
    
    
}

//--------------------------------------------------------------

void home::touchDown(ofTouchEventArgs &touch){
    if (!bDisplayCredit) {
        for (int i=0; i<getSharedData().button.size(); i++) {
            ofVec2f pos = getSharedData().button[i].pos;
            int width = getSharedData().button[i].width;
            if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
                getSharedData().button[i].touchDownEvent(1);
            }
        }
    }
    
}

void home::touchUp(ofTouchEventArgs &touch){
    
    if (!bDisplayCredit) {
        for (int i=0; i<getSharedData().button.size(); i++) {
            getSharedData().button[i].touchUpEvent(1);
        }
    }
    
    
}

void home::touchDoubleTap(ofTouchEventArgs &touch){
    for (int i=0; i<getSharedData().button.size(); i++) {
        ofVec2f pos = getSharedData().button[i].pos;
        int width = getSharedData().button[i].width;
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            getSharedData().button[i].touchDownEvent(1);
        }
    }
    if (!bDisplayCredit) {
        for (int i=0; i<getSharedData().button.size(); i++) {
            ofVec2f pos = getSharedData().button[i].pos;
            int width = getSharedData().button[i].width;
            if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
                if (!getSharedData().button[i].bTouched) {
                    changeStateToMovie();
                }
            }
        }
    }
    
    
}

void home::uTTweenCb(int &e){
    if (!bComplete) {
        switch (e) {
            case 0:
                uTTween.setParameters(1, easing_circ, ofxTween::easeOut, 255, 0, 500, 2000);
                break;
            
            default:
                break;
        }
    }
}

void home::creditTweenCb(int &e){
    switch (e) {
        case 0:
            creditTween.setParameters(1, easing_circ, ofxTween::easeOut, 255, 0, 500, 3000);
            break;
        case 1:
            bDisplayCredit = false;
            getSharedData().bCredit = false;
            cout << "endcredit" << endl;
            break;
        default:
            break;
    }
}


void home::changeStateToMovie(){
    int trgNo = getSharedData().targetBtnNo;
    getSharedData().sePlay();
    cout << "trgNo" << trgNo << endl;
    getSharedData().button[trgNo].bTouched = true;
    if (getSharedData().bCredit && creditCount == 0) {
        cout << "credit" << endl;
        creditTween.setParameters(0, easing_circ, ofxTween::easeOut, 0, 255, 500, 0);
        creditCount++;

        bDisplayCredit = true;
//        getSharedData().button[3].touchDownEvent(1);
    }else if (getSharedData().bTw){
        cout << "tw" << endl;
        ofLaunchBrowser("https://twitter.com/intent/tweet?hashtags=puchitics&original_referer=http%3A%2F%2Fpuchitics.com%2Fver1%2F&ref_src=twsrc%5Etfw&text=%E3%83%97%E3%83%81%E3%83%86%E3%82%A3%E3%82%AF%E3%82%B9%EF%BD%9C%E3%81%B7%E3%81%A1%E3%81%B7%E3%81%A1%E3%81%AE%E8%A7%A6%E8%A6%9A%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9%E3%81%A8%E3%81%97%E3%81%A6%E3%81%AE%E5%8F%AF%E8%83%BD%E6%80%A7%E3%81%AB%E6%B3%A8%E7%9B%AE%E3%81%97%E3%81%9F%E3%80%81%E6%96%B0%E6%84%9F%E8%A6%9A%E3%82%A2%E3%83%97%E3%83%AA&tw_p=tweetbutton&url=http%3A%2F%2Fpuchitics.com%2Fver1%2F");
    }else if (getSharedData().bFb){
        ofLaunchBrowser("https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fpuchitics.com%2F");
    }else{
        cout << "change scene to movie" << endl;
        getSharedData().startMovie = true;
        changeState("MovieScene");
        
        if (!bFirstLabel) {
            bFirstLabel = true;
        }
    }
    getSharedData().button[trgNo].touchUpEvent(1);
    getSharedData().bHoverButton = false;
}


string home::getName(){
    return "home";
}
