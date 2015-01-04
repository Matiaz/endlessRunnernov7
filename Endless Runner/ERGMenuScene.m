//
//  ERGMenuScene.m
//  Endless Runner
//
//  Created by macadmin on 2014-11-07.
//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import "ERGMenuScene.h"
#import "ERGMyScene.h"

@implementation ERGMenuScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {

        self.startLabel = [[SKLabelNode alloc] init];
        self.startLabel.position = CGPointMake(300, 200);
        self.startLabel.text = @"Start Game";
        self.startLabel.name = @"start";
        
    
        self.fastNode = [[SKSpriteNode alloc] initWithImageNamed:@"fast" ];
        self.fastNode.position = CGPointMake(120,  150);
        self.anchorPoint = CGPointMake(0, 0);
        self.fastNode.name = @"fast";
        
        self.slowNode = [[SKSpriteNode alloc] initWithImageNamed:@"slow_unclicked"];
        self.slowNode.position = CGPointMake(300, 150);
         self.anchorPoint = CGPointMake(0, 0);
        self.slowNode.name = @"slow";
        
        [self addChild:self.startLabel];
        [self addChild:self.fastNode];
        [self addChild:self.slowNode];

    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    //Player *player = (Player *)[self childNodeWithName:playerName];
    
    UITouch *touch = [touches anyObject];
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:[touch locationInNode:self]];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if([touchedNode.name  isEqual: @"start"])
    {
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        SKScene *myScene = [[ERGMyScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:reveal];
        NSLog(@"player touched");
    }
    
    //if player touches fast image
    if([touchedNode.name  isEqual: @"fast"])
    {
        [prefs setInteger:200 forKey:@"screenMovingSpeed"];
        [prefs setObject:@"Hello" forKey:@"susermessage"];
         NSLog(@"Fast touched");
        self.slowNode.texture = [SKTexture textureWithImageNamed:@"slow_unclicked"];
        self.fastNode.texture = [SKTexture textureWithImageNamed:@"fast_clicked"];
    }
    
    if([touchedNode.name  isEqual: @"slow"])
    {
        [prefs setInteger:40 forKey:@"screenMovingSpeed"];
        [prefs setObject:@"Hello" forKey:@"susermessage"];
        self.fastNode.texture = [SKTexture textureWithImageNamed:@"fast"];
        self.slowNode.texture = [SKTexture textureWithImageNamed:@"slow_clicked"];
         NSLog(@"Slow touched");
    }
}

@end
