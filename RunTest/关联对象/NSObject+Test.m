//
// NSObject+Test.m
// Created on 2020/6/16
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "NSObject+Test.h"
#import <objc/runtime.h>


@implementation NSObject (Test)

- (int)ns_count {
    return [objc_getAssociatedObject(self, "ns_count") intValue];
}

- (void)setNs_count:(int)ns_count {
    objc_setAssociatedObject(self, "ns_count", @(ns_count), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)ns_name {
    return objc_getAssociatedObject(self, "ns_name");
}

- (void)setNs_name:(NSString *)ns_name {
    objc_setAssociatedObject(self, "ns_name", ns_name, OBJC_ASSOCIATION_RETAIN);
}

@end
