//
//  HKAnnotationPopView.m
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKAnnotationPopView.h"
#import "HKBranchStatusService.h"
#import "HKAnnotationPopItemView.h"

static CGFloat const kArrowSize = 10.0;
static CGFloat const kWidth = 60.0;
static CGFloat const kCornerRadius = 20.0;

@interface HKAnnotationPopView ()

@property (nonatomic, strong) HKAnnotationPopItemView *itemView;

@end

@implementation HKAnnotationPopView {
    UIView *bottomLeftView;
    UIView *bottomRightView;
    UIView *bottomView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowRadius = 2;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        
        bottomView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                             frame.size.height - kArrowSize - 1,
                                                             self.frame.size.width,
                                                             kArrowSize)];
        bottomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bottomView];

        bottomLeftView = [[UIButton alloc]initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   kWidth,
                                                                   kArrowSize)];
        bottomLeftView.backgroundColor = [UIColor whiteColor];
        [bottomView addSubview:bottomLeftView];
        
        bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(kWidth,
                                                                  0,
                                                                  self.frame.size.width - kWidth,
                                                                  kArrowSize)];
        bottomRightView.backgroundColor = [UIColor whiteColor];
        [bottomView addSubview:bottomRightView];
        
        CGPoint pointArrM[] = {
            CGPointMake((self.width - kArrowSize) / 2 + 4, kArrowSize),
            CGPointMake((self.width - kArrowSize) / 2 + 16, 0),
            CGPointMake(self.frame.size.width, 0),
        };
        bottomView.layer.mask = [self createMask:pointArrM count:3];
    
    }
    return self;
}

- (CAShapeLayer *)createMask:(CGPoint[])points count:(int)count {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((self.width - kArrowSize) / 2 - 8,0)];
    for (int i = 0; i < count; i++) {
        [path addLineToPoint:points[i]];
    }
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = path.CGPath;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor clearColor].CGColor;
    borderLayer.lineWidth = 0.5;
    borderLayer.frame = bottomView.bounds;
    [bottomView.layer addSublayer:borderLayer];
    return maskLayer;
}

- (void)setBranchStatus:(HKBranchStatusService *)branchStatus {
    _branchStatus = branchStatus;
    
    HKAnnotationPopItemView *itemView = [[HKAnnotationPopItemView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - kArrowSize) branchStatus:branchStatus];
    itemView.backgroundColor = [UIColor whiteColor];
    itemView.layer.cornerRadius = kCornerRadius;
    [self addSubview:itemView];
    self.itemView = itemView;
}

@end
