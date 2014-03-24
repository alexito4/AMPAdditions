//
//  UICollectionView+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 28/02/14.
//
//

#import "UICollectionView+AMPAdditions.h"

@implementation UICollectionView (AMPAdditions)

- (void)registerNibWithNameAndIdentifier:(NSString *)nameAndIdentifier {
    [self registerNib:[UINib nibWithNibName:nameAndIdentifier bundle:nil] forCellWithReuseIdentifier:nameAndIdentifier];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    [self setContentOffset:CGPointZero animated:animated];
}

- (void)scrollToTop {
    [self scrollToTopAnimated:YES];
}

@end
