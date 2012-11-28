//
//  UIFont+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 27/11/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIFont+AMPAdditions.h"

@implementation UIFont (AMPAdditions)

+ (UIFont *)systemFont {
    return [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

+ (UIFont *)boldSystemFont {
    return [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
}

+ (UIFont *)italicSystemFont {
    return [UIFont italicSystemFontOfSize:[UIFont systemFontSize]];
}

@end
