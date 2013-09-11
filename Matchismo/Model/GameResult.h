//
//  GameResult.h
//  Matchismo
//
//  Created by leo on 9/11/13.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject


+(NSArray *)allGameResults; // of GameResult

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

-(NSComparisonResult)compareScoreToGameResult:(GameResult *)otherResult;
-(NSComparisonResult)compareEndDateToGameResult:(GameResult *)otherResult;
-(NSComparisonResult)compareDurationToGameResult:(GameResult *)otherResult;

@end
