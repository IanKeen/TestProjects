//
//  VCAuthenticateModel.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCAuthenticateModel.h"

@interface VCAuthenticateModel ()
@property (nonatomic, strong) id<Auth> auth;
@end

@implementation VCAuthenticateModel
-(instancetype)initWithAuth:(id<Auth>)auth {
    if (!(self = [super init])) { return nil; }
    self.auth = auth;
    return self;
}
-(void)authenticate:(didAuthenticateSuccessBlock)success failure:(didAuthenticateFailureBlock)failure {
    [self.auth login:^{
        success();
    }];
}
@end
