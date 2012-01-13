//
//  UINavigationBar+EasyTitle.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UINavigationBar+EasyTitle.h"

@implementation UINavigationBar (EasyTitle)

- (id)initWithFrame:(CGRect)frame title:(NSString *)aTitle {
    if ((self = [self initWithFrame:frame])) {
        UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:aTitle];
        [self setItems:[NSArray arrayWithObject:item]];
    }
    return self;
}

@end
