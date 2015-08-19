
#include "sharedData.h"

void sharedData::btnSetup(){
    btnSize = 118;
    btnSpaceX = 23;
    btnSpaceY = 5;
    btnBeginPoint = ofVec2f(75, 75);
    colmn = 5;
    row = 10;
    for (int i=0; i<row; i++) {
        for (int j=0; j<colmn; j++) {
            ofVec2f tmp = ofVec2f(i*(btnSize+btnSpaceX)+btnBeginPoint.x, j*(btnSize+btnSpaceY)+btnBeginPoint.y);
            if (j%2==1) {
                tmp -= ofVec2f((btnSize+btnSpaceX)/2, 0);
            }
            btnPos.push_back(tmp);
        }
    }
    
    for (int i=0; i<btnPos.size(); i++) {
        Button btn;
        button.push_back(btn);
        ofVec2f p = btnPos[i];
        int w = btnSize;
        int h = btnSize;
        button[i].setup(p, w, h, i);
    }
    for (int i=0; i<button.size(); i++) {
        ofAddListener(button[i].downEvents[0], this, &sharedData::touchDownEventCbOp);
        ofAddListener(button[i].upEvents[0], this, &sharedData::touchUpEventCbOp);
        ofAddListener(button[i].downEvents[1], this, &sharedData::touchDownEventCbHome);
        ofAddListener(button[i].upEvents[1], this, &sharedData::touchUpEventCbHome);


    }
    
    json.open("data.json");

    
}



void sharedData::touchDownEventCbOp(int &val){
    bHoverButton = true;
}

void sharedData::touchUpEventCbOp(int &val){
    bHoverButton = false;
}

void sharedData::touchDownEventCbHome(int &val){
    ofVec2f buttonPos = button[val].pos;
    cout << buttonPos << endl;
    
    float minLength = 10000000;
    ofVec2f moviePos;
    string movieName;
    for (int i=0; i<json.getMemberNames().size(); i++) {
        string tmpName = json.getMemberNames()[i];
        ofVec2f tmpPos = ofVec2f(json[tmpName]["x"].asInt(), json[tmpName]["y"].asInt());
        tmpPos = ofVec2f(tmpPos.x/1280.0*(ofGetWidth()+magnifySize.x)-magnifySize.x/2,
                             tmpPos.y/720.0*(ofGetHeight()+magnifySize.y)-magnifySize.y/2);

        float tmpLength = (buttonPos-tmpPos).length();
        if (tmpLength < minLength) {
            minLength = tmpLength;
            movieName = tmpName;
            moviePos = tmpPos;
        }
        
    }
    
    if (abs(buttonPos.x - moviePos.x) < magnifySize.x/2 && abs(buttonPos.y - moviePos.y) < magnifySize.y/2) {
        movieTrans = buttonPos - moviePos;
    }else{
        movieTrans = ofVec2f(0, 0);
        movieName = "egg";
    }
    cout << "nearMovieName: " << movieName << endl;
    cout << "trans        : " << movieTrans << endl;
    
    trgBtnNo = val;
    startMovie = true;
    bHoverButton = true;
    targetBtnNo = val;
    loadedVideo.loadMovie("movies/"+movieName+".mp4");
}

void sharedData::touchUpEventCbHome(int &val){
    bHoverButton = false;
}



