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
        
        NSMutableArray * numbers = [NSMutableArray arrayWithCapacity:gridCapacity];
        for (NSUInteger i = 1; i <= max; i++) {
            [numbers addObject:[NSNumber numberWithUnsignedInteger:i]];
        }
        
        grid = [[NumberGrid alloc] initWithNumbers:numbers];
        
        gridView = [[NumberGridView alloc] initWithFrame:CGRectMake(10, 54, 300, 300)
                                                   width:widthHeight height:widthHeight];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    [super loadView];
    
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) title:@"Search"];
    cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeView:)];
    
    [[navBar topItem] setLeftBarButtonItem:cancelButton];
    
    [self.view addSubview:navBar];
    [self.view addSubview:gridView];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)closeView:(id)sender {
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
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
    
}

@end
