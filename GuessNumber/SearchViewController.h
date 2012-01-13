//
//  SearchViewController.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberGridView.h"
#import "NumberGrid.h"
#import "UINavigationBar+EasyTitle.h"

@interface SearchViewController : UIViewController {
    NumberGridView * gridView;
    NumberGrid * grid;
    
    NSUInteger gridCapacity;
    NSRange numberRange;
    
    UINavigationBar * navBar;
    UIBarButtonItem * cancelButton;
}

- (id)initWithSize:(NSUInteger)widthHeight range:(NSUInteger)max;
- (void)populateGridView:(NumberGridView *)theGrid;

- (void)closeView:(id)sender;

@end
