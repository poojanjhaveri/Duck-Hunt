//
//  UILayer.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/13/13.
//
//

#import "UILayer.h"

#import "AppDelegate.h"

@implementation UILayer


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self= [super init]) )
	{
		
		// ask director for the window size
        //	CGSize size = [[CCDirector sharedDirector] winSize];
		CGSize size = [[CCDirector sharedDirector] winSize];
        m_RoundLabel = [CCLabelTTF labelWithString:@"Round 1" fontName:@"Marker Felt"
                                          fontSize:30];
        m_RoundLabel.position = ccp(size.width/2, size.height/2);
        m_RoundLabel.visible = NO;
        [self addChild: m_RoundLabel];
        
        m_WaveLabel =[CCLabelTTF labelWithString:@"Got 2/2 ducks!" fontName:@"Marker Felt"
                                        fontSize:26];
        m_WaveLabel.position = ccp(size.width/2, size.height/2);
        m_WaveLabel.visible = NO;
        [self addChild:  m_WaveLabel];
        
        
        
        m_GameOverLabel = [CCLabelTTF labelWithString:@"Game Over" fontName:@"Marker Felt"
                                          fontSize:30];
        m_GameOverLabel.position = ccp(size.width/2, size.height/2);
        m_GameOverLabel.visible = NO;
        [self addChild: m_GameOverLabel];
        
        
	}
	return self;
}


-(void) showRoundLabel:(int)num
{
    m_RoundLabel.string = [NSString stringWithFormat:@"Round %d", num];
    m_RoundLabel.visible = YES;
}


-(void) showGameOverLabel
{
    m_GameOverLabel.visible=YES;
}

-(void) hideRoundLabel
{
    m_RoundLabel.visible=NO;
}

-(void) showWaveLabel:(int)num
{
    m_WaveLabel.string = [NSString stringWithFormat:@"Got %d ducks", num];
    m_WaveLabel.visible = YES;
}

-(void) hideWaveLabel
{
    m_WaveLabel.visible=NO;
}

-(void) hideGameOverLabel
{
    m_GameOverLabel.visible=NO;
}



@end
