//
//  HelloWorldLayer.h
//  duckhunt
//
//  Created by Sanjay Madhav on 8/8/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//
// Sky layer - also adds the Dig


#import <GameKit/GameKit.h>
#import "Dog.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface SkyLayer : CCLayerColor
{
}

-(void) showMyDog:(enum DogState)state;

@end
