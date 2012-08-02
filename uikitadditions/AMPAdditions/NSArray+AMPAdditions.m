//
//  NSArray+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "NSArray+AMPAdditions.h"

@implementation NSArray (AMPAdditions)

- (id)firstObject
{
    return [self count] > 0 ? [self objectAtIndex:0] : nil;
}

- (NSMutableArray *)mutableArray
{
    return [NSMutableArray arrayWithArray:self];
}

@end
