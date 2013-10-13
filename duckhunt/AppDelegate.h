//
//  AppDelegate.h
//  duckhunt
//
//  Created by Sanjay Madhav on 8/8/12. (ITP 382)
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
