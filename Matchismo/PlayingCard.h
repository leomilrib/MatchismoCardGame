//
//  PlayingCard.h
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
-(int)match:(NSArray *)otherCards;

@end