//
//  ERGMyScene.h
//  Endless Runner
//

//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ERGBackground.h"
#import "Player.h"
#import "ERGScoreLabel.h"
#import "ERGBoss.h"

@interface ERGMyScene : SKScene


@property double score;

@property (strong, nonatomic) ERGScoreLabel *scoreLabel;
@property (strong, nonatomic) ERGBackground *currentBackground;
@property (assign) NSInteger moveSpeed;

@property CFTimeInterval lastUpdateTimeInterval;

@end
