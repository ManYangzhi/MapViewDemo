//
//  LHBuickBuilder.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHBuickBuilder.h"

@implementation LHBuickBuilder

- (LHBuickCar *)makeBuickCar {
    LHBuickCar *buickCar = [[LHBuickCar alloc]init];
    buickCar.name = self.name;
    buickCar.level = self.level;
    buickCar.price = self.price;
    return buickCar;
}

@end
