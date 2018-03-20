//
//  LHDirector4S.h
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHBuickCar.h"
#import "LHBuickBuilder.h"

@interface LHDirector4S : NSObject

// 根据客户的要求介绍一辆别克车
+ (LHBuickCar *)creatBuickCar:(LHBuickBuilder *)builder;

@end
