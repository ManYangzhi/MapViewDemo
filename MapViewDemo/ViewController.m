//
//  ViewController.m
//  MapViewDemo
//
//  Created by yangzhi on 16/12/29.
//  Copyright © 2016年 Neusoft. All rights reserved.
//

#import "ViewController.h"

#import "HKNaviWalkManager.h"
#import "HKMapNaviRoute.h"

#import "HKMapView+ScaleAnimated.h"
#import "GradientPolylineOverlay.h"

#import "HKMainBranchStatusService.h"
#import "HKMainAnnotationView.h"
#import "HKMainAnnotation.h"

#import "HKOrderBranchStatusService.h"
#import "HKOrderAnnotationView.h"
#import "HKOrderAnnotation.h"

@interface ViewController ()<HKMapViewDelegate,HKMapNaviWalkManagerDelegate>

@property (nonatomic, strong) HKMainAnnotation *nearestAnnotation;//用于地图缩放(以用户为中心，地图展示离用户最近的一个mark)
@property (nonatomic, strong) HKMainAnnotationView *currentAnnotationView;
@property (nonatomic, strong) NSMutableArray<id<MKAnnotation>> *annotationArrM;
@property (nonatomic, assign) NSInteger currentSelectIndex;
@property (nonatomic, strong) UIView *bottomContentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentSelectIndex = 0;
    
    self.type = HKBranchTypeVehicle;//默认状态
    
    self.annotationArrM = @[].mutableCopy;

    self.walkManager = [[HKNaviWalkManager alloc]init];
    self.walkManager.delegate = self;

    [self setUpViews];
}

- (void)setUpViews {
    HKMapView *mapView = [[HKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mapView.hk_delegate = self;
    [self.view addSubview:mapView];
    self.mapView = mapView;
    
    //测试而已。。真实场景main与order在不同的vc
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"Main",@"Order"]];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    
    UIView *bottomContentView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height - 50, self.view.width, 50)];
    bottomContentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomContentView];
    self.bottomContentView = bottomContentView;
    
    NSArray *array = @[@"重载",@"租车",@"充电",@"更新数量"];//更新数量,只在气泡弹出时起作用。是指当mark选中的时候，改变弹出的view和mark内部的数字
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * self.view.width / array.count, 0, self.view.width / array.count, 50)];
        button.tag = i;
        button.backgroundColor = [UIColor lightGrayColor];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomContentView addSubview:button];
    }
}

- (void)segmentControlChanged:(UISegmentedControl *)segmentControl {
    self.currentSelectIndex = segmentControl.selectedSegmentIndex;
    if (segmentControl.selectedSegmentIndex == 0) {
    
        self.type = HKBranchTypeVehicle;
        [self loadData];
        
        [UIView animateWithDuration:0.25 animations:^{
           self.bottomContentView.frame = CGRectMake(0, self.view.height - 50, self.view.width, 50);
        }];
    } else {
    
        self.vehicleStatus = HKVehicleOrderStatusBooking;
        [self loadData];
        
        [UIView animateWithDuration:0.25 animations:^{
           self.bottomContentView.frame = CGRectMake(0, self.view.height, self.view.width, 50);
        }];
    }
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag)
    {
        case 0:
            [self reload];
            break;
        case 1:
            self.type = HKBranchTypeVehicle;
            [self loadData];
            break;
        case 2:
            self.type = HKBranchTypeCharger;
            [self loadData];
            break;
        case 3:
            if (!self.currentAnnotationView) return;
            self.currentAnnotationView.branchStatus.avaliableCount = @"9";
            break;
    }
}

#pragma mark - HKMapNaviWalkManagerDelegate
- (void)walkManagerOnCalculateRouteSuccess:(HKNaviWalkManager *)walkManager {
    [SVProgressHUD dismiss];
    if (walkManager.naviRoute.routePolylines.count == 0) return;
    
    self.walkManager = walkManager;
    [self.mapView addOverlays:self.walkManager.naviRoute.routePolylines];
    
    self.currentAnnotationView.branchStatus.route = self.walkManager.naviRoute;
    [self.currentAnnotationView showAnnotationPopView];
}

#pragma makr - HKMapViewDelegate
- (void)mapViewOfAnnotationViewSelected:(HKAnnotationView *)annotationView {
    self.currentAnnotationView = (HKMainAnnotationView *)annotationView;
    
    [self.mapView adjustMapViewCenterWithAnnotationViewCoordinate:self.currentAnnotationView.branchStatus.coordinate animated:YES];

    [self.walkManager calculateWalkRouteWithStartPoint:self.currentAnnotationView.branchStatus.coordinate endPoint:self.currentAnnotationView.branchStatus.userLocation.coordinate];
    
    [SVProgressHUD showWithStatus:@"正在进行路径规划"];
}

