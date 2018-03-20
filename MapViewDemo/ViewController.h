//
//  ViewController.h
//  MapViewDemo
//
//  Created by yangzhi on 16/12/29.
//  Copyright © 2016年 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
#import "SVProgressHUD.h"
#import "YYModel.h"
#import "HKEnumConstant.h"
#import "HKMapView.h"
#import "HKNaviWalkManager.h"

@interface ViewController : UIViewController

@property (nonatomic, assign) HKBranchType type;
@property (nonatomic, assign) HKVehicleOrderStatus vehicleStatus;
@property (nonatomic, assign) HKChargerOrderStatus chargerStatus;

@property (nonatomic, strong) HKMapView *mapView;
@property (nonatomic, strong) HKNaviWalkManager *walkManager;

@end

