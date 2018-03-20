//
//  LHYellowCarLicense.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHYellowCarLicense.h"

@implementation LHYellowCarLicense

// 打印牌照号
- (NSString *)printLicenseNumber{
    [super printLicenseNumber];
    return [NSString stringWithFormat:@"黄色牌照: %@",self.licenseNumber];
}

@end