- (void)mapViewOfAnnotationViewCanceled:(HKAnnotationView *)annotationView {
    [SVProgressHUD dismiss];
    
    [self.currentAnnotationView hideAnnotationPopView];
    self.currentAnnotationView = nil;
    
    [self.mapView removeOverlays:self.walkManager.naviRoute.routePolylines];
}

- (void)locationSuccess {
    [self loadData];
}

#pragma mark - 加载数据
- (void)reload {
    [self removeAnnotations];
    [self addAnnotations];
}

#pragma mark - 网络(假数据代替)
- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"txt"];
    NSArray *list = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path]
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    NSMutableArray *arrayM = @[].mutableCopy;
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HKBranchStatusModel *model = [HKBranchStatusModel yy_modelWithDictionary:obj];
        [arrayM addObject:model];
    }];
    [self transformResponse:arrayM];
}

- (void)transformResponse:(NSArray *)list {
    [self removeAnnotations];
    [self clearData];
    
    NSMutableArray *distanceArrM = @[].mutableCopy;
    [list enumerateObjectsUsingBlock:^(HKBranchStatusModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    
        HKMainAnnotation *annotation = [self createAnnotation:obj];
        [self.annotationArrM addObject:annotation];
        [distanceArrM addObject:[NSNumber numberWithFloat:annotation.branchStatus.distance]];
    }];
    
    NSNumber *minPoint = [distanceArrM valueForKeyPath:@"@min.floatValue"];
    self.nearestAnnotation = [self.annotationArrM objectAtIndex:[distanceArrM indexOfObject:minPoint]];
    
    [self addAnnotations];
}

#pragma mark - 创建Annotation
- (HKMainAnnotation *)createAnnotation:(HKBranchStatusModel *)obj {
    id<MKAnnotation> annotation;
    if (self.currentSelectIndex == 0) {
        HKMainBranchStatusService *branchStatus = [[HKMainBranchStatusService alloc]initWithBranchStatusModel:obj type:self.type];
        annotation = [[HKMainAnnotation alloc]initWithBranchStatus:branchStatus];
        annotation.coordinate = CLLocationCoordinate2DMake([obj.latitude floatValue], [obj.longitude floatValue]);
    } else {
        HKOrderBranchStatusService *branchStatus = [[HKOrderBranchStatusService alloc]initWithBranchStatusModel:obj vehicleOrderstatus:self.vehicleStatus];
        annotation = [[HKOrderAnnotation alloc]initWithBranchStatus:branchStatus];
        annotation.coordinate = CLLocationCoordinate2DMake([obj.latitude floatValue], [obj.longitude floatValue]);
    }
    return annotation;
}

#pragma mark - 添加Annotations
- (void)addAnnotations {
    [self.mapView addAnnotations:self.annotationArrM];
    [self.mapView zoomScale:self.nearestAnnotation animated:YES];
}

#pragma mark - 移除Annotations
- (void)removeAnnotations {
    if (self.mapView.overlays.count > 0) [self.mapView removeOverlays:self.mapView.overlays];
    if (self.annotationArrM.count > 0) [self.mapView removeAnnotations:self.annotationArrM];
}

- (void)clearData {
    [self.annotationArrM removeAllObjects];
    self.currentAnnotationView = nil;
    self.walkManager.naviRoute.routePolylines = nil;
}

/*
- (void)addGradientOverlay {
    float *velocity = malloc(sizeof(float)*5);
    velocity[0] = 2.;
    velocity[1] = 3.;
    velocity[2] = 10.;
    velocity[3] = 20.;
    velocity[4] = 30.;
    
    CLLocationCoordinate2D *coords = (CLLocationCoordinate2D *)malloc(5 * sizeof(CLLocationCoordinate2D));
    coords[0] = CLLocationCoordinate2DMake(41.703636, 123.432902);
    coords[0] = CLLocationCoordinate2DMake(41.704128, 123.433290);
    coords[0] = CLLocationCoordinate2DMake(41.703667, 123.434502);
    coords[0] = CLLocationCoordinate2DMake(41.702192, 123.437855);
    coords[0] = CLLocationCoordinate2DMake(41.701895, 123.437635);
    
    GradientPolylineOverlay *overlay = [[GradientPolylineOverlay alloc]initWithPoints:coords velocity:velocity count:5];
    [self.mapView addOverlay:overlay];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
