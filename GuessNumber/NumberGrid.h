//
//  NumberGrid.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NumberGridEntryStatePossible,
    NumberGridEntryStateRuledOut
} NumberGridEntryState;

typedef struct {
    NSUInteger number;
    NumberGridEntryState state;
} NumberGridEntry;

@interface NumberGrid : NSObject {
    NumberGridEntry * entries;
    NSUInteger numberOfEntries;
}

- (id)initWithNumbers:(NSArray *)numbers;

- (void)ruleOutNumbers:(NSArray *)numbers;
- (void)narrowToNumbers:(NSArray *)numbers;
- (NSArray *)allPossibilities;
- (NSArray *)ruledOutNumbers;
- (NSArray *)guessesWithCount:(NSUInteger)count;
- (NSUInteger)possibleNumbersCount;

@end
