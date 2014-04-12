//
//  NSDate+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 28/03/14.
//
//

#import "NSDate+AMPAdditions.h"
#import "NSDateFormatter+Cache.h"

@implementation NSDate (AMPAdditions)

- (NSString *)stringWithFormat:(NSString *)format {
    return [self stringWithFormat:format usingFormatter:[NSDateFormatter defaultFormatter]];
}

- (NSString *)stringWithFormat:(NSString *)format usingFormatter:(NSDateFormatter *)formatter {
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end
