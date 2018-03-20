//
//  HKAnnotationPoiView.h
//  KoraApp
//
//  Created by yangzhi on 17/1/19.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
#import "KVOController.h"

@class HKBranchStatusService;
@class HKOrderBranchStatusService;
@class HKMainBranchStatusService;

@interface HKAnnotationPopItemView : UIView

- (instancetype)initWithFrame:(CGRect)frame branchStatus:(HKBranchStatusService *)branchStatus;
- (instancetype)initWithFrame:(CGRect)frame mainBranchStatus:(HKMainBranchStatusService *)branchStatus;
- (instancetype)initWithFrame:(CGRect)frame orderBranchStatus:(HKOrderBranchStatusService *)branchStatus;

@property (nonatomic, strong, readonly) HKMainBranchStatusService *mainBranchStatus;
@property (nonatomic, strong, readonly) HKOrderBranchStatusService *orderBranchStatus;

@end
