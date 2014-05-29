//
//  NSObject+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 11/10/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL RSIsEmpty(id obj);

@interface NSObject (AMPAdditions)

- (NSMutableDictionary *)extraInfo;

+ (NSString *)classString;

- (void)amp_logIvars;

@end
