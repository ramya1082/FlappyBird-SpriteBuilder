#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
}

-(void)update:(CCTime)delta
{
    // put update code here
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

- (void)addObstacle {
    Obstacle *obstacle = (Obstacle *)[CCBReader load:@"Obstacle"];
    CGPoint screenPosition = [self convertToWorldSpace:ccp(380, 0)];
    CGPoint worldPosition = [physicsNode convertToNodeSpace:screenPosition];
    obstacle.position = worldPosition;
    [obstacle setupRandomPosition];
    obstacle.zOrder = DrawingOrderPipes;
    [physicsNode addChild:obstacle];
    [_obstacles addObject:obstacle];
}

#pragma mark - Update

- (void)showScore
{
    _scoreLabel.string = [NSString stringWithFormat:@"%d", points];
    _scoreLabel.visible = true;
}

@end
