//
// NSDate+test.m
// Created on 2020/6/17
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "NSDate+test.h"
#import <objc/runtime.h>

@implementation NSDate (test)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //类方法交换
        SEL originalSelector = @selector(date);
        SEL swizzingSelector = @selector(hz_date);
        Class class = object_getClass(self);//交换类方法需要获取类的isa获取元类 [self class]返回的是类本身,object_getClass返回的是元类
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzingMethod = class_getClassMethod(class, swizzingSelector);
        [self swizzingWithClass:class
               originalSelector:originalSelector
               swizzingSelector:swizzingSelector
                 originalMethod:originalMethod
                 swizzingMethod:swizzingMethod];
        
        //对象方法交换
        SEL originalSelector1 = @selector(dateByAddingTimeInterval:);
        SEL swizzingSelector1 = @selector(hz_dateByAddingTimeInterval:);
        Class class1 = [self class];
        Method originalMethod1 = class_getInstanceMethod(class1, originalSelector1);
        Method swizzingMethod1 = class_getInstanceMethod(class1, swizzingSelector1);
        [self swizzingWithClass:class1
               originalSelector:originalSelector1
               swizzingSelector:swizzingSelector1
                 originalMethod:originalMethod1
                 swizzingMethod:swizzingMethod1];
        
    });
    
}

+ (void)swizzingWithClass:(Class)class
         originalSelector:(SEL)originalSelector
         swizzingSelector:(SEL)swizzingSelector
           originalMethod:(Method)originalMethod
           swizzingMethod:(Method)swizzingMethod {
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzingMethod), method_getTypeEncoding(swizzingMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzingMethod);
    }
}

+ (instancetype)hz_date {
    NSLog(@"[NSDate date]方法交换成功");
    return [self hz_date];
}

- (instancetype)hz_dateByAddingTimeInterval:(NSTimeInterval)seconds {
    NSLog(@"dateByAddingTimeInterval方法交换成功");
    return [self hz_dateByAddingTimeInterval:seconds];
}

@end
