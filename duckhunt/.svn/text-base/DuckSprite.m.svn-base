//
//  DuckSprite.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/11/13.
//
//

#import "DuckSprite.h"
#import "AppDelegate.h"

@implementation DuckSprite
@synthesize direction = m_Direction,speed;

-(id)init{
    
    if(self=[super initWithFile:@"duck.png"])
    {
         size = [[CCDirector sharedDirector] winSize];
   //     self.position = ccp(self.contentSize.width/2, size.height-self.contentSize.height/2);
  
        duckposx=self.contentSize.width/2;
        
        
        // Load the texture packer file
        [[CCSpriteFrameCache sharedSpriteFrameCache]
         addSpriteFramesWithFile:@"sprites.plist"];
        
               
    }
    return self;
}

/* Setting up animation - changing animation based on direction */
- (void) setupAnim
{
   
    
    
    NSMutableArray* files;
    CGPoint zeropoint = CGPointMake(0, 1);
    
    // Dot product of up vector and direction
    double dot=ccpDot(zeropoint, self.direction);
    if(dot > 0.7)
    {
        files = [NSMutableArray arrayWithObjects: @"duck-06.png",
                 @"duck-07.png", @"duck-08.png", nil];
    }
    else if(dot >0.2)
    {
        files = [NSMutableArray arrayWithObjects: @"duck-03.png",
                 @"duck-04.png", @"duck-05.png", nil];
    }
    else
    {
        files = [NSMutableArray arrayWithObjects: @"duck-00.png",
                 @"duck-01.png", @"duck-02.png", nil];
    }
    
    
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < files.count; i++)
    {
        NSString* file = [files objectAtIndex:i];
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:file];
        [frames addObject:frame];
    }
    // Clear any previous actions
    [self stopAllActions];
    // Start new animation
    CCAnimation* anim = [CCAnimation animationWithSpriteFrames:frames
                                                         delay:0.15f];
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
    [self runAction:repeat];
}


/* Update function at delta time - updates the position and direction of time */
-(void) update:(ccTime)dt
{
    
      if(self.position.x>size.width)
    {
        self.direction = ccp(-self.direction.x,self.direction.y);
        self.flipX=YES;
        [self setupAnim];
        
       
    }
    else if(self.position.x<0)
    {
        self.direction = ccp(-self.direction.x,self.direction.y);
        self.flipX=NO;
        [self setupAnim];

    }
    
    if(self.position.y>size.height)
    {
        self.direction = ccp(self.direction.x,-self.direction.y);
        [self setupAnim];
    }
    else if(self.position.y<0)
    {
        self.direction = ccp(self.direction.x,-self.direction.y);
        [self setupAnim];
    }

 //   [self setupAnim];
    
  // self.position = ccp(duckposx, self.position.y);
    self.position = ccpAdd(self.position, ccpMult(m_Direction, speed * dt));
  
}

// gets the frame rect for duck
- (CGRect) rect
{
    return CGRectMake(self.position.x - self.contentSize.width
                      * self.anchorPoint.x,
                      self.position.y - self.contentSize.height
                      * self.anchorPoint.y,
                      self.contentSize.width,
                      self.contentSize.height);
}




@end
