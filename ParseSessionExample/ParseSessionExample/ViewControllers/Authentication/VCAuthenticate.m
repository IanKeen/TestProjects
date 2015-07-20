//
//  VCAuthenticate.m
//
//  Created by Ian Keen on 7/07/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "VCAuthenticate.h"
#import "VCAuthenticateModel.h"

@interface VCAuthenticate ()
@property (nonatomic, strong) VCAuthenticateModel *model;
@end

@implementation VCAuthenticate
#pragma mark - Lifecycle
-(instancetype)initWithModel:(VCAuthenticateModel *)model {
    if (!(self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil])) { return nil; }
    self.model = model;
    return self;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Authentication";
}

#pragma mark - Actions
-(IBAction)facebookPress:(id)sender {
    [self.model authenticate:^{
        if (self.didAuthenticate) { self.didAuthenticate(); }
    } failure:^{
        [[[UIAlertView alloc]
          initWithTitle:@"Oops..."
          message:@"There was an error logging in"
          delegate:nil
          cancelButtonTitle:@"OK"
          otherButtonTitles:nil]
         show];
    }];
}
@end
