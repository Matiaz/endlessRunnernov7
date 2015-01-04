//
//  ERGPlayer.m
//  Endless Runner
//
//  Created by macadmin on 2014-11-04.
//  Copyright (c) 2014 com.trustedsite.prod. All rights reserved.
//

#import "ERGPlayer.h"

@implementation ERGPlayer


+ (ERGPlayer *) generatePlayer{
    
    ERGPlayer *player = [[ERGPlayer alloc] initWithImageNamed:@"character"];
    player.name = backgroundName;
    return player;
}


@end
