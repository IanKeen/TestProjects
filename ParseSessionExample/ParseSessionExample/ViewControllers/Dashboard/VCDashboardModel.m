//
//  VCDashboardModel.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCDashboardModel.h"
#import "Session.h"

@interface VCDashboardModel ()
@property (nonatomic, strong) Session *session;
@end

@implementation VCDashboardModel
#pragma mark - Lifecycle
-(instancetype)initWithSession:(Session *)session {
    if (!(self = [super init])) { return nil; }
    self.session = session;
    return self;
}

#pragma mark - Public
-(void)logout {
    [self.session stop];
}
@end
