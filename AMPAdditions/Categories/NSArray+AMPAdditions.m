//
//  NSArray+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "NSArray+AMPAdditions.h"

@implementation NSArray (AMPAdditions)

- (BOOL)isEmpty {
    return self.count == 0;
}

- (NSMutableArray *)mutableArray
{
    return [NSMutableArray arrayWithArray:self];
}

- (NSArray *)reversedArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSMutableArray (AMPAdditions)

- (void)reverse {
    if ([self count] == 0) {
        return;
    }
        
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

@end
