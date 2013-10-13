//
//  Dog.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/14/13.
//
//

#import "Dog.h"
#import "AppDelegate.h"

@implementation Dog

-(id)init{
    
    if(self=[super init])
    {
        size = [[CCDirector sharedDirector] winSize];
        self.position = ccp(size.width/2, 0);
        
        // Setting default visibility to false as we only want to show it when the wave ends
        [self setVisible:NO];
        
        // Loading the texture packer file
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]
         addSpriteFramesWithFile:@"sprites.plist"];
        
        
    }
    return self;
}


- (void) setupAnim
{
    // Making it Visible
    [self setVisible:YES];
    NSMutableArray* files;
    

     files = [NSMutableArray arrayWithObjects: @"dog-caught-00.png",nil];
    
    // Loading the File based on the state of the dog and how many ducks killed
    if(d_State==oneduck)
    {
        files = [NSMutableArray arrayWithObjects: @"dog-caught-00.png",nil];
    }
    else if(d_State==twoduck)
    {
        files = [NSMutableArray arrayWithObjects: @"dog-caught-01.png",nil];
    }
    else if(d_State==laughing)
    {
        files = [NSMutableArray arrayWithObjects: @"dog-laugh-00.png", @"dog-laugh-01.png", nil];
    }
    
    // Adding all the files
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


-(void) showDog:(enum DogState)state;
{
     d_State = state;
    if(state==laughing)
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"dog_laugh.wav"];
    }
    else
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"dog_bark.wav"];
    }
    
   // Starting the animation
    [self setupAnim];
    [self runAction:[CCMoveBy actionWithDuration:0.5f position:ccp(0,80)]];
    
    // Hiding the dog after time
    [self scheduleOnce:@selector(hideDog) delay:2.5f];
}


// Hide the Dog since the wave has ended
-(void) hideDog
{
    [self runAction:[CCMoveBy actionWithDuration:0.5f position:ccp(0,-80)]];
}



@end
