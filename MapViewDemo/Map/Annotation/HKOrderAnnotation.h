//
//  HKOrderAnnotation.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKAnnotation.h"
#import "HKOrderBranchStatusService.h"

@interface HKOrderAnnotation : HKAnnotation

- (instancetype)initWithBranchStatus:(HKOrderBranchStatusService *)branchStatus;
@property (nonatomic, strong, readonly) HKOrderBranchStatusService *branchStatus;

@end
