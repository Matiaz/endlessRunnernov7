//
//  ERGScoreLabel.m
//  Endless Runner
//
//  Created by macadmin on 2014-11-04.
//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import "ERGScoreLabel.h"

@implementation ERGScoreLabel

+ (ERGScoreLabel *) generateScore{
    
    ERGScoreLabel *scoreLabel = [[ERGScoreLabel alloc] initWithFontNamed:@"Chalkduster"];
    scoreLabel.fontSize = 15;
    scoreLabel.color = [UIColor blackColor];
    scoreLabel.position = CGPointMake(100, 300);
    scoreLabel.zPosition = 5;
    
    return scoreLabel;
}

@end
