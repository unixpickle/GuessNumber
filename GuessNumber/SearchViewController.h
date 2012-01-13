//
//  SearchViewController.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoNumberPane.h"
#import "NumberFoundPane.h"
#import "NumberGridView.h"
#import "NumberGrid.h"
#import "UINavigationBar+EasyTitle.h"

@interface SearchViewController : UIViewController {
    NumberGridView * gridView;
    NumberGrid * grid;
    NSArray * currentNumbers;
    UIView * currentPane;
    
    NSUInteger gridCapacity;
    NSUInteger gridWidth, gridHeight;
    NSRange numberRange;
    
    UINavigationBar * navBar;
    UIBarButtonItem * doneButton;
    
    UIButton * confirmButton;
    UIButton * denyButton;
}

- (id)initWithSize:(NSUInteger)widthHeight range:(NSUInteger)max;
- (void)populateGridView:(NumberGridView *)theGrid;
- (void)swipeGrids;
- (void)presentNewPane:(UIView *)aPane;

- (void)closeView:(id)sender;
- (void)confirmPresent:(id)sender;
- (void)denyPresent:(id)sender;

@end
