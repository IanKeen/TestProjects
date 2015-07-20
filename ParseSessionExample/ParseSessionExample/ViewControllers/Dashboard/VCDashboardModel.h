//
//  VCDashboardModel.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Session;

@interface VCDashboardModel : NSObject
-(instancetype)initWithSession:(Session *)session;
-(void)logout;
@end
