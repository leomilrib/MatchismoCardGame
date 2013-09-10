//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Leonardo on 9/4/13.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

#define FLIP_COST 1
#define MISMATCH_PENALTY -1
#define MATCH_BONUS 4

-(NSMutableArray *)cards{
  if(!_cards){
    _cards = [[NSMutableArray alloc] init];
  }
  return _cards;
}

-(PlayingCardDeck *)deck{
  if(!_deck){
    _deck = [[PlayingCardDeck alloc] init];
  }
  return _deck;
}

-(id)initWithCardCount:(NSUInteger)cardCount{
  self = [super init];
  if(self){
    for(int i = 0; i < cardCount; i++){
      Card *card = [self.deck drawRandomCard];
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
          } else {
            self.score += MISMATCH_PENALTY;
          }
          break;
        }
      }
      self.score -= FLIP_COST;
    }
    card.faceUp = !card.isFaceUp;
  }
}

-(int)count{
  return [self.deck count];
}

-(void)redrawCards{
  for(int i = 0; i < [self.cards count]; i++){
    Card *card = [self.deck drawRandomCard];
    self.cards[i] = card;
  }
}

@end
