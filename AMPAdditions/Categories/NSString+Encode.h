//
//  NSString+Encode.h
//  
//
//  Created by Alejandro Martinez on 26/01/14.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)

/**
 *  Based on http://iosdevelopertips.com/networking/url-encoding-method-in-objective-c.html
 */
- (NSString *)encodeURLString:(NSStringEncoding)encoding;

@end
