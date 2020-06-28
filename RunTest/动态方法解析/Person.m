//
// Person.m
// Created on 2020/6/16
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "Person.h"
#import "StandbyObject.h"
#import <objc/runtime.h>

@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test:)) {
        class_addMethod([self class], sel, (IMP)functionTest, "v@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

void functionTest(id obj, SEL _cmd) {
    NSLog(@"执行了test函数");
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(test1)) {
        return [StandbyObject new];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"test2"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    StandbyObject *objc = [StandbyObject new];
    if ([objc respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:objc];
    } else {
        [self doesNotRecognizeSelector:anInvocation.selector];
    }
}

@end
