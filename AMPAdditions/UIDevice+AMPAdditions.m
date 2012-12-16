//
//  UIDevice+AMPAdditions.m
//   
//
//  Created by Alejandro Martinez on 15/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIDevice+AMPAdditions.h"

@implementation UIDevice (AMPAdditions)

- (BOOL)isPhone {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}

- (BOOL)isPad {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

@end
