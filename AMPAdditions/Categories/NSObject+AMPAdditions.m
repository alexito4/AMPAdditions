//
//  NSObject+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 11/10/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "NSObject+AMPAdditions.h"
#import <objc/runtime.h>

BOOL RSIsEmpty(id obj) {
	return obj == nil || obj == [NSNull null] || ([obj respondsToSelector:@selector(length)] && [(NSData *)obj length] == 0) || ([obj respondsToSelector:@selector(count)] && [obj count] == 0);
}

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

+ (NSString *)classString {
    return NSStringFromClass([self class]);
}

- (void)amp_logIvars {
    unsigned int varCount;
    Ivar *vars = class_copyIvarList(self.class, &varCount);
    for (int i = 0; i < varCount; i++) {
        Ivar var = vars[i];
        
        const char* name = ivar_getName(var);
        const char* typeEncoding = ivar_getTypeEncoding(var);
        
        // do what you wish with the name and type here
        NSLog(@"-> %s", name);
    }
    
    free(vars);
    
    unsigned int propCount;
    objc_property_t *properties = class_copyPropertyList(self.class, &propCount);
    for (int i = 0; i < propCount; i++) {
        objc_property_t property = properties[i];
        
        const char* name = property_getName(property);
        
        // do what you wish with the name and type here
        NSLog(@"-> %s", name);
    }
    
    free(vars);
}

@end
