//
//  GameplayScene.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/4/13.
//
//

#import "GameplayScene.h"
#import "SpriteLayer.h"
#import "UILayer.h"
#import "MainMenuLayer.h"
#import "Dog.h"
#import "SkyLayer.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"

@implementation GameplayScene
{
    SpriteLayer *ducks;
    UILayer *statLayer;
    SkyLayer *sky;
    
}

-(id) init
{
	
	if( (self=[super init]) )
	{
        
        roundnumber=0;
        duckskilled=0;
        wavenumber=0;
        
        sky=[SkyLayer node];
        [self addChild:sky];
        GroundLayer *ground=[GroundLayer node];
        [self addChild:ground z:1];
        ducks=[SpriteLayer node];
        [self addChild:ducks z:1];
        
        
        statLayer = [UILayer node];
        [self addChild:statLayer z:4];
        
        
        [self scheduleUpdate];
        [self startRoundBreak];
        
        
        
    }
    return self;
}


-(void) update:(ccTime)deltaTime
{

    [ducks update:deltaTime];
 //   NSLog(@"%d",ducks.waveover);
    if(ducks.waveover==TRUE && m_State==Wave)
    {
        [self startWaveBreak];
    }
}


-(void)startRoundBreak
{
   
    m_State=RoundBreak;
    roundnumber++;
    if(roundnumber==1)
    {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"start_game_music.mp3"
                                                         loop:NO];
    }
    else{
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"next_round_music.mp3"
                                                         loop:NO];
    }

    wavenumber=0;
    duckskilled=0;
    ducks.duckspeed=200+(roundnumber-1)*100;
    [statLayer showRoundLabel:roundnumber];
  //  [statLayer hideWaveLabel];
    [self scheduleOnce:@selector(startWave) delay:5];
}

-(void)startGameOver
{
    m_State=GameOver;
    [statLayer showGameOverLabel];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"game_over_music.mp3"
                                                     loop:NO];
    [sky showMyDog:laughing];
    [self scheduleOnce:@selector(exitScene) delay:3];
}

-(void)exitScene
{
    [statLayer hideGameOverLabel];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade
                                               transitionWithDuration:0.5 scene:[MainMenuLayer scene]]];
}


-(void)startWave
{
    m_State=Wave;
    wavenumber++;
    [ducks startWave];
    [self schedule:@selector(duckQuack) interval:0.25f];
 //   [statLayer hideWaveLabel];
    [statLayer hideRoundLabel];
}



-(void)duckQuack
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"duck_quack.wav"];
}

-(void)startWaveBreak
{
    [self unschedule:@selector(duckQuack)];
    m_State=WaveBreak;
    [ducks removeAllDucks];
    duckskilled=duckskilled+[ducks ducksdead];
  //  [statLayer showWaveLabel:[ducks ducksdead]];
    if(wavenumber==5)
    {
        if(duckskilled<6)
        {
            [self startGameOver];
            return;
        }
        else{
            [self scheduleOnce:@selector(startRoundBreak) delay:3];
        }
    }
    else
    {
        [self scheduleOnce:@selector(startWave) delay:3];
    }
    
    if([ducks ducksdead]==2)
    {
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"got_ducks_music.mp3"
                                                         loop:NO];
        [sky showMyDog:twoduck];
    }
    else if([ducks ducksdead]==1)
    {
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"got_ducks_music.mp3"
                                                         loop:NO];
         [sky showMyDog:oneduck];
    }
    else{
  //      [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"game_over_music.mp3"loop:NO];
        [sky showMyDog:laughing];
    }
    
}




@end
