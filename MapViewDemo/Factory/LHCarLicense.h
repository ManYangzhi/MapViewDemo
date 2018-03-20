//
//  LHCarLicense.h
//  Notification
//
//  Created by yangzhi on 2017/11/22.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LHCarLicenseProtocol <NSObject>

//打印拍照
- (NSString *)printLicenseNumber;

@end

@interface LHCarLicense : NSObject<LHCarLicenseProtocol>

@property(nonatomic, copy)NSString              *city; // 城市
@property(nonatomic, copy, readonly)NSString    *licenseNumber; // 车牌号

@end
