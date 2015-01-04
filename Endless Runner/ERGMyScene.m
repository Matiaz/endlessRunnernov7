
#import "ERGMyScene.h"

@implementation ERGMyScene

SKLabelNode *myLabel;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        self.physicsWorld.gravity = CGVectorMake(0, -4.8);
        
        //add score
        self.score = 0;
        self.scoreLabel = [ERGScoreLabel generateScore];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %3.0f",self.score];
    
        //Add background
        self.currentBackground = [ERGBackground generateBackground];
        
        //Add Player
        Player *player = [[Player alloc] init];
        player.position = CGPointMake(100, 68);
        
        
        //Add Boss
        ERGBoss *boss = [[ERGBoss alloc] init];
        boss.position = CGPointMake(200, 68);
        
        //add elements to screen
        [self addChild:self.scoreLabel];
        
        [self addChild:self.currentBackground];
        [self addChild:player];
        [self addChild:boss];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        self.moveSpeed = [prefs integerForKey:@"screenMovingSpeed"];
        if(self.moveSpeed == 0)
        {
            self.moveSpeed = 20;
        }
        
        NSLog(@"Move speed: %i ", self.moveSpeed);
        
       
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    Player *player = (Player *)[self childNodeWithName:playerName];
    
    UITouch *touch = [touches anyObject];
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:[touch locationInNode:self]];
    
    
    player.selected = YES;
    
    //test to see if the shield works
    if(player.shielded)
    {
        player.shielded = NO;
    }
    else{
        player.shielded = YES;
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
     /*UITouch *touch = [touches anyObject];
     Player *player = (Player *)[self childNodeWithName:playerName];
    
     if(player.selected)
     {
         player.position = [touch locationInNode:self];
     }*/
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    Player *player = (Player *)[self childNodeWithName:playerName];
    if(player.selected)
    {
        player.selected = NO;
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self enumerateChildNodesWithName:@"hello" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - 2, node.position.y);
        
        if((node.position.x + node.frame.size.width) <  self.position.x){
            node.position = CGPointMake(self.frame.size.width, node.position.y);
        }
    }];
    
    //calculate the time passed between update calls
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    
    if(timeSinceLast > 1)
    {
        timeSinceLast = 1.0 / 60.0;
    }
    
    //sNSLog(@"Time elapsed: %@", currentTime);
    
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - self.moveSpeed * timeSinceLast, node.position.y);
        
             if(node.position.x < -(node.frame.size.width + 100))
             {
                 [node removeFromParent];
             }}];
    
             if( self.currentBackground.position.x < -500)
             {
                   //create a new background node and set as current node
                   ERGBackground *temp = [ERGBackground generateBackground];
                   temp.position = CGPointMake(self.currentBackground.position.x + self.currentBackground.frame.size.width, 0);
                 
                 [self addChild:temp];
                 self.currentBackground = temp;
             }
    
    [self enumerateChildNodesWithName:playerName usingBlock:^(SKNode *node, BOOL *stop) {
        Player *player = (Player *) node;
        if(player.selected)
        {
            [player.physicsBody applyForce:CGVectorMake(0, timeSinceLast * playerJumpForce)];
            
            player.animationState = playerStateJumping;
        } else if(player.position.y < 75)
        {
            player.animationState = playerStateRunning;
        }
        
        
    }];
}

    
     
/* SKAction *tempAction = [SKAction runBlock:^{self.scoreLabel.text =
 [NSString stringWithFormat:@"%3.0f", self.score];
 }];
 
 SKAction *waitAction = [SKAction waitForDuration:0.2];
 [self.scoreLabel runAction:[SKAction repeatActionForever:[[SKAction sequence:@[tempAction, waitAction]]];*/
 
 
 
 
 
 
@end
