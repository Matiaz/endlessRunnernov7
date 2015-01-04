//
//  Player.m
//  Chapter2Game
//
//  Created by Joseph Moscatiello on 2014-11-03.
//  Copyright (c) 2014 Joseph Moscatiello. All rights reserved.
//

#import "Player.h"

@implementation Player


-(instancetype)init
{
    self = [super initWithImageNamed:@"character"];
    {
        self.name = playerName;
        self.zPosition = 10;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width, self.size.height)];
        self.physicsBody.dynamic = YES;
        self.physicsBody.mass = playerMass;
        self.physicsBody.collisionBitMask = playerCollisionBitmask;
        self.physicsBody.allowsRotation = NO;
        
        self.shield = [[SKSpriteNode alloc] init];
        self.shield.blendMode = SKBlendModeAdd;
        [self addChild:self.shield];
        
        [self setupRunningAnimations];
        [self setupJumpingAnimations];
        [self startRunningAnimation];
        [self setupShieldAnimations];
        
        
    }
    return self;
}

-(void) setupRunningAnimations
{
      self.runFrames = [[NSMutableArray alloc] init];
      SKTextureAtlas *runAtlas = [SKTextureAtlas atlasNamed:@"run"];
    
      for(int i = 0; i < [runAtlas.textureNames count]; i++)
      {
        NSString *tempName = [NSString stringWithFormat:@"run%.3d", i];
        
        SKTexture *tempTexture = [runAtlas textureNamed:tempName];
        
        if(tempTexture)
        {
            [self.runFrames addObject:tempTexture];
        }
        
    }
}

 -(void) stopRunningAnimation
 {
     [self removeActionForKey:@"running"];
 }

-(void) startRunningAnimation{
    
    if(![self actionForKey:@"running"]){
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.runFrames timePerFrame:0.09 resize:YES restore:NO]] withKey:@"running"];
    }
}

-(void) setupJumpingAnimations
{
    self.jumpFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *jumpAtlas = [SKTextureAtlas atlasNamed:@"jump"];
    
    for(int i = 0; i < [jumpAtlas.textureNames count]; i++)
    {
        NSString *tempName = [NSString stringWithFormat:@"jump%.3d", i];
        
        SKTexture *tempTexture = [jumpAtlas textureNamed:tempName];
        
        if(tempTexture)
        {
            [self.jumpFrames addObject:tempTexture];
        }
        
    }
}

-(void) startJumpingAnimation{
    if(![self actionForKey:@"jumping"])
    {
        [self runAction:[SKAction sequence:@[[SKAction animateWithTextures:self.jumpFrames timePerFrame:0.09 resize:YES restore:NO], [SKAction runBlock:^{
            self.animationState = playerStateInAir;
        }]]] withKey:@"jumping"];
    }
}

-(void) setAnimationState:(int)animationState{
    
    switch(animationState){
        case playerStateJumping:
            if(_animationState == playerStateRunning){
                [self stopRunningAnimation];
                [self startJumpingAnimation];
            }
            break;
        case playerStateInAir:
            [self stopRunningAnimation];
            break;
        case playerStateRunning:
            [self startRunningAnimation];
            break;
        default:
            break;
    }
}


-(void) setShielded:(BOOL)shielded{
    
    if(shielded)
    {
        if(![self.shield actionForKey:@"shieldedOn"])
        {
            [self.shield runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.shieldOnFrames timePerFrame:0.1 resize:YES restore:NO]] withKey:@"shieldedOn"];
        }
    }
    else if(_shielded)
    {
        [self blinkRed];
        [self.shield removeActionForKey:@"shieldedOn"];
        [self.shield runAction:[SKAction animateWithTextures:self.shieldOffFrames timePerFrame:0.15] withKey:@"shieldOff"];
    }
    _shielded = shielded;
    
}

-(void) blinkRed{
    SKAction *blinkRed = [SKAction sequence:@[[SKAction colorizeWithColor:[SKColor redColor] colorBlendFactor:1.0 duration:0.2],
                          [SKAction waitForDuration:0.1],
                          [SKAction colorizeWithColorBlendFactor:0.0 duration:0.2]]];
    [self runAction:blinkRed];
    
}


-(void) setupShieldAnimations{
    
    self.shieldOnFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *shiledOnAtlas = [SKTextureAtlas atlasNamed:@"shield"];
    
    for(int i = 0; i < [shiledOnAtlas.textureNames count]; i++)
    {
        NSString *tempName = [NSString stringWithFormat:@"shield%.3d", i];
        
        SKTexture *tempTexture = [shiledOnAtlas textureNamed:tempName];
        
        if(tempTexture)
        {
            [self.shieldOnFrames addObject:tempTexture];
        }
    
    }
    
    
    self.shieldOffFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *shiledOffAtlas = [SKTextureAtlas atlasNamed:@"deplete"];
    
    for(int i = 0; i < [shiledOffAtlas.textureNames count]; i++)
    {
        NSString *tempName = [NSString stringWithFormat:@"deplete%.3d", i];
        
        SKTexture *tempTexture = [shiledOffAtlas textureNamed:tempName];
        
        if(tempTexture)
        {
            [self.shieldOffFrames addObject:tempTexture];
        }
        
    }
    
}











@end




