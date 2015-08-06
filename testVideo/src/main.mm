#include "ofMain.h"
#include "ofApp.h"

int main(){
    ofAppiOSWindow * iOSWindow = new ofAppiOSWindow();
    
    iOSWindow->enableRetina();
    
    ofSetupOpenGL(iOSWindow, 568, 320, OF_FULLSCREEN);
    ofRunApp(new ofApp);
}
