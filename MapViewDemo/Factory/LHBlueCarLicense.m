//
//  LHBlueCarLicense.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHBlueCarLicense.h"

@implementation LHBlueCarLicense

- (NSString *)printLicenseNumber{
    [super printLicenseNumber];
    return [NSString stringWithFormat:@"蓝色牌照: %@",self.licenseNumber];
}

@end
