//
//  AppDelegate.m
//
//  Created by Ian Keen on 6/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "AppDelegate.h"
#import "Session.h"
#import "MyAuth.h"

@interface AppDelegate ()
@property (nonatomic, strong) Session *session;
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.navigationController = [UINavigationController new];
    self.window.rootViewController = self.navigationController;
    
    self.session = [[Session alloc] initWithNavigationController:self.navigationController auth:[MyAuth new]];
    [self.session start];
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
