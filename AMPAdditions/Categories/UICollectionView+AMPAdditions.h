//
//  UICollectionView+AMPAdditions.h
//  Pods
//
//  Created by Alejandro Martinez on 28/02/14.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionView (AMPAdditions)

// Register a nib with the 'nameAndIdentifier' name from the app bundle (nil)
// using the 'nameAndIdentifier' as the reuse identifier.
- (void)registerNibWithNameAndIdentifier:(NSString *)nameAndIdentifier;

- (void)scrollToTopAnimated:(BOOL)animated;

- (void)scrollToTop;
@end
