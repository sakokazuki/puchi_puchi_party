
#include "sharedData.h"

void sharedData::btnSetup(){
    btnSize = 118;
    btnSpaceX = 30;
    btnSpaceY = 12;
    btnBeginPoint = ofVec2f(55, 62);
    colmn = 8;
    row = 15;
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
        
        int space = 20;
        if ((p.x < w/2-space || p.y < h/2-space) || (p.x > ofGetHeight()-w/2+space || p.y > ofGetWidth()-h/2+space)) {
            button[i].bTouched = true;
        }
    }
    for (int i=0; i<button.size(); i++) {
        ofAddListener(button[i].downEvents[0], this, &sharedData::touchDownEventCbOp);
        ofAddListener(button[i].upEvents[0], this, &sharedData::touchUpEventCbOp);
        ofAddListener(button[i].downEvents[1], this, &sharedData::touchDownEventCbHome);
        ofAddListener(button[i].upEvents[1], this, &sharedData::touchUpEventCbHome);

    }
    
    sePlayer.loadSound("sounds/cursor7.mp3");
    sePlayer.setLoop(false);
    json.open("data.json");
    
    ofDirectory dir("movies/");
    dir.allowExt("mp4");
    dir.listDir();
    
    for(int i = 0; i < dir.numFiles(); i++){
        movieList.push_back(dir.getName(i));
    }
    
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
            movieName = tmpName+".mp4";
            moviePos = tmpPos;
        }
        
    }
    
    if (abs(buttonPos.x - moviePos.x) < magnifySize.x/2 && abs(buttonPos.y - moviePos.y) < magnifySize.y/2) {
        movieTrans = buttonPos - moviePos;
    }else{
        movieTrans = ofVec2f(0, 0);
        int randomNo = ofRandom(0, movieList.size());
        movieName = movieList[randomNo];
    }
    cout << "nearMovieName: " << movieName << endl;
    cout << "trans        : " << movieTrans << endl;
    cout << "val          : " << val << endl;
    
    if (movieName == "credit") {
        bCredit = true;
    }else{
        bCredit = false;
    }
    if(movieName == "twitter"){
        bTw = true;
    }else{
        bTw = false;
    }
    if(movieName == "facebook"){
        bFb = true;
    }else{
        bFb = false;
    }
    
    cout << "bcredit " << bCredit << endl;
    
    trgBtnNo = val;
    targetBtnNo = val;
    bHoverButton = true;
    
    if (!bCredit || !bTw || !bFb) {
        loadedVideo.loadMovie("movies/"+movieName);
        cout << "touchdownevent------=+++++++++++++++++++++++" << endl;
    }
    
}

void sharedData::touchUpEventCbHome(int &val){
    bHoverButton = false;
}

void sharedData::sePlay(){
    sePlayer.play();
    cout << "soundplay" << endl;
}



