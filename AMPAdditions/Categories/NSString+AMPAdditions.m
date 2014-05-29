//
//  NSString+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 20/03/14.
//
//

#import "NSString+AMPAdditions.h"
#import "NSDateFormatter+Cache.h"

BOOL AMPStringIsEmpty(NSString *s) {
    /*22 Feb. 2011: added NSNull check. JSON parser can put a null where we expect a string, and NSNull throws an exception when checking length. Since [NSNull null] is, arguably, emptiness, it makes sense to include it.*/
	return s == nil || (id)s == (id)[NSNull null] || [s length] == 0;
}

@implementation NSString (AMPAdditions)

+ (NSString *)amp_randomString {
    NSInteger lenght = arc4random_uniform(10);
    NSMutableString *word = [NSMutableString string];
    for (NSInteger i = 0; i < lenght; i++) {
        NSString *letter = [NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a'];
        [word appendString:letter];
    }
    return word;
}

- (NSDate *)dateWithFormat:(NSString *)format {
    return [self dateWithFormat:format usingFormatter:[NSDateFormatter defaultFormatter]];
}

- (NSDate *)dateWithFormat:(NSString *)format usingFormatter:(NSDateFormatter *)formatter {
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

@end