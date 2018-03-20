//
//  HKEnumConstant.h
//  KoraApp
//
//  Created by yangzhi on 16/12/15.
//  Copyright © 2016年 Neusoft. All rights reserved.
//

#ifndef HKEnumConstant_h
#define HKEnumConstant_h

//网点类型
typedef NS_ENUM(NSUInteger, HKBranchType) {
    HKBranchTypeVehicle = 0,    //租车
    HKBranchTypeCharger,        //充电
};

//车辆订单状态
typedef NS_ENUM(NSUInteger, HKVehicleOrderStatus) {
    HKVehicleOrderStatusNone = 0,        //原始状态
    HKVehicleOrderStatusBooking,         //预约
    HKVehicleOrderStatusUsing,           //使用中
    HKVehicleOrderStatusToBePaid,        //待支付
    HKVehicleOrderStatustusCompleted,    //已完成
    HKVehicleOrderStatusCanceled,        //已取消
    HKVehicleOrderStatusTimeOut,         //已超时
    HKVehicleOrderStatusLogOut           //已退出
};

//电桩订单状态
typedef NS_ENUM(NSUInteger, HKChargerOrderStatus) {
    HKChargerOrderStatusNone = 0,        //原始状态
    HKChargerOrderStatusBooking,         //等待充电
    HKChargerOrderStatusUsing,           //充电中
    HKChargerOrderStatusStop,            //停止充电
    HKChargerOrderStatusToBePaid,        //待支付
    HKChargerOrderStatusCompleted,       //已完成
    HKChargerOrderStatusCanceled,        //已取消
    HKChargerOrderStatusTimeOut,         //已超时
};

//网点状态
typedef NS_ENUM(NSUInteger, HKBranchStatusType) {
    HKBranchStatusNone = 0,                 //默认
    HKBranchStatusBuild = 1,                //兴建中
    HKBranchStatusMaintain = 2,             //维护中
    HKBranchStatusRun = 4,                  //运营
    HKBranchStatusDis = 8,                  //禁用
    HKBranchStatusOnLine = 9,               //联网
    HKBranchStatusUnOnline = 10,            //未联网
    HKBranchStatusReturnSame = 11,          //同点还
    HKBranchStatusReturnAnyWhere = 12       //任异还
};



#endif /* HKEnumConstant_h */
