//
//  HKOrderAnnotationView.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKAnnotationView.h"
#import "HKOrderBranchStatusService.h"

@interface HKOrderAnnotationView : HKAnnotationView

@property (nonatomic, strong, readonly) HKOrderBranchStatusService *branchStatus;

@end
