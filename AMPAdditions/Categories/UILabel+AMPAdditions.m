//
//  UILabel+AMPAdditions.m
//  Pods
//
//  Created by Alejandro Martinez on 17/02/14.
//
//

#import "UILabel+AMPAdditions.h"

@implementation UILabel (AMPAdditions)

- (CGFloat)heightForText {
    return [self amp_boundingRectForText].size.height;
}

- (CGRect)amp_boundingRectForText {
    return [self.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.bounds), CGFLOAT_MAX)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName: self.font}
                                   context:nil];
}

@end
