//
//  ParseSession.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auth.h"

@interface Session : NSObject
-(instancetype)initWithNavigationController:(UINavigationController *)navController auth:(id<Auth>)auth;

-(void)start;
-(void)stop;
@end
