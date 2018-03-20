//
//  HKOrderBranchStatusService.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/16.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKBranchStatusService.h"

@interface HKOrderBranchStatusService : HKBranchStatusService

@property (nonatomic, strong, readonly) NSString *imageName;                //气泡图片
@property (nonatomic, strong, readonly) NSString *suffix;                   //后缀(个车位)

@end
