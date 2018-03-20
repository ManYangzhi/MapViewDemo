//
//  HKMapAnnotationView.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKAnnotationView.h"
#import "HKMainBranchStatusService.h"
#import "KVOController.h"

@interface HKMainAnnotationView : HKAnnotationView

@property (nonatomic, strong, readonly) HKMainBranchStatusService *branchStatus;

@end
