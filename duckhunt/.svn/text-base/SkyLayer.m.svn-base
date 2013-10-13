//
//  HelloWorldLayer.m
//  duckhunt
//
//  Created by Sanjay Madhav on 8/8/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "SkyLayer.h"
#import "Dog.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - SkyLayer

@implementation SkyLayer
{
    Dog *m_Dog;
}



// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
    // initwith color - to set color of the sky instead of image
	if( (self= [super initWithColor: ccc4(0, 191, 255, 255)]) )
	{
		
		m_Dog = [Dog node];
        [self addChild:m_Dog];

	}
	return self;
}


/* Calls the show dog function in dog when appropriate */
-(void) showMyDog:(enum DogState)state
{
    [m_Dog showDog:state];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
