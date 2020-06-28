//
// TestModel.h
// Created on 2020/6/18
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import "CodecObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : CodecObject
{
    BOOL enable;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) float height;
@property (nonatomic, strong) NSNumber *number;

+ (instancetype)creatWithName:(NSString *)name
                          age:(NSInteger)age
                         date:(NSDate *)date
                       height:(float)height;

@end

NS_ASSUME_NONNULL_END
