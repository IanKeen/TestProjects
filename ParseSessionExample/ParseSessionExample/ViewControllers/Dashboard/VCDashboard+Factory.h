//
//  VCDashboard+Factory.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCDashboard.h"

@class Session;

@interface VCDashboard (Factory)
+(instancetype)factoryInstance:(Session *)session;
@end
