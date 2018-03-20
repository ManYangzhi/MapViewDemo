//
//  HKMapViewAnnotation.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKAnnotation.h"
#import "HKMainBranchStatusService.h"

@interface HKMainAnnotation : HKAnnotation

- (instancetype)initWithBranchStatus:(HKMainBranchStatusService *)branchStatus;
@property (nonatomic, strong, readonly) HKMainBranchStatusService *branchStatus;

@end
