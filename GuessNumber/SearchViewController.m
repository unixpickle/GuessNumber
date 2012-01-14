//
//  SearchViewController.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController

- (id)initWithSize:(NSUInteger)widthHeight range:(NSUInteger)max {
    if ((self = [super init])) {
        gridCapacity = widthHeight * widthHeight;
        numberRange = NSMakeRange(1, max);
        
        gridWidth = widthHeight;
        gridHeight = widthHeight;
        
        NSMutableArray * numbers = [NSMutableArray arrayWithCapacity:gridCapacity];
        for (NSUInteger i = 1; i <= max; i++) {
            [numbers addObject:[NSNumber numberWithUnsignedInteger:i]];
        }
        
        grid = [[NumberGrid alloc] initWithNumbers:numbers];
        
        gridView = [[NumberGridView alloc] initWithFrame:CGRectMake(10, kCurrentPaneY, 300, 300)
                                                   width:widthHeight height:widthHeight];
        currentPane = gridView;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    [super loadView];
    
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) title:@"Search"];
    doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeView:)];
    confirmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    denyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cardNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 49, self.view.frame.size.width - 20, 30)];
    
    [confirmButton setFrame:CGRectMake(self.view.frame.size.width - 90, 399, 80, 44)];
    [denyButton setFrame:CGRectMake(self.view.frame.size.width - 180, 399, 80, 44)];
    
    [[navBar topItem] setRightBarButtonItem:doneButton];
    
    [confirmButton addTarget:self action:@selector(confirmPresent:) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton setTitle:@"Present" forState:UIControlStateNormal];
    
    [denyButton addTarget:self action:@selector(denyPresent:) forControlEvents:UIControlEventTouchUpInside];
    [denyButton setTitle:@"Absent" forState:UIControlStateNormal];
    
    [cardNumLabel setBackgroundColor:[UIColor clearColor]];
    [cardNumLabel setTextAlignment:UITextAlignmentCenter];
    
    [self.view addSubview:navBar];
    [self.view addSubview:gridView];
    [self.view addSubview:confirmButton];
    [self.view addSubview:denyButton];
    [self.view addSubview:cardNumLabel];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self populateGridView:gridView];
}

- (void)closeView:(id)sender {
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (void)confirmPresent:(id)sender {
    [grid narrowToNumbers:currentNumbers];
    [self swipeGrids];
}

- (void)denyPresent:(id)sender {
    [grid ruleOutNumbers:currentNumbers];
    [self swipeGrids];
}

- (void)presentNewPane:(UIView *)aPane {
    __block UIView * lastView = currentPane;
    currentPane = aPane;
    [currentPane setFrame:CGRectMake(self.view.frame.size.width + 10, kCurrentPaneY, 300, 300)];
    [self.view addSubview:currentPane];
    [UIView animateWithDuration:0.5 animations:^ {
        [lastView setFrame:CGRectMake(0 - (lastView.frame.origin.x + lastView.frame.size.width), lastView.frame.origin.y,
                                      lastView.frame.size.width, lastView.frame.size.height)];
        [currentPane setFrame:CGRectMake(10, kCurrentPaneY, 300, 300)];
    } completion:^ (BOOL finished) {
        [lastView removeFromSuperview];
        lastView = nil;
    }];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Grid -

- (void)populateGridView:(NumberGridView *)theGrid {
    cardNumber ++;
    [cardNumLabel setText:[NSString stringWithFormat:@"Card #%ld", (long)cardNumber]];
    NSArray * goodNumbers = [grid guessesWithCount:gridCapacity];
    [theGrid setNumbers:goodNumbers];
    currentNumbers = goodNumbers;
}

- (void)swipeGrids {
    if ([grid possibleNumbersCount] <= 1) {
        if ([grid possibleNumbersCount] == 0) {
            NoNumberPane * notFound = [[NoNumberPane alloc] initWithFrame:CGRectMake(self.view.frame.size.width + 10, kCurrentPaneY, 300, 300)];
            [self presentNewPane:notFound];
        } else {
            NSArray * possibilities = [grid allPossibilities];
            NSAssert([possibilities count] == 1, @"Unmatching possibility count");
            NumberFoundPane * found = [[NumberFoundPane alloc] initWithFrame:CGRectMake(self.view.frame.size.width + 10, kCurrentPaneY, 300, 300)
                                                                      number:[possibilities lastObject]];
            [self presentNewPane:found];
        }
        [confirmButton removeFromSuperview];
        [denyButton removeFromSuperview];
        return;
    }
        
    gridView = [[NumberGridView alloc] initWithFrame:CGRectMake(self.view.frame.size.width + 10, 54, 300, 300)
                                               width:gridWidth height:gridHeight];
    [self populateGridView:gridView];
    [self presentNewPane:gridView];
}

@end
