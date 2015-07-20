//
//  VCAuthenticateModel.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Auth.h"

typedef void(^didAuthenticateSuccessBlock)(void);
typedef void(^didAuthenticateFailureBlock)(void);

@interface VCAuthenticateModel : NSObject
-(instancetype)initWithAuth:(id<Auth>)auth;
-(void)authenticate:(didAuthenticateSuccessBlock)success failure:(didAuthenticateFailureBlock)failure;
@end
