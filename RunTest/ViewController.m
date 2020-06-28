//
// ViewController.m
// Created on 2020/6/16
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "ViewController.h"
#import "Person.h"
#import "NSObject+Test.h"
#import "NSDate+test.h"
#import "TestModel.h"
#import "TModel.h"
#import "NSObject+model.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //动态方法解析
    Person *p = [Person new];
    [p performSelector:@selector(test:)];
    
    //备用接收者实现
    [p performSelector:@selector(test1)];
    
    //完整的消息转发
    [p performSelector:@selector(test2)];
    
    //给扩展增加属性
    NSObject *objc = [NSObject new];
    objc.ns_count = 10;
    objc.ns_name = @"xiaoming";
    NSLog(@"count:%d ---- name:%@", objc.ns_count, objc.ns_name);
    
    //方法交换
    NSDate *date = [NSDate date];
    [date dateByAddingTimeInterval:2];
    
    //自动归档和解档
    TestModel *model = [TestModel creatWithName:@"小明" age:20 date:date height:180.5];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model requiringSecureCoding:YES error:nil];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"testModel"];
    [data writeToFile:path atomically:YES];
    sleep(1);
    NSData *data1 = [NSData dataWithContentsOfFile:path];
    TestModel *model1 = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithArray:@[[NSNumber class],[NSDate class],[TestModel class]]] fromData:data1 error:nil];
    NSLog(@"model1:%@",model1);
    
    //字典模型自动转换
    NSDictionary *dict = @{@"name": @"小王",
                           @"number": @(231),
                           @"age": @(20),
                           @"weight": @(138.5)};
    TModel *tModel = [[TModel alloc] initWithDict:dict];
    NSLog(@"tModel: %@", tModel);
    
}



@end
