//
//  PlayingCard.h
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//  Copyright (c) 2013 leomilrib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end