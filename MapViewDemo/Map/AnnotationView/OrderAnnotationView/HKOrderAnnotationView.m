//
//  HKOrderAnnotationView.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/19.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKOrderAnnotationView.h"
#import "HKOrderAnnotation.h"

@interface HKOrderAnnotationView ()

@property (nonatomic, strong, readwrite) HKOrderBranchStatusService *branchStatus;

@end

@implementation HKOrderAnnotationView

- (void)setAnnotation:(id<MKAnnotation>)annotation {
    [super setAnnotation:annotation];
    HKOrderAnnotation *ann = (HKOrderAnnotation *)annotation;
    self.branchStatus = ann.branchStatus;

    self.image = [UIImage imageNamed:self.branchStatus.imageName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if(self.selected == selected) return;
    [super setSelected:selected animated:animated];
}

- (void)showAnnotationPopView {

}

- (void)hideAnnotationPopView {

}

@end
