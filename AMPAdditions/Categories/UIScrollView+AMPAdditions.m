//
//  UIScrollView+AMPAdditions.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import "UIScrollView+AMPAdditions.h"

@implementation UIScrollView (AMPAdditions)

- (NSUInteger)currentPage {
    CGFloat width = self.frame.size.width;
    NSUInteger page = lround(self.contentOffset.x / width);
    return page;
}

- (void)setCurrentPage:(NSUInteger)currentPage {
    [self setCurrentPage:currentPage animated:YES];
}

- (void)setCurrentPage:(NSUInteger)currentPage animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(currentPage * CGRectGetWidth(self.bounds), 0.0f) animated:animated];
}

@end
