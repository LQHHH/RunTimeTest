//
// TModel.h
// Created on 2020/6/22
// Description <#⽂件描述#>
// Copyright © 2020  inc. All rights reserved. 
// @author hhh  
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TModel : NSObject

@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float weight;

@end

NS_ASSUME_NONNULL_END
