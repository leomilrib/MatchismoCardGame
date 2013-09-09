//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UILabel *cardsLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamePointsLabel;
//@property (nonatomic) int gamePoints;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnCards;

@end

@implementation CardGameViewController

-(void) viewDidLoad {
  [super viewDidLoad];
}

-(void)setFlipCount:(int)flipCount{
  _flipCount = flipCount;
  self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

-(IBAction)redrawCards:(UIButton *)sender {
//  if ([self.deck count] > [self.btnCards count]) {
//    [self newGame];
//  } else {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Enough Cards..."
//                                                    message:@"Wanna play again?"
//                                                   delegate:self
//                                          cancelButtonTitle:@"Quit"
//                                          otherButtonTitles:nil];
//    [alert addButtonWithTitle:@"Yes"];
//    [alert show];
//  }
  self.game = nil;
  self.flipCount = 0;
  [self updateUI];
  
}

-(CardMatchingGame *)game{
  if(!_game){
    _game = [[CardMatchingGame alloc] initWithCardCount:self.btnCards.count
                                              usingDeck:[[PlayingCardDeck alloc]init]];
  }
  return _game;
}

-(void)turnBackCards{
  for (UIButton *btnCard in self.btnCards) {
    btnCard.selected = NO;
  }
}

-(void)setBtnCards:(NSArray *)btnCards{
  _btnCards = btnCards;
  [self updateUI];
}

-(void)updateUI{
  for(UIButton *btnCard in self.btnCards){
    Card *card = [self.game cardAtIndex:[self.btnCards indexOfObject:btnCard]];
    
    [btnCard setTitle:card.contents
             forState:UIControlStateSelected];
    [btnCard setTitle:card.contents
             forState:UIControlStateSelected|UIControlStateDisabled];
    
    btnCard.selected = card.isFaceUp;
    btnCard.enabled = !card.isUnplayable;
    btnCard.alpha = card.isUnplayable? 0.5 : 1.0;
    
    self.gamePointsLabel.text = [NSString stringWithFormat:@"Points: %d", self.game.score];
//    self.cardsLeftLabel.text = [NSString stringWithFormat:@"Cards Left: %d", [self.deck count]];
    
  }
    
}

-(IBAction)flipCard:(UIButton *)sender {
  [self.game flipCardAtIndex:[self.btnCards indexOfObject:sender]];
  self.flipCount++;
  [self updateUI];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    [self newGame];
  }
}

-(void)newGame{
  [self turnBackCards];
}

//-(void)setCardsLeftLabel{
//
//}

@end
