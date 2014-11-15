//
//  GameLogic.m
//  GiveMeCandy
//
//  Created by Nabeel Salih on 2014-11-14.
//  Copyright (c) 2014 VLADU BOGDAN DANIEL PFA. All rights reserved.
//

#import "GameLogic.h"

@implementation GameLogic

+(id)scene
{
    return [[GameLogic alloc]initWithContentOfFile:@"publishedResources/bambooForest_Level1.lhplist"];
}

@end
