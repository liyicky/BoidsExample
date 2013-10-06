//
//  LIYMainScene.m
//  Boids
//
//  Created by Jason Cheladyn on 9/18/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import "LIYMainScene.h"


@interface LIYMainScene()

@end

@implementation LIYMainScene
@synthesize _flockPointer;
@synthesize _currentTouch;

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
//        self.physicsWorld.gravity = CGPointMake(0, 0);
//        self.physicsWorld.contactDelegate = self;
        
        [self setUp];
    }
    return self;
}

- (void)didMoveToView:(SKView *)view
{

}

- (void)setUp
{
    srandom(time(NULL));
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenSize.size.width;
    CGFloat screenHeight = screenSize.size.height;
    
    self._currentTouch = CGPointZero;
    
    CGSize boidSize = CGSizeMake(5, 5);
    
    _flockPointer = [[LIYBoid alloc] init];
    _flockPointer.color = [SKColor whiteColor];
    _flockPointer.size = boidSize;
    LIYBoid *previousBoid = _flockPointer;
    LIYBoid *boid = _flockPointer;
    
    float count = 80.0f;
    for (int i = 0; i < count; i++) {
        if (i != 0) {
            boid = [[LIYBoid alloc] init];
            boid.color = [SKColor whiteColor];
            boid.size = boidSize;

            previousBoid->_next = boid;
        }
        
        previousBoid = boid;
        boid.doRotation = NO;
        
        [boid setSpeedMax:1.2f withRandomRangeOf:0.15f andSteeringForceMax:1.0f withRandomRangeOf:0.15f];
        [boid setWanderingRadius:16.0f lookAheadDistance:40.0f andMaxTurningAngle:0.2f];
        [boid setEdgeBehavior:EDGE_WRAP];
//        [boid setScale:0.5 + CCRANDOM_0_1()];
        [boid setPos:ccp(CCRANDOM_MINUS1_1() * screenWidth, screenHeight/2)];
        [self addChild:boid];
    }
    
}

- (void)update:(NSTimeInterval)currentTime
{
    [self tick];
}
 
- (void)tick
{
    LIYBoid *boid = _flockPointer;
    while (boid) {
        LIYBoid *b = boid;
        boid = b->_next;
        [b wander:0.15f];
        [b flock:_flockPointer
            withSeparationWeight:0.1f
            andAlignmentWight:0.1f
            andCohesionWeight:0.2f
            andSeparationDistance:10.0f
            andAlignmentDistance:30.0f
            andCoheasionDistance:20.0f];
        
        if (CGPointEqualToPoint(_currentTouch, CGPointZero) == NO) {
            [b flee:self._currentTouch panicAtDistance:65 usingMultiplier:0.25f];
        }
        
        [b update];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    self._currentTouch = [touch locationInNode:self];
    NSLog(@"Touch %f %f", self._currentTouch.x, self._currentTouch.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    self._currentTouch = [touch locationInNode:self];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self._currentTouch = CGPointZero;
}

@end
