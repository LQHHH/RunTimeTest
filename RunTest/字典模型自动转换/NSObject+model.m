//
// NSObject+model.m
// Created on 2020/6/22
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//

#import "NSObject+model.h"
#import <objc/runtime.h>

@implementation NSObject (model)

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        NSMutableArray *keys = [NSMutableArray new];
        unsigned int outCount;
        objc_property_t *propertys = class_copyPropertyList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            objc_property_t property = propertys[i];
            NSString *key = [NSString stringWithUTF8String:property_getName(property)];
            [keys addObject:key];
        }
        free(propertys);
        
        for (NSString *key in keys) {
            if ([dictionary.allKeys containsObject:key]) {
                [self setValue:dictionary[key] forKey:key];
            }
        }
    }
    
    return self;
}

@end
