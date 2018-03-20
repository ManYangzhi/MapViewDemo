//
//  SimpleFactoryTest.m
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "SimpleFactoryTest.h"

@implementation SimpleFactoryTest

// 生成蓝色牌照
- (void)createBlueCarLicense {
    LHCarLicense *_license = [LHBlueCarLicenseFactory createCarLicense];
    _license.city = @"京";
    [_license printLicenseNumber];
    
}

// 生成黄色牌照
- (void)createYellowCarLicense {
    LHCarLicense *_license = [LHYellowCarLicenseFactory createCarLicense];
    _license.city = @"京";
    [_license printLicenseNumber];
}


@end
