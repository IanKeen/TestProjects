//
//  MyAuth.m
//  ParseSessionExample
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "MyAuth.h"

@interface MyAuth ()
@property (assign) BOOL loggedIn;
@end

@implementation MyAuth
-(void)login:(dispatch_block_t)block {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"MyAuthLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    block();
}
-(void)logout:(dispatch_block_t)block {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"MyAuthLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.loggedIn = NO;
    block();
}

-(BOOL)isLoggedIn {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"MyAuthLoggedIn"];
}
@end
