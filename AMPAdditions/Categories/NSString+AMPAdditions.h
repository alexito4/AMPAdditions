//
//  NSString+AMPAdditions.h
//  Pods
//
//  Created by Alejandro Martinez on 20/03/14.
//
//

#import <Foundation/Foundation.h>

@interface NSString (AMPAdditions)

+ (NSString *)amp_randomString;

- (NSDate *)dateWithFormat:(NSString *)format;
- (NSDate *)dateWithFormat:(NSString *)format usingFormatter:(NSDateFormatter *)formatter;

@end