//
//  VCAuthenticate+Factory.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCAuthenticate.h"
#import "Auth.h"

@interface VCAuthenticate (Factory)
+(instancetype)factoryInstance:(id<Auth>)auth;
@end
