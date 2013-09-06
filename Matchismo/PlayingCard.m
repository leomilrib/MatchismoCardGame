//
//  PlayingCard.m
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray *)validSuits{
    return @[@"♥",@"♦",@"♣",@"♠"];
}

-(void)setSuits:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit? _suit : @"?";
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank {
    return [self rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

-(int)match:(NSArray *)otherCards{
  int score = 0;
  
  for (PlayingCard *card in otherCards){
    if ([card.suit isEqualToString:self.suit]){
      score = 1;
    } else if (card.rank == self.rank){
      score = 4;
    }
  }
  
  return score;
}

@end