//
//  AppDelegate.m
//  GuessNumber
//
//  Created by Alex Nichol on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    
    startVC = [[StartViewController alloc] init];
    [window addSubview:startVC.view];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
