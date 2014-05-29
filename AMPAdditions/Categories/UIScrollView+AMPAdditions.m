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

- (void)scrollToCaretPosition:(UITextView *)textView {
    CGRect cursorRect = [textView caretRectForPosition:textView.selectedTextRange.start];
    cursorRect = [self convertRect:cursorRect fromView:textView];
    if (![self rectVisible:cursorRect]) {
        cursorRect.size.height += 8; // To add some space underneath the cursor
        [self scrollRectToVisible:cursorRect animated:YES];
    }
}

- (BOOL)rectVisible:(CGRect)rect {
    CGRect visibleRect;
    visibleRect.origin = self.contentOffset;
    visibleRect.origin.y += self.contentInset.top;
    visibleRect.size = self.bounds.size;
    visibleRect.size.height -= self.contentInset.top + self.contentInset.bottom;
    
    return CGRectContainsRect(visibleRect, rect);
}

@end
