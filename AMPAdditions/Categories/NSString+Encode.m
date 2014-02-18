//
//  NSString+Encode.m
//  
//
//  Created by Alejandro Martinez on 26/01/14.
//
//

#import "NSString+Encode.h"

@implementation NSString (Encode)

- (NSString *)encodeURLString:(NSStringEncoding)encoding
{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self,
                                                                NULL, (CFStringRef)@";/?:@&=$+{}<>,",
                                                                CFStringConvertNSStringEncodingToEncoding(encoding)));
}

@end
