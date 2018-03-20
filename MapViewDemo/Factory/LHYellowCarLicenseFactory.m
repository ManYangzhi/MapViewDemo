//
//  LHYellowCarLicenseFactory.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "LHYellowCarLicenseFactory.h"
#import "LHYellowCarLicense.h"

@implementation LHYellowCarLicenseFactory

+ (LHCarLicense *)createCarLicense {
    LHYellowCarLicense *_blueCarLicense = [[LHYellowCarLicense alloc]init];
    return _blueCarLicense;
}

@end
