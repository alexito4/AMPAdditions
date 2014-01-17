//
//  NSUserDefaults+AMPAdditions.h
//   
//
//  Created by Alejandro Martinez on 12/12/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (AMPAdditions)

- (NSString *)userIdentifier;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
