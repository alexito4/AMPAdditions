//
//  UIViewController+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 04/06/13.
//
//

#import "UIViewController+AMPAdditions.h"
#import "UINavigationController+AMPAdditions.h"

@implementation UIViewController (AMPAdditions)

- (BOOL)isRootViewController {
    return self.navigationController.rootViewController == self;
}

@end
