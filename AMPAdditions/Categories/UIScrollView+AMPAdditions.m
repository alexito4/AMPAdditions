//
//  UIScrollView+AMPAdditions.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import "UIScrollView+AMPAdditions.h"

@implementation UIScrollView (AMPAdditions)
@dynamic currentPage;

- (NSUInteger)currentPage {
    CGFloat width = self.frame.size.width;
    NSUInteger page = lround(self.contentOffset.x / width);
    return page;
}

@end
