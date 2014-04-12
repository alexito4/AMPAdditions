//
//  NSDate+AMPAdditions.h
//  Pods
//
//  Created by Alejandro Martinez on 28/03/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (AMPAdditions)

/**
 *  Converts the NSDate to an NSString using the format.
 *  It uses a default cached NSDateFormatter.
 *
 *  @param format Format for the output string.
 *
 *  @return NSString version of the NSDate.
 */
- (NSString *)stringWithFormat:(NSString *)format;

/**
 *  Converts the NSDate to an NSString using the format.
 *  It uses the formatter to do the conversion.
 *
 *  @param format    Format for the output string.
 *  @param formatter Formatter to use in the conversion.
 *
 *  @return NSString version of the NSDate.
 */
- (NSString *)stringWithFormat:(NSString *)format usingFormatter:(NSDateFormatter *)formatter;

@end
