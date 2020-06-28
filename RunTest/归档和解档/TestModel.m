//
// TestModel.m
// Created on 2020/6/18
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "TestModel.h"

@implementation TestModel

+ (instancetype)creatWithName:(NSString *)name
                          age:(NSInteger)age
                         date:(NSDate *)date
                       height:(float)height {
    TestModel *model = [[TestModel alloc] init];
    model.name = name;
    model.age = age;
    model.date = date;
    model.height = height;
    model.number = @(age + 100);
    model->enable = YES;
    return model;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: %p,\n", self.class, self];
    [description appendFormat:@"name: %@ \n",self.name];
    [description appendFormat:@"age: %ld \n",self.age];
    [description appendFormat:@"date: %@ \n",self.date];
    [description appendFormat:@"height: %.2f\n",self.height];
    [description appendFormat:@"number: %@\n",self.number];
    [description appendFormat:@"enable: %d\n",self->enable];
    
    return description;
}

- (NSString *)debugDescription {
    return [self description];
}

@end
