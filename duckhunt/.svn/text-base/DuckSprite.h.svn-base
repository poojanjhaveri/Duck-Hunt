//
//  DuckSprite.h
//  duckhunt
//
//  Created by Poojan Jhaveri on 9/11/13.
//
// Sprite For single duck

#import "CCSprite.h"

@interface DuckSprite : CCSprite
{
   
    int speed;              // Speed of the duck
     float duckposx;
    CGSize size;          // Size of the screen
    CGPoint m_Direction; // Direction vector
    
    
    // Duck State for determing the animation to be performed for the duck
    enum DuckState
    {
        one,
        two,
        three
    };
    
    enum DuckState duck_State;
    
    
}

-(void) update:(ccTime)dt;
- (void) setupAnim;

-(CGRect) rect;
@property CGPoint direction;
@property int speed;
@end
