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

@property (strong, nonatomic) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UILabel *cardsLeftLabel;

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

-(IBAction)flipCard:(UIButton *)sender {
  sender.selected = !sender.isSelected;
  self.flipCount++;
}

-(IBAction)redrawCards:(UIButton *)sender {
  if ([self.deck count] > [self.btnCards count]) {
    [self newGame];
  } else {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Enough Cards..."
                                                    message:@"Wanna play again?"
                                                   delegate:self
                                          cancelButtonTitle:@"Quit"
                                          otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Yes"];
    [alert show];
  }
}

-(Deck *)deck{
  if(!_deck){
    _deck = [[PlayingCardDeck alloc] init];
  }
  return _deck;
}

-(void)turnBackCards{
  for (UIButton *btnCard in self.btnCards) {
    btnCard.selected = NO;
  }
}

-(void)setBtnCards:(NSArray *)btnCards{
  _btnCards = btnCards;
  for (UIButton *btnCard in self.btnCards) {
    [btnCard setTitle:[NSString stringWithFormat:@"%@", self.deck.drawRandomCard.contents]
             forState:UIControlStateSelected];
  }
  [self setCardsLeftLabel];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    [self newGame];
  }
}

-(void)newGame{
  [self turnBackCards];
}

-(void)setCardsLeftLabel{
  self.cardsLeftLabel.text = [NSString stringWithFormat:@"Cards Left: %d", [self.deck count]];
}
  
@end
