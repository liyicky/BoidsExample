//
//  LIYMainViewController.m
//  Boids
//
//  Created by Jason Cheladyn on 9/18/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import "LIYMainViewController.h"
#import "LIYMainScene.h"

@interface LIYMainViewController ()

@end

@implementation LIYMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    SKView *view = (SKView *)self.view;
    view.showsFPS = YES;
    view.showsNodeCount = YES;
    view.showsDrawCount = YES;
    
    SKScene *scene = [LIYMainScene sceneWithSize:view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [view presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}


@end
