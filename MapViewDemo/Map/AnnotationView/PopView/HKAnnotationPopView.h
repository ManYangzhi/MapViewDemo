//
//  HKAnnotationPopView.h
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HKBranchStatusService;

@interface HKAnnotationPopView : UIButton

@property (nonatomic, strong) HKBranchStatusService *branchStatus;

@end
