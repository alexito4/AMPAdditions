//
//  UIApplication+AMPAdditions.m
//
//
//  Created by Alejandro Martinez on 30/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIApplication+AMPAdditions.h"

#import "UIAlertView+BlocksKit.h"

@implementation UIApplication (AMPAdditions)

+ (void)startActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)stopActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)openPhone:(NSString *)phone {
    NSURL *url = [NSURL URLWithString:phone];
    
    if ([self canOpenURL:url]) {
        NSString *message = [NSString stringWithFormat:NSLocalizedString(@"openPhoneAlert", @"openPhoneAlert"), phone];
        UIAlertView *alert = [UIAlertView bk_alertViewWithTitle:@"" message:message];
        [alert bk_addButtonWithTitle:NSLocalizedString(@"openPhoneYes", @"openPhoneYes") handler:^{
            [self openURL:url];
        }];
        [alert bk_setCancelButtonWithTitle:NSLocalizedString(@"openPhoneNo", @"openPhoneNo") handler:nil];
        [alert show];
    } else {
        UIAlertView *alert = [UIAlertView bk_alertViewWithTitle:@"" message:[NSString stringWithFormat:NSLocalizedString(@"openPhoneCantCall", @"openPhoneCantCall"), phone]];
        [alert bk_setCancelButtonWithTitle:NSLocalizedString(@"openPhoneNo", @"openPhoneNo") handler:nil];
        [alert show];
    }
}

@end
