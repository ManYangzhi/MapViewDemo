//
//  HKMapViewBranchStatusService.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/16.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKBranchStatusService.h"

@interface HKMainBranchStatusService : HKBranchStatusService

@property (nonatomic, copy) NSString *avaliableCount;                       //可用数

/** UI相关数据 */
@property (nonatomic, assign, readonly) HKBranchStatusType status;          //网点运营状态
@property (nonatomic, strong, readonly) UIColor *color;                     //颜色(状态对应的颜色)
@property (nonatomic, strong, readonly) NSString *title;                    //状态名称(同点还、任异还)
@property (nonatomic, strong, readonly) NSString *imageName;                //气泡图片
@property (nonatomic, strong, readonly) NSString *suffix;                   //后缀(辆可用)

@end
