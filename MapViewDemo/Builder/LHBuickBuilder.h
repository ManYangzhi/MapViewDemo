//
//  LHBuickBuilder.h
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHBuickCar.h"

@interface LHBuickBuilder : NSObject
@property (nonatomic, copy)NSString *name;// 名字
@property (nonatomic, copy)NSString *level;// 级别
@property (nonatomic, copy)NSString *price;// 价格

- (LHBuickCar *)makeBuickCar;

@end
