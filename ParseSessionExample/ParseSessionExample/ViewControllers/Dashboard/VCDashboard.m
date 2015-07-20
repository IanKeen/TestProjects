//
//  VCDashboard.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCDashboard.h"
#import "VCDashboardModel.h"

@interface VCDashboard ()
@property (nonatomic, strong) VCDashboardModel *model;
@end

@implementation VCDashboard
#pragma mark - Lifecycle
-(instancetype)initWithModel:(VCDashboardModel *)model {
    if (!(self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil])) { return nil; }
    self.model = model;
    return self;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dashboard";
}

#pragma mark - Actions
-(IBAction)logoutPress:(id)sender {
    [self.model logout];
}
@end
