//
//  UIImage+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 16/03/14.
//
//

#import "UIImage+AMPAdditions.h"

@implementation UIImage (AMPAdditions)

+ (UIImage *)amp_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end