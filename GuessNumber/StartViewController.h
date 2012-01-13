//
//  StartViewController.h
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+EasyTitle.h"
#import "SearchViewController.h"

@interface StartViewController : UIViewController {
    UINavigationBar * navBar;
    
    UIScrollView * scrollView;
    
    UILabel * numOptsLabel;
    UISegmentedControl * numOptsValue;
    
    UILabel * rangeLabel;
    UISegmentedControl * rangeValue;
    
    UIBarButtonItem * startButton;
}

- (void)startButtonTapped:(id)sender;

@end
