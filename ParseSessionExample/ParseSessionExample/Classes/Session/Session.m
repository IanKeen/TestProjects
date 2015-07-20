//
//  Session.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "Session.h"

#import "VCAuthenticate+Factory.h"
#import "VCDashboard+Factory.h"

@interface Session ()
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) id<Auth> auth;
@end

@implementation Session
#pragma mark - Public - Lifecycle
-(instancetype)initWithNavigationController:(UINavigationController *)navController auth:(id<Auth>)auth {
    if (!(self = [super init])) { return nil; }
    self.auth = auth;
    self.navigationController = navController;
    return self;
}

#pragma mark - Public - Session
-(void)start {
    if ([self.auth isLoggedIn]) {
        [self navigateToDashboard];
    }
    else {
        [self navigateToAuthentication];
    }
}
-(void)stop {
    [self.auth logout:^{
        [self start];
    }];
}

#pragma mark - Private - Navigation
-(void)navigateToAuthentication {
    VCAuthenticate *instance = [VCAuthenticate factoryInstance:self.auth];
    instance.didAuthenticate = ^{
        [self start];
    };
    [self.navigationController setViewControllers:@[instance]];
}
-(void)navigateToDashboard {
    VCDashboard *instance = [VCDashboard factoryInstance:self];
    [self.navigationController setViewControllers:@[instance]];
}
@end
