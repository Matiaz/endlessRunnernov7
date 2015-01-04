//
//  ERGBackground.m
//  Endless Runner
//
//  Created by macadmin on 2014-11-04.
//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import "ERGBackground.h"

@implementation ERGBackground

+ (ERGBackground *) generateBackground{
    
    ERGBackground *background = [[ERGBackground alloc] initWithImageNamed:@"background"];
    
    background.anchorPoint = CGPointMake(0,0);
    background.name = backgroundName;
    background.position = CGPointMake(0,0);
    
    //Add bounding box for bottom of screen
    background.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 30) toPoint:CGPointMake(background.size.width, 30)];
    background.physicsBody.collisionBitMask = playerCollisionBitmask;
    
    SKNode *topCollider = [SKNode node];
    topCollider.position = CGPointMake(0,0);
    topCollider.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, background.size.height-30) toPoint:CGPointMake(background.size.width, background.size.height - 30)];
    
    topCollider.physicsBody.collisionBitMask = playerCollisionBitmask;
    [background addChild:topCollider];
    
    
    /*SKNode *sideCollider = [SKNode node];
    sideCollider.position = CGPointMake(0,0);
    sideCollider.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(background.size.width - 50, 30) toPoint:CGPointMake(background.size.width - 50, background.size.height - 30)];
    
    sideCollider.physicsBody.collisionBitMask = playerCollisionBitmask;
    [background addChild:sideCollider];*/
    
    
    return background;
}

@end
