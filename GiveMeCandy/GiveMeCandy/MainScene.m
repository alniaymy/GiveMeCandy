//
//  MainScene.m
//  GiveMeCandy
//
//  Created by Nabeel Salih on 2014-11-13.
//  Copyright (c) 2014 VLADU BOGDAN DANIEL PFA. All rights reserved.
//

#import "MainScene.h"
#import "GameLogic.h"
@implementation MainScene


+(id)scene{
    return LH_AUTORELEASED([[self alloc]initWithContentOfFile:@"publishedResources/mainScreen.lhplist"]);
}

-(id)initWithContentOfFile:(NSString *)levelPlistFile{
    
    self=[super initWithContentOfFile:levelPlistFile];
    if (self) {
        //init your content here
    }
    return self;
}

-(void)didFinishedPlayingAnimation:(LHAnimation *)anim{
    LHNode* node = (LHNode*)[anim node];
    if(node &&
       ([[node name] isEqualToString:@"topleafs"] ))
    {
        NSArray* allAnimations = [node animations];
        int newAnimIdx = arc4random() % [allAnimations count];
        LHAnimation* newAnim = [allAnimations objectAtIndex:newAnimIdx];
        [node setActiveAnimation:newAnim];
        [newAnim restart];
    }
}

-(void)goToPlayMenu
{
    NSLog(@"Go to Play");
    [[self view]presentScene:[GameLogic scene]];
}

-(void)goToAboutMenu
{
    NSLog(@"Go to About");
}
-(void)handleNodesAtLocation:(CGPoint)location
{
    NSArray* nodes=[[self gameWorldNode]nodesAtPoint:location];
    
    for (SKNode* node in nodes){
        if ([[node name]isEqualToString:@"playButton"]) {
            [self goToPlayMenu];
        }
        else if ([[node name]isEqualToString:@"aboutButton"])
        {
            [self goToAboutMenu];
        }
    }
    
}
#if TARGET_OS_IPHONE
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* touch in touches)
    {
        CGPoint location=[touch locationInNode:[self gameWorldNode]];
        [self handleNodesAtLocation:location];
    }
    [super touchesEnded:touches withEvent:event];
    
}
#else
-(void)mouseUp:(NSEvent *)theEvent
{
    CGPoint location=[theEvent locationInNode:[self gameWorldNode]];
    [self handleNodesAtLocation:location];
}

#endif
@end
