#include "ofMain.h"
#include "ofApp.h"

int main(){
    ofAppiOSWindow * iOSWindow = new ofAppiOSWindow();
    
    iOSWindow->enableRetina();
    
    ofSetupOpenGL(iOSWindow, 568, 320, OF_FULLSCREEN);
    ofRunApp(new ofApp);
}

extern "C"{
    size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d ){
        return fwrite(a, b, c, d);
    }
    char* strerror$UNIX2003( int errnum ){
        return strerror(errnum);
    }
    time_t mktime$UNIX2003(struct tm * a){
        return mktime(a);
    }
    double strtod$UNIX2003(const char * a, char ** b) {
        return strtod(a, b);
    }
}