//
//  NSUserDefaults+AMPAdditions.m
//   
//
//  Created by Alejandro Martinez on 12/12/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "NSUserDefaults+AMPAdditions.h"

NSString *const kUUID = @"uuid";

@implementation NSUserDefaults (AMPAdditions)

- (NSString *)userIdentifier {
    NSString *uuid = [self valueForKey:kUUID];
    if (!uuid) {
        uuid = [[NSUUID UUID] UUIDString];
        [self setValue:uuid forKey:kUUID];
        [self synchronize];
    }
    return uuid;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if (![self valueForKey:key]) {
        [self setValue:value forKey:key];
    }
}

@end
