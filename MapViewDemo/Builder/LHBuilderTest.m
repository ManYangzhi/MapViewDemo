//
//  LHBuilderTest.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHBuilderTest.h"

@implementation LHBuilderTest

+ (void)load {
    LHBuickBuilder *builder = [[LHBuickVeranoBuilder alloc]init];
    LHBuickCar *buickCar = [LHDirector4S creatBuickCar:builder];
    NSLog(@"%@",[buickCar description]);
}

@end
