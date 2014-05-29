//
//  UIApplication+AMPAdditions.m
//
//
//  Created by Alejandro Martinez on 30/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <AMPAdditions/UIAlertView+AMPAdditions.h>
#import "UIApplication+AMPAdditions.h"

@implementation UIApplication (AMPAdditions)

+ (void)startActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)stopActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (NSURL *)urlForPhone:(NSString *)phone {
    return [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phone]];
}

- (BOOL)canOpenPhone:(NSString *)phone {
    return [self canOpenURL:[self urlForPhone:phone]];
}

- (BOOL)openPhone:(NSString *)phone {
    return [self openURL:[self urlForPhone:phone]];
}

- (void)openPhoneAsking:(NSString *)phone {
    if ([self canOpenPhone:phone]) {
        [UIAlertView showAlertViewWithTitle:NSLocalizedString(@"AMPPhoneTitle", @"Phone title")
                                    message:[NSString stringWithFormat:NSLocalizedString(@"AMPPhoneMessage %@", @"phone %@"), phone]
                          cancelButtonTitle:NSLocalizedString(@"AMPCancel", @"Cancel")
                          otherButtonTitles:@[NSLocalizedString(@"AMPCallButton", @"Call title")]
                            completionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                if (buttonIndex != alertView.cancelButtonIndex) {
                                    [self openPhone:phone];
                                }
                            }];
    }
}

- (NSString *)marketingVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (NSString *)displayName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

@end
