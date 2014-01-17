//
//  NSObject+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 11/10/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "NSObject+AMPAdditions.h"
#import <objc/runtime.h>

@implementation NSObject (AMPAdditions)

- (NSMutableDictionary *)extraInfo {
	
    static const char * extraInfoKey = "extraInfoKey";
    
	NSMutableDictionary *objectUserInfo = objc_getAssociatedObject(self, extraInfoKey);
	if(objectUserInfo == nil) {
		objectUserInfo = [[NSMutableDictionary alloc] init];
		objc_setAssociatedObject(self, extraInfoKey, objectUserInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC); // (nonatomic, strong)
	}
    
	return objectUserInfo;
}

@end
