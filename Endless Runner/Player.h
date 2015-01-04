//
//  Player.h
//  Chapter2Game
//
//  Created by Joseph Moscatiello on 2014-11-03.
//  Copyright (c) 2014 Joseph Moscatiello. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum playerState{
    playerStateRunning = 0,
    playerStateJumping,
    playerStateInAir
} playerState;

@interface Player : SKSpriteNode

  @property (assign, nonatomic) playerState animationState;

   //touch class
  @property (assign) BOOL selected;
  @property (assign) BOOL accelerating;

  @property (strong, nonatomic) NSMutableArray *runFrames;
  @property (strong, nonatomic) NSMutableArray *jumpFrames;

   @property (strong, nonatomic) NSMutableArray *shieldOnFrames;
   @property (strong, nonatomic) NSMutableArray *shieldOffFrames;
   @property (strong, nonatomic) SKSpriteNode *shield;
   @property (assign, nonatomic) BOOL shielded;

@end
