//
//  LHBuickCar.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHBuickCar.h"

@implementation LHBuickCar

// 让他做跟自我介绍
- (NSString *)description{
    return [NSString stringWithFormat:@"我是一辆:%@ %@车 价格:%@",self.name,self.level,self.price];
}

@end
