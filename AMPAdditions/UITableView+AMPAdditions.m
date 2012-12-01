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

@end
