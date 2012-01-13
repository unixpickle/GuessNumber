//
//  NumberGridView.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaneView.h"

#define kNumberCellWidth 36
#define kNumberCellHeight 21

@interface NumberGridView : PaneView {
    CGFloat horizontalSpacing, verticalSpacing;
    NSUInteger numRows, numCols;
    NSMutableArray * numLabels;
}

- (id)initWithFrame:(CGRect)frame width:(NSUInteger)cols height:(NSUInteger)rows;
- (UILabel *)labelForRow:(NSUInteger)row column:(NSUInteger)col;
- (void)setNumbers:(NSArray *)someNumbers;

@end
