//
//  GameplayScene.h
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/4/13.
//
//

#import "CCScene.h"
#import "SkyLayer.h"
#import "GroundLayer.h"
#import "UILayer.h"

@interface GameplayScene : CCScene
{
    int roundnumber; // Round number
    int wavenumber;     // Wave number
    int duckskilled;    // Ducks killed in wave
    
    
    // To implement a finite state machine depending on game state
    enum GameState
    {
        RoundBreak = 0,
        Wave,
        WaveBreak,
        GameOver
    };
    
    enum GameState m_State;
    
}

-(void) update:(ccTime)deltaTime;
@end
