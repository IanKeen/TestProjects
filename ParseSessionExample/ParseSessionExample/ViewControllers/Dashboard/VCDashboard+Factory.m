//
//  VCDashboard+Factory.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCDashboard+Factory.h"
#import "VCDashboardModel.h"
#import "Session.h"

@implementation VCDashboard (Factory)
+(instancetype)factoryInstance:(Session *)session {
    VCDashboardModel *model = [[VCDashboardModel alloc] initWithSession:session];
    return [[VCDashboard alloc] initWithModel:model];
}
@end
