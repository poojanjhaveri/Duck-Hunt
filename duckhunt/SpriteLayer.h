//
//  SpriteLayer.h
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/6/13.
//
// Sprite Layer to handle all the ducks, touches

#import "cocos2d.h"
#import "CCSprite.h"
#import "DuckSprite.h"
#import "SimpleAudioEngine.h"


@interface SpriteLayer : CCLayer
{
    DuckSprite *duck; // Adding Duck Sprite
 //   int speed;
//  float duckposx;
    
    
    BOOL waveover;  // Boolean to determine whether wave is over or not
    int bullets;    // Number of bullets
    int ducksdead;  // Number of ducks dead
    int duckspeed;  // Duck Speed

    CGSize size;
    
    NSMutableArray *m_DuckArray; // Array to hold all the ducks
}


-(void) update:(ccTime)dt;
-(void) startWave;
-(void) endWave;
-(void)removeAllDucks;

@property BOOL waveover;
@property int bullets;
@property int ducksdead;
@property int duckspeed;

@end
