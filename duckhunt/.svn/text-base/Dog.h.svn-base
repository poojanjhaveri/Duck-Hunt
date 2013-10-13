//
//  Dog.h
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/14/13.
//
//Dog Class - CCSprite to add dog layer and animations


#import <UIKit/UIKit.h>
#import "CCSprite.h"

@interface Dog : CCSprite
{
    CGSize size;                        // Size of the screen
    
    enum DogState               
    {                                  // Enum for determining which dog animation needs to be performed
        oneduck = 0,
        twoduck,
        laughing
    };
    
    enum DogState d_State;

}

-(void) showDog:(enum DogState)state;   // Function to change the dog state and make it visible
@end
