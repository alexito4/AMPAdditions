//
//  UIScrollView+AMPAdditions.h
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (AMPAdditions)

- (NSUInteger)currentPage;
- (void)setCurrentPage:(NSUInteger)currentPage; // animated = YES
- (void)setCurrentPage:(NSUInteger)currentPage animated:(BOOL)animated;

- (void)scrollToCaretPosition:(UITextView *)textView;
- (BOOL)rectVisible:(CGRect)rect;

@end
