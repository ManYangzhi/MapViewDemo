//
//  HKOutLetStatusModel.h
//  KoraApp
//
//  Created by yangzhi on 17/1/24.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HKBranchStatusModel : NSObject

@property (nonatomic, strong) NSString *branchID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *carportTotalCount;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *lot;
@property (nonatomic, strong) NSString *status;         // 网点状态：1.兴建，2.维护，4.运营，8禁用
@property (nonatomic, strong) NSString *onlineType;     // 网点是否联网,1:联网,2:未联网
@property (nonatomic, strong) NSString *operateFlag;    // 自营标记,1:自营,2:第三方
@property (nonatomic, strong) NSString *returnFlag;     // 同网点归还标识：1 同点还 ，2 任异还

@end
