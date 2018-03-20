//
//  HKMapViewAnnotation.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKMainAnnotation.h"

@implementation HKMainAnnotation

- (instancetype)initWithBranchStatus:(HKMainBranchStatusService *)branchStatus {
    self =  [super init];
    if (self) {
        _branchStatus = branchStatus;
    }
    return self;
}

@end
