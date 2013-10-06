//
//  LIYBoid.h
//  Boids
//
//  Created by Jason Cheladyn on 9/18/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CGPointExtension.h"
#import "ccMacros.h"

#define EDGE_NONE -1
#define EDGE_WRAP 0
#define EDGE_BOUNCE 1

@interface LIYBoid : SKSpriteNode
{
    @protected
    float _maxForce;
    float _maxSpeed;
    int _edgeBehavior;
    
    @public
    float _maxForceSQ;
    float _maxSpeedSQ;
    bool _doRotation;
    CGPoint _internalPosition;
    CGPoint _oldInternalPosition;
    CGPoint _velocity;
    CGPoint _acceleration;
    CGPoint _steeringForce;
    float _radius;
    float _wanderTheta;
    float _wanderMaxTurnCircleRadius;
    float _wanderTurningRadius;
    float _wanderLookAheadDistance;
    LIYBoid *_next;
}

@property (assign, nonatomic) float maxForce;
@property (assign, nonatomic) float maxSpeed;
@property (assign, nonatomic) bool doRotation;
@property (assign, nonatomic) int edgeBehavior;

- (void)setSpeedMax:(float)speed andSteeringForceMax:(float)force;
- (void)setSpeedMax:(float)speed withRandomRangeOf:(float)speedRange andSteeringForceMax:(float)force withRandomRangeOf:(float)forceRange;
- (void)setWanderingRadius:(float)radius lookAheadDistance:(float)distance andMaxTurningAngle:(float)turningAngle;
- (void)resetVectorsToZero;
- (void)setPos:(CGPoint)value;
- (void)update;
- (void)handleBorder;
- (void)brake:(float)breakingForce;
- (void)seek:(CGPoint)target usingMultiplier:(float)multiplier;
- (void)seek:(CGPoint)target withinRange:(float)range usingMultiplier:(float)multiplier;
- (void)arrive:(CGPoint)target withEaseDistance:(float)easeDistance usingMultiplier:(float)multiplier;
- (void)flee:(CGPoint)target panicAtDistance:(float)panicDistance usingMultiplier:(float)multiplier;
- (void)wander:(float)multiplier;
- (CGPoint)steer:(CGPoint)target easeAsApproaching:(BOOL)ease withEaseDistance:(float)easeDistance;
- (void)flock:(LIYBoid *)head withSeparationWeight:(float)separationWeight andAlignmentWight:(float)alignmentWeight andCohesionWeight:(float)coheasionWeight andSeparationDistance:(float)separationDistance andAlignmentDistance:(float)alignmentDistance andCoheasionDistance:(float)coheasionDistance;
- (void)separate:(LIYBoid *)head withSeparationDistance:(float)separationDistance usingMultiplier:(float)multiplier;
- (void)align:(LIYBoid *)head withAlignmentDistance:(float)neighborDistance usingMultiplier:(float)multiplier;
- (void)cohesion:(LIYBoid *)head withNeighborDistance:(float)neighborDistance uisingMultiplier:(float)multiplier;

float randRange(float min, float max);
CGPoint normalize(CGPoint point);
float getDistance(CGPoint pointA, CGPoint pointB);
float getDistanceSquared(CGPoint pointA, CGPoint pointB);

@end
