//
//  NumberGrid.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberGrid.h"

@implementation NumberGrid

- (id)initWithNumbers:(NSArray *)numbers {
    if ((self = [super init])) {
        entries = (NumberGridEntry *)malloc(sizeof(NumberGridEntry) * [numbers count]);
        numberOfEntries = [numbers count];
        for (NSUInteger i = 0; i < [numbers count]; i++) {
            entries[i].state = NumberGridEntryStatePossible;
            entries[i].number = [[numbers objectAtIndex:i] unsignedIntegerValue];
        }
    }
    return self;
}

- (void)ruleOutNumbers:(NSArray *)numbers {
    for (NSUInteger i = 0; i < [numbers count]; i++) {
        NSUInteger number = [[numbers objectAtIndex:i] unsignedIntegerValue];
        for (NSUInteger j = 0; j < numberOfEntries; j++) {
            if (entries[j].number == number) {
                entries[j].state = NumberGridEntryStateRuledOut;
            }
        }
    }
}

- (void)narrowToNumbers:(NSArray *)numbers {
    for (NSUInteger i = 0; i < numberOfEntries; i++) {
        if (entries[i].state == NumberGridEntryStateRuledOut) continue;
        BOOL isInList = NO;
        for (NSUInteger j = 0; j < [numbers count]; j++) {
            NSUInteger number = [[numbers objectAtIndex:j] unsignedIntegerValue];
            if (number == entries[i].number) {
                isInList = YES;
                break;
            }
        }
        if (!isInList) {
            entries[i].state = NumberGridEntryStateRuledOut;
        }
    }
}

- (NSArray *)allPossibilities {
    NSMutableArray * mutable = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < numberOfEntries; i++) {
        if (entries[i].state == NumberGridEntryStatePossible) {
            [mutable addObject:[NSNumber numberWithUnsignedInteger:entries[i].number]];
        }
    }
    
    return [NSArray arrayWithArray:mutable];
}

- (NSArray *)ruledOutNumbers {
    NSMutableArray * mutable = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < numberOfEntries; i++) {
        if (entries[i].state == NumberGridEntryStateRuledOut) {
            [mutable addObject:[NSNumber numberWithUnsignedInteger:entries[i].number]];
        }
    }
    
    return [NSArray arrayWithArray:mutable];
}

- (NSArray *)guessesWithCount:(NSUInteger)count {
    NSMutableArray * possible = [[self allPossibilities] mutableCopy];
    NSMutableArray * ruledOut = [[self ruledOutNumbers] mutableCopy];
    NSUInteger numPossible = [possible count] / 2;
    NSUInteger numRuledOut = 0;
    
    if (numPossible < count) {
        numRuledOut = count - numPossible;
        if (numRuledOut > [ruledOut count]) {
            numRuledOut = [ruledOut count];
        }
    } else if (numPossible > count) {
        numPossible = count;
    }
    
    NSMutableArray * returnNumbers = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < numPossible; i++) {
        NSUInteger randIndex = arc4random() % [possible count];
        [returnNumbers addObject:[possible objectAtIndex:randIndex]];
        [possible removeObjectAtIndex:randIndex];
    }
    
    for (NSUInteger i = 0; i < numRuledOut; i++) {
        NSUInteger randIndex = arc4random() % [ruledOut count];
        [returnNumbers addObject:[ruledOut objectAtIndex:randIndex]];
        [ruledOut removeObjectAtIndex:randIndex];
    }
    
    return [NSArray arrayWithArray:returnNumbers];
}

- (NSUInteger)possibleNumbersCount {
    NSUInteger count = 0;
    for (NSUInteger i = 0; i < numberOfEntries; i++) {
        if (entries[i].state == NumberGridEntryStatePossible)
            count++;
    }
    return count;
}

@end
