//
// TModel.m
// Created on 2020/6/22
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "TModel.h"

@implementation TModel

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: %p,\n", self.class, self];
    [description appendFormat:@"name: %@ \n",self.name];
    [description appendFormat:@"age: %ld \n",self.age];
    [description appendFormat:@"weight: %.2f\n",self.weight];
    [description appendFormat:@"number: %@\n",self.number];
    return description;
}

- (NSString *)debugDescription {
    return [self description];
}

@end
