#include "home.h"

//--------------------------------------------------------------
void home::setup(){
    btnSize = 118;
    btnSpace = 30;
    colmn = 5;
    row = 10;
    bHoverButton = false;
    
    getSharedData().btnSetup();
    
    for (int i=0; i<getSharedData().btnPos.size(); i++) {
        Button btn;
        buttons.push_back(btn);
        ofVec2f p = getSharedData().btnPos[i];
        int w = getSharedData().btnSize;
        int h = getSharedData().btnSize;
        buttons[i].setup(p, w, h, ofColor(231, 255, 67), ofColor(0, 90, 120), i);
    }
    
    for (int i=0; i<buttons.size(); i++) {
        ofAddListener(buttons[i].event, this, &home::callback);
        ofAddListener(buttons[i].event2, this, &home::touchUpEventCallback);
    }

    
    
//    int no = 0;
//    for (int i=0; i<row; i++) {
//        vector<Button> tmp1;
//        button.push_back(tmp1);
//        for (int j=0; j<colmn; j++) {
//            Button tmp2;
//            button[i].push_back(tmp2);
//            
//            ofVec2f btnPos = ofVec2f(i*(btnSize+btnSpace), j*(btnSize+btnSpace));
//            if (j%2==1) {
//                btnPos = ofVec2f(i*(btnSize+btnSpace)+(btnSize+btnSpace)/2, j*(btnSize+btnSpace));
//            }
//    
//            button[i][j].setup(btnPos, btnSize, btnSize, ofColor(231, 255, 67), ofColor(0, 90, 120), no);
//            no++;
//        }
//    }
    
//    for (int i=0; i<row; i++) {
//        for (int j=0; j<colmn; j++) {
//            ofAddListener(button[i][j].event, this, &home::callback);
//            ofAddListener(button[i][j].event2, this, &home::touchUpEventCallback);
//        }
//    }
  
    
}

//--------------------------------------------------------------
void home::update(){
    if (getSharedData().bPuchi) {
        if (bHoverButton) {
            changeState("MovieScene");
            bHoverButton = false;
            

            buttons[targetBtnNo].touchUpEvent();
            buttons[targetBtnNo].color = ofColor(0, 160, 200);
        }
        getSharedData().bPuchi = false;
    }
    
}

//--------------------------------------------------------------
void home::draw(){
    
    ofBackground(60, 220, 250);
    for (int i=0; i<buttons.size(); i++) {
        buttons[i].draw();
    }
    
}

//--------------------------------------------------------------

void home::touchDown(ofTouchEventArgs &touch){

    for (int i=0; i<buttons.size(); i++) {
        ofVec2f pos = buttons[i].pos;
        int width = buttons[i].width;
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            buttons[i].fireEvent();
        }
    }

    
}

void home::touchUp(ofTouchEventArgs &touch){
    
    for (int i=0; i<buttons.size(); i++) {
        ofVec2f pos = buttons[i].pos;
        int width = buttons[i].width;
        if ((pos.x-touch.x) * (pos.x-touch.x) + (pos.y-touch.y) * (pos.y-touch.y) < width/2*width/2) {
            buttons[i].touchUpEvent();
        }
    }
    
}

void home::callback(int &val){
    getSharedData().startMovie = true;
    if (val == 1) {
        getSharedData().movieName = "egg.mov";
        getSharedData().stopPoint = 93;
        getSharedData().bStopPoint = true;
        getSharedData().touchPoint = ofVec2f(610, 200);
    }else if(val == 6){
        getSharedData().movieName = "tomato.mp4";
        getSharedData().stopPoint = 35;
        getSharedData().bStopPoint = true;
        getSharedData().touchPoint = ofVec2f(560, 180);
    }else{
        getSharedData().movieName = "purin.mp4";
        getSharedData().bStopPoint = false;
    }
    bHoverButton = true;
    targetBtnNo = val;
    
//    changeState("MovieScene");
}

void home::touchUpEventCallback(int &val){
    bHoverButton = false;
    
}



string home::getName(){
    return "home";
}
