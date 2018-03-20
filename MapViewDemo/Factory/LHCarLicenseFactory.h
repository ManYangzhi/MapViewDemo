//
//  LHCarLicenseFactory.h
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LHCarLicense;

@interface LHCarLicenseFactory : NSObject

/**
 *  获取牌照工厂
 *
 *  @return 返回牌照对象
 */
+ (LHCarLicense *)createCarLicense;

@end
