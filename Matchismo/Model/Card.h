//
//  Card.h
//  Matchismo
//
//  Created by Leonardo on 9/3/13.
//  Copyright (c) 2013 leomilrib. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end
