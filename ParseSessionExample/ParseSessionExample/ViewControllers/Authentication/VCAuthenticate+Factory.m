//
//  VCAuthenticate+Factory.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCAuthenticate+Factory.h"
#import "VCAuthenticateModel.h"

@implementation VCAuthenticate (Factory)
+(instancetype)factoryInstance:(id<Auth>)auth {
    VCAuthenticateModel *model = [[VCAuthenticateModel alloc] initWithAuth:auth];
    return [[VCAuthenticate alloc] initWithModel:model];
}
@end
