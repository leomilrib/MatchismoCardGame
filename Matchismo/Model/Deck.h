//
//  Deck.h
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//  Copyright (c) 2013 leomilrib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

-(int)count;

@end
