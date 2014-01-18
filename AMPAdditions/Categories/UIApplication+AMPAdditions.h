//
//  UIApplication+AMPAdditions.h
//   
//
//  Created by Alejandro Martinez on 30/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppDelegate;

@interface UIApplication (AMPAdditions)

// + (id<UIApplicationDelegate>)sharedInstance;

+ (void)startActivityIndicator;
+ (void)stopActivityIndicator;

@end
