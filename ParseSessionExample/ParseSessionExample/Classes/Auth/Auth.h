//
//  Auth.h
//  ParseSessionExample
//
//  Created by Ian Keen on 8/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

/*
 the completion blocks would normally provide more data, i.e. a user and/or error
 */

@protocol Auth <NSObject>
-(void)login:(dispatch_block_t)complete;
-(void)logout:(dispatch_block_t)complete;
-(BOOL)isLoggedIn;
@end