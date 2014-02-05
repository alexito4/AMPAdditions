//
//  UITableView+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 28/11/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AMPAdditions)

- (void)deselectSelectedRow;

- (CGFloat)heightForSection:(NSInteger)section;;

- (CGSize)totalSize;

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

// Register a nib with the 'nameAndIdentifier' name from the app bundle (nil)
// using the 'nameAndIdentifier' as the reuse identifier.
- (void)registerNibWithNameAndIdentifier:(NSString *)nameAndIdentifier;
@end
