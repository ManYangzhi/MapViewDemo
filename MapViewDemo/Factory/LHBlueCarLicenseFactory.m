//
//  LHBlueCarLicenseFactory.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHBlueCarLicenseFactory.h"
#import "LHBlueCarLicense.h"
@implementation LHBlueCarLicenseFactory

+ (LHCarLicense *)createCarLicense {
    LHBlueCarLicense *_blueCarLicense = [[LHBlueCarLicense alloc]init];
    return _blueCarLicense;
}

@end
