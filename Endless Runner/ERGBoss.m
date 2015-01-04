//
//  ERGBoss.m
//  Endless Runner
//
//  Created by macadmin on 2014-11-05.
//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import "ERGBoss.h"

@implementation ERGBoss

-(instancetype)init
{
    self = [super initWithImageNamed:@"boss"];
    {
        self.name = bossName;
        self.zPosition = 10;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.size.width, self.size.height)];
        self.physicsBody.dynamic = YES;
        self.physicsBody.mass = playerMass;
        self.physicsBody.collisionBitMask = playerCollisionBitmask;
        self.physicsBody.allowsRotation = NO;
        
    }
    return self;
}

@end
