//
//  UITableView+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 28/11/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UITableView+AMPAdditions.h"

@implementation UITableView (AMPAdditions)

- (void)deselectSelectedRow {
    [self deselectSelectedRow:YES];
}

- (void)deselectSelectedRow:(BOOL)animated {
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:animated];
}

- (CGFloat)heightForSection:(NSInteger)section {
    return [self rectForSection:section].size.height;
}

- (CGSize)totalSize {
    CGFloat height = 0;
    CGFloat width = 0;
    NSInteger sections = [self numberOfSections];
    for (int i = 0; i < sections; i++) {
        CGSize size = [self rectForSection:i].size;
        height += size.height;
        width += size.width;
    }
    return CGSizeMake(width, height);
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    NSAssert(indexPath, @"indexPath can't be nil");
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)registerNibWithNameAndIdentifier:(NSString *)nameAndIdentifier {
    [self registerNib:[UINib nibWithNibName:nameAndIdentifier bundle:nil] forCellReuseIdentifier:nameAndIdentifier];
}

@end
