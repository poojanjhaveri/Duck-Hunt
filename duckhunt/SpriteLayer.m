//
//  SpriteLayer.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/6/13.
//
//

#import "SpriteLayer.h"
#import "AppDelegate.h"

@implementation SpriteLayer
@synthesize waveover,ducksdead,bullets,duckspeed;
-(id)init{
    
    if(self=[super init])
    {
        self.isTouchEnabled = YES;
        self.bullets=3;
        self.waveover=YES;
        self.ducksdead=0;
        duckspeed=200;
        size = [[CCDirector sharedDirector] winSize];
        
        m_DuckArray = [[NSMutableArray alloc] init];
           }
    return self;
}

/* Spawns a Duck, sets its position and direction */
-(void)spawnDuck
{
   
    duck=[DuckSprite node];
        NSInteger duckrandom = arc4random()%4;
    
    // Making it randomly appear from any of the four edges of the screen
        switch (duckrandom) {
            case 0:
                duck.position = ccp(arc4random()%(int)size.width,duck.contentSize.height/2 );
                break;
                
            case 1:
                duck.position = ccp(arc4random()%(int)size.width, size.height-duck.contentSize.height/2);
                break;
                
            case 2:
                duck.position = ccp(duck.contentSize.width/2, arc4random()%(int)size.height);
                break;
                
            case 3:
                duck.position = ccp(size.width-duck.contentSize.width/2, arc4random()%(int)size.height);
                break;
                
                
                
            default:
                break;
        }
    
    duck.speed=duckspeed;
   // duck.position = ccp(duck.contentSize.width/2, arc4random()%(int)size.height);
    
    CGPoint center=CGPointMake(size.width/2, size.height/2);
    
    // Giving it a direction from the edge to center of screen
    duck.direction=ccpNormalize(ccpSub(center,duck.position));
 
        if(duck.direction.x<0)
        {
            duck.flipX=YES;
        }
    
    // Refresh and setup the animation
    [duck setupAnim ];
 
    [m_DuckArray addObject: duck];
    [self addChild:duck];
//}

    

}


/* Updates at delta time which calls update on ducksprite*/
-(void) update:(ccTime)dt
{
    for (DuckSprite *duckno in m_DuckArray)
    {
        [duckno update:dt];
    }
    
}


/* registering touch delegate */
- (void) registerWithTouchDispatcher
{
    [[CCDirector sharedDirector].touchDispatcher
     addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}


/* Touches began function */
- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(!waveover)
    {
    CGPoint location = [self convertTouchToNodeSpace: touch];
    // Do something with location here!
    
    self.bullets--;         // Decrement the bullets
        [[SimpleAudioEngine sharedEngine] playEffect:@"shot.wav"];
        if(self.bullets==0 || self.ducksdead==[m_DuckArray count])
        {
            [self endWave];    
        }


    // Check if the touch and duck frame rect coincides
    for(int i=0;i<m_DuckArray.count;i++)
    {
        if(CGRectContainsPoint([[m_DuckArray objectAtIndex:i] rect], location))
        {
            
            [self removeChild:[m_DuckArray objectAtIndex:i] cleanup:YES];
            [m_DuckArray removeObjectAtIndex:i];
            self.ducksdead++;
                       
            break;
        }
    }
    }
    
    
    return YES;
}


/* Start wave of ducks at regular interval */
-(void)startWave
{
    self.bullets=3;
    self.waveover=FALSE;
    self.ducksdead=0;

    // Delete any ducks if left
    while ([m_DuckArray count] > 0)
    {
        [self removeChild:[m_DuckArray objectAtIndex:0] cleanup:YES];
        [m_DuckArray removeObjectAtIndex:0];
    }
    
    // Spawn Ducks
    [self spawnDuck];
    [self spawnDuck];
    [self scheduleOnce:@selector(endWave) delay:8.0];
    
    
    
}


/* Ends a wave */
-(void)endWave
{
    [self unschedule:@selector(endWave)];
        self.waveover=TRUE;
}


// Removing all ducks
-(void)removeAllDucks
{
    while ([m_DuckArray count] > 0)
    {
        [self removeChild:[m_DuckArray objectAtIndex:0] cleanup:YES];
        [m_DuckArray removeObjectAtIndex:0];
    }
}

-(void)dealloc
{
    [super dealloc];
    [m_DuckArray dealloc];
//    [self dealloc];
}

@end
