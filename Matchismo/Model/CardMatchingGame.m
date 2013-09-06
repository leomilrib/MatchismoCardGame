//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Leonardo on 9/4/13.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

#define FLIP_COST 0
#define MISMATCH_PENALTY 1
#define MATCH_BONUS 1

-(NSMutableArray *)cards{
  if(!_cards){
    _cards = [[NSMutableArray alloc] init];
  }
  return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck{
  self = [super init];
  if(self){
    for(int i = 0; i < cardCount; i++){
      Card *card = [deck drawRandomCard];
      if(!card){
        self = nil;
      } else {
        self.cards[i] = card;
      }
    }
  }
  return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
  return (index < self.cards.count)? self.cards[index] : nil;
}

-(void)flipCardAtIndex:(NSUInteger)index{
  Card *card = [self cardAtIndex:index];
  
  if(!card.isUnplayable){
    if(!card.isFaceUp){
      for(Card *otherCard in self.cards){
        if(otherCard.isFaceUp && !otherCard.isUnplayable){
          int matchScore = [card match:@[otherCard]];
          if (matchScore) {
            otherCard.unplayable = YES;
            card.unplayable = YES;
            self.score += matchScore * MATCH_BONUS;
          }
          break;
        }
      }
      self.score -= FLIP_COST;
    }
    card.faceUp = !card.isFaceUp;
  }
}

@end
