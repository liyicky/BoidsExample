//
//  LIYMainScene.h
//  Boids
//
//  Created by Jason Cheladyn on 9/18/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LIYBoid.h"

@interface LIYMainScene : SKScene <SKPhysicsContactDelegate>
{
    LIYBoid *_flockPointer;
    
    CGPoint _currentTouch;
}

@property (retain, nonatomic) LIYBoid *_flockPointer;
@property (assign, nonatomic) CGPoint _currentTouch;

- (void)tick:(NSTimer *)dt;
@end
