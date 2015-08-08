#include "home.h"

//--------------------------------------------------------------
void home::setup(){
    btnSize = 118;
    btnSpace = 30;
    colmn = 5;
    row = 10;
    
    
    int no = 0;
    for (int i=0; i<row; i++) {
        vector<Button> tmp1;
        button.push_back(tmp1);
        for (int j=0; j<colmn; j++) {
            Button tmp2;
            button[i].push_back(tmp2);
            
            ofVec2f btnPos = ofVec2f(i*(btnSize+btnSpace), j*(btnSize+btnSpace));
            if (j%2==1) {
                btnPos = ofVec2f(i*(btnSize+btnSpace)+(btnSize+btnSpace)/2, j*(btnSize+btnSpace));
            }
    
            button[i][j].setup(btnPos, btnSize, btnSize, ofColor(231, 255, 67), no, "circle");
            
            no++;
        }
    }
    
    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            ofAddListener(button[i][j].event, this, &home::callback);
        }
    }
  
    
}

//--------------------------------------------------------------
void home::update(){
    
}

//--------------------------------------------------------------
void home::draw(){
    ofBackground(60, 220, 250);

    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            button[i][j].draw();
        }
    }
    
    
    
    ofSetColor(30);
    ofDrawBitmapString("home", 20, 20);
}

//--------------------------------------------------------------

void home::touchDown(ofTouchEventArgs &touch){
    cout << "--------------------------" << endl;
    ofVec2f touchPoint = ofVec2f(touch.x, touch.y);
    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            button[i][j].fireEvent(touchPoint);
        }
    }
    
}

void home::callback(int &val){
    cout << val << endl;
}


string home::getName(){
    return "home";
}
