//
//  HKMapAnnotationView.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKMainAnnotationView.h"
#import "HKMainAnnotation.h"
#import "HKAnnotationPopView.h"

@interface HKMainAnnotationView ()

@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) HKAnnotationPopView *popView;
@property (nonatomic, strong, readwrite) HKMainBranchStatusService *branchStatus;

@end

@implementation HKMainAnnotationView

- (void)setAnnotation:(id<MKAnnotation>)annotation {
    [super setAnnotation:annotation];
    HKMainAnnotation *ann = (HKMainAnnotation *)annotation;
    self.branchStatus = ann.branchStatus;

    self.image = [UIImage imageNamed:self.branchStatus.imageName];

    [self.KVOController observe:self.branchStatus
                    keyPath:@"avaliableCount"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString*,id> * _Nonnull change) {
                            [self update];
    }];
    self.countLabel.textColor = self.branchStatus.color;
    [self update];
}

- (void)update {
    self.countLabel.text = self.branchStatus.avaliableCount;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if(self.selected == selected) return;
    [super setSelected:selected animated:animated];
}

- (void)showAnnotationPopView {
    HKAnnotationPopView *popView = [[HKAnnotationPopView alloc]initWithFrame:CGRectMake(-(175 - self.countLabel.frame.size.width) / 2, -55, 175, 50)];
    [self addSubview:popView];
    self.popView = popView;
    self.popView.branchStatus = self.branchStatus;
    
    [HKAnnotationView startAnimatedWithView:self.popView anchorPoint:self.popView.layer.anchorPoint];
}

- (void)hideAnnotationPopView {
    [self.popView removeFromSuperview];
    self.popView = nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL inside = [super pointInside:point withEvent:event];
    if (!inside && self.selected) {
        inside = [self.popView pointInside:[self convertPoint:point toView:self.popView] withEvent:event];
    }
    return inside;
}

#pragma mark - getter
- (UILabel *)countLabel {
    if (_countLabel) return _countLabel;
    _countLabel = ({
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 26, 26)];
        lab.font = [UIFont systemFontOfSize:15];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        lab;
    });
    return _countLabel;
}

@end
