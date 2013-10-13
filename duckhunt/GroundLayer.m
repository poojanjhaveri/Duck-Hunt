//
//  GroundLayer.m
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/4/13.
//
//

#import "GroundLayer.h"


@implementation GroundLayer

-(id)init
{
    if(self=[super init])
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *background;
		background = [CCSprite spriteWithFile:@"game_background.png"];
				
		background.position = ccp(size.height-80,size.width-320);
		
		// add the image as a child to this Layer
		[self addChild: background];

    }
    return self;
}

@end
