//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Leonardo on 9/4/13.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"

@interface CardMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger)cardCount;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

-(int)count;

-(void)redrawCards;

@property (nonatomic,readonly) int score;

@end
