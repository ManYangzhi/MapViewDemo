//
//  HKAnnotationPoiView.m
//  KoraApp
//
//  Created by yangzhi on 17/1/19.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKAnnotationPopItemView.h"
#import "HKMainBranchStatusService.h"
#import "HKOrderBranchStatusService.h"

@interface HKAnnotationPopItemView ()
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@end

@implementation HKAnnotationPopItemView

- (instancetype)initWithFrame:(CGRect)frame branchStatus:(HKBranchStatusService *)branchStatus {
    if ([branchStatus isKindOfClass:[HKMainBranchStatusService class]]) {
        return [self initWithFrame:frame mainBranchStatus:(HKMainBranchStatusService *)branchStatus];
    }
    if ([branchStatus isKindOfClass:[HKOrderBranchStatusService class]]) {
        return [self initWithFrame:frame orderBranchStatus:(HKOrderBranchStatusService *)branchStatus];
    }
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame mainBranchStatus:(HKMainBranchStatusService *)branchStatus {
    self = [super initWithFrame:frame];
    if (self) {
        _mainBranchStatus = branchStatus;
        [self.KVOController observe:_mainBranchStatus
                keyPath:@"avaliableCount"
                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString*,id> * _Nonnull change) {
                        [self update];
        }];
        
        UILabel *label1 = ({
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(12, 2, 40, self.height / 2)];
            label.font = [UIFont systemFontOfSize:self.height / 2 + 2];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            label;
        });
        
        UILabel *label2 = ({
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(label1.left, label1.bottom, label1.width, label1.height - 4)];
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            label;
        });
        
        UIImageView *line = ({
            UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(label1.right, 3, 1, self.height - 6)];
            [self addSubview:view];
            view;
        });
        
        UILabel *label3 = ({
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(line.right + 5, 2, 80, self.height / 2 - 2)];
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentLeft;
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            [self addSubview:label];
            label;
        });
        
        UILabel *label4 = ({
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(label3.left, label3.bottom, label3.width, label3.height)];
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentLeft;
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            [self addSubview:label];
            label;
        });
        
        UIButton *navi = ({
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(label3.right, 2, self.height - 4, self.height - 4)];
            button.layer.cornerRadius = button.width / 2;
            button.layer.masksToBounds = YES;
            [button addTarget:self action:@selector(naviButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            button;
        });
        
        label1.text = self.mainBranchStatus.avaliableCount;
        label1.textColor = self.mainBranchStatus.color;
        
        label2.text = self.mainBranchStatus.suffix;
        label2.textColor = [UIColor lightGrayColor];

        label3.text = self.mainBranchStatus.walkDistance;
        label3.textColor = [UIColor blackColor];
        
        label4.text = self.mainBranchStatus.walkTime;
        label4.textColor = [UIColor blackColor];
        
        line.image = [UIImage imageNamed:@"line"];
        [navi setBackgroundImage:[UIImage imageNamed:@"map_mark_pop_navi"] forState:UIControlStateNormal];
        
        self.label1 = label1;
        self.label2 = label2;
        self.label3 = label3;
        self.label4 = label4;
        
        [self update];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame orderBranchStatus:(HKOrderBranchStatusService *)branchStatus {
    self = [super initWithFrame:frame];
    if (self) {
        _orderBranchStatus = branchStatus;
    }
    return self;
}

- (void)update {
    self.label1.text = self.mainBranchStatus.avaliableCount;
}

- (void)naviButtonClick:(UIButton *)sender {
    NSLog(@"%p",__func__);
}

@end
