//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (strong, nonatomic) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UILabel *cardsLeftLabel;

@property (weak, nonatomic) IBOutlet UIButton *btnCard1;
@property (weak, nonatomic) IBOutlet UIButton *btnCard2;
@property (weak, nonatomic) IBOutlet UIButton *btnCard3;
@property (weak, nonatomic) IBOutlet UIButton *btnCard4;

@end

@implementation CardGameViewController

-(void) viewDidLoad {
  [super viewDidLoad];
  [self newDeck];
  [self setCardsOnTable];
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
  if ([self.deck count] != 0) {
    [self newGame];
  } else {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Play again?" message:@"Wanna play again?" delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:nil];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"Yes"];
    [alert show];
  }
}

-(void)newDeck{
  self.deck = [[PlayingCardDeck alloc] init];
}

-(void)turnBackCards{
  self.btnCard1.selected = NO;
  self.btnCard2.selected = NO;
  self.btnCard3.selected = NO;
  self.btnCard4.selected = NO;
}

-(void)setCardsOnTable{
  [self.btnCard1 setTitle:[NSString stringWithFormat:@"%@", self.deck.drawRandomCard.contents] forState:UIControlStateSelected];
  [self.btnCard2 setTitle:[NSString stringWithFormat:@"%@", self.deck.drawRandomCard.contents] forState:UIControlStateSelected];
  [self.btnCard3 setTitle:[NSString stringWithFormat:@"%@", self.deck.drawRandomCard.contents] forState:UIControlStateSelected];
  [self.btnCard4 setTitle:[NSString stringWithFormat:@"%@", self.deck.drawRandomCard.contents] forState:UIControlStateSelected];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    [self newDeck];
    [self newGame];
  }
}

-(void)newGame{
  [self turnBackCards];
  [self setCardsOnTable];
  self.cardsLeftLabel.text = [NSString stringWithFormat:@"Cards Left: %d", [self.deck count]];
}

@end
