//
//  StartViewController.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)loadView {
    [super loadView];
        
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) title:@"Setup"];
    startButton = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStyleBordered target:self action:@selector(startButtonTapped:)];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44)];
    numOptsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 59, self.view.frame.size.width - 20, 20)];
    numOptsValue = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"25", @"36", @"49", nil]];
    rangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 143, self.view.frame.size.width - 20, 20)];
    rangeValue = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"1-25", @"1-50", @"1-100", nil]];
    
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 44)];
    [scrollView setShowsVerticalScrollIndicator:YES];
    [scrollView setBounces:YES];
    [scrollView setAlwaysBounceVertical:YES];
    
    [[navBar topItem] setRightBarButtonItem:startButton];
    
    [numOptsLabel setBackgroundColor:[UIColor clearColor]];
    [numOptsLabel setText:@"Number of options"];
    [numOptsLabel setTextAlignment:UITextAlignmentCenter];
    [numOptsLabel setTextColor:[UIColor colorWithRed:0.298 green:0.337 blue:0.424 alpha:1]];
    [numOptsLabel setFont:[UIFont systemFontOfSize:15]];
    [numOptsLabel setShadowColor:[UIColor whiteColor]];
    [numOptsLabel setShadowOffset:CGSizeMake(0, 1)];
      [numOptsValue setFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, 44)];
  
    [numOptsValue setSelectedSegmentIndex:0];
    
    [rangeLabel setBackgroundColor:[UIColor clearColor]];
    [rangeLabel setText:@"Range"];
    [rangeLabel setTextAlignment:UITextAlignmentCenter];
    [rangeLabel setTextColor:[UIColor colorWithRed:0.298 green:0.337 blue:0.424 alpha:1]];
    [rangeLabel setFont:[UIFont systemFontOfSize:15]];
    [rangeLabel setShadowColor:[UIColor whiteColor]];
    [rangeLabel setShadowOffset:CGSizeMake(0, 1)];
      [rangeValue setFrame:CGRectMake(10, 94, self.view.frame.size.width - 20, 44)];
  
    [rangeValue setSelectedSegmentIndex:0];
    
    [self.view addSubview:navBar];
    [scrollView addSubview:numOptsLabel];
    [scrollView addSubview:numOptsValue];
    [scrollView addSubview:rangeLabel];
    [scrollView addSubview:rangeValue];
    [self.view addSubview:scrollView];
    
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)startButtonTapped:(id)sender {
    NSUInteger widthHeight = 5;
    if ([numOptsValue selectedSegmentIndex] == 1) widthHeight = 6;
    else if ([numOptsValue selectedSegmentIndex] == 2) widthHeight = 7;
    
    NSUInteger maxNum = 25;
    if ([rangeValue selectedSegmentIndex] == 1) maxNum = 50;
    else if ([rangeValue selectedSegmentIndex] == 2) maxNum = 100;
    
    SearchViewController * svc = [[SearchViewController alloc] initWithSize:widthHeight range:maxNum];
    [self presentModalViewController:svc animated:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
