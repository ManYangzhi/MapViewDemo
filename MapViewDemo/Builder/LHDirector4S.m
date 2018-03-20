//
//  LHDirector4S.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHDirector4S.h"

@implementation LHDirector4S

+ (LHBuickCar *)creatBuickCar:(LHBuickBuilder *)builder {
    LHBuickCar *buickCar = [builder makeBuickCar];
    return buickCar;
}

@end
