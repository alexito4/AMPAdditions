//
//  NSArray+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AMPAdditions)


- (BOOL)isEmpty;

/**
 * Returns a NSMutableArray with the same content of the original array.
 */
- (NSMutableArray *)mutableArray;

/**
 * Returns an NSArray with the same elements in reverse order.
 */
- (NSArray *)reversedArray;
@end

@interface NSMutableArray (AMPAdditions)
/**
 * Reverse the order of the objects.
 */
- (void)reverse;

@end
