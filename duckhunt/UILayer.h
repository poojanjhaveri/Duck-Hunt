//
//  UILayer.h
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/13/13.
//
//

#import "CCLayer.h"
#import "CCLabelTTF.h"

@interface UILayer : CCLayer
{
        CCLabelTTF* m_RoundLabel; // To show the round number
        CCLabelTTF* m_WaveLabel;  // To show number of ducks killed in wave
    CCLabelTTF* m_GameOverLabel;  // Game Over Label

}

// Functions to show and hide label

-(void) showRoundLabel:(int)num;
-(void) showGameOverLabel;
-(void) hideRoundLabel;
-(void) showWaveLabel:(int)num;
-(void) hideWaveLabel;
-(void) hideGameOverLabel;
@end
