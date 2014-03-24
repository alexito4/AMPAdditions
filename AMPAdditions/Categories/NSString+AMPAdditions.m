//
//  NSString+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 20/03/14.
//
//

#import "NSString+AMPAdditions.h"

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

@end
