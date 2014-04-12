//
//  NSDateFormatter+Cache.m
//  Pods
//
//  Created by Alejandro Martinez on 28/03/14.
//
//

#import "NSDateFormatter+Cache.h"

@implementation NSDateFormatter (Cache)

+ (NSDateFormatter *)defaultFormatter {
    static dispatch_once_t once;
    static NSDateFormatter *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
