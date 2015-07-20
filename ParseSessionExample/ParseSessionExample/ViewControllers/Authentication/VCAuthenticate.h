//
//  VCAuthenticate.h
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCAuthenticateModel.h"

@interface VCAuthenticate : UIViewController
-(instancetype)initWithModel:(VCAuthenticateModel *)model;
@property (nonatomic, copy) didAuthenticateSuccessBlock didAuthenticate;
@end
