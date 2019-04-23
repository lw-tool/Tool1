//
//  LocationViewController.m
//  小工具
//
//  Created by 吴敏轩 on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "LocationViewController.h"
#import "Masonry/Masonry.h"

@interface LocationViewController ()

@property(nonatomic, strong)BMKLocationManager *locationManager;
@property(nonatomic, copy) BMKLocatingCompletionBlock completionBlock;
@property(nonatomic, assign) BOOL isNeedAddr;
@property(nonatomic, assign) BOOL isNeedHotSpot;
@property (nonatomic, strong) UILabel* cooLab;//经度
@property (nonatomic, strong) UILabel* latLab;//纬度
@property (nonatomic, strong) UILabel* provinceLab;//省
@property (nonatomic, strong) UILabel* districtLab;//区镇
@property (nonatomic, strong) UILabel* streetLab;//街道
@property (nonatomic, strong) UILabel* streetNumberLab;//街道号
@property (nonatomic, strong) UILabel* locationDescribeLab;//具体描述
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的位置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
    [self startBaiduMapService];
    
}
-(void)creatUI{
    
    [self.view addSubview:self.cooLab];
    [self.view addSubview:self.latLab];
    [self.view addSubview:self.provinceLab];
    [self.view addSubview:self.districtLab];
    [self.view addSubview:self.streetLab];
    [self.view addSubview:self.streetNumberLab];
    [self.view addSubview:self.locationDescribeLab];
    
    [_cooLab sizeToFit];
    [_cooLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    [_latLab sizeToFit];
    [_latLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.cooLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [_provinceLab sizeToFit];
    [_provinceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.latLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [_districtLab sizeToFit];
    [_districtLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.provinceLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [_streetLab sizeToFit];
    [_streetLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.districtLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [_streetNumberLab sizeToFit];
    [_streetNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.streetLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [_locationDescribeLab sizeToFit];
    [_locationDescribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.streetNumberLab.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    
}
-(UILabel *)cooLab{
    
    if (!_cooLab) {
        _cooLab = [[UILabel alloc]init];
        _cooLab.textColor = [UIColor blackColor];
    }
    return _cooLab;
}
-(UILabel *)latLab{
    
    if (!_latLab) {
        _latLab = [[UILabel alloc]init];
        _latLab.textColor = [UIColor blackColor];
    }
    return _latLab;
}
-(UILabel *)provinceLab{
    
    if (!_provinceLab) {
        _provinceLab = [[UILabel alloc]init];
        _provinceLab.textColor = [UIColor blackColor];
    }
    return _provinceLab;
}
-(UILabel *)districtLab{
    
    if (!_districtLab) {
        _districtLab = [[UILabel alloc]init];
        _districtLab.textColor = [UIColor blackColor];
    }
    return _districtLab;
}
-(UILabel *)streetLab{
    
    if (!_streetLab) {
        _streetLab = [[UILabel alloc]init];
        _streetLab.textColor = [UIColor blackColor];
    }
    return _streetLab;
}
-(UILabel *)streetNumberLab{
    
    if (!_streetNumberLab) {
        _streetNumberLab = [[UILabel alloc]init];
        _streetNumberLab.textColor = [UIColor blackColor];
    }
    return _streetNumberLab;
}
-(UILabel *)locationDescribeLab{
    
    if (!_locationDescribeLab) {
        _locationDescribeLab = [[UILabel alloc]init];
        _locationDescribeLab.textColor = [UIColor blackColor];
    }
    return _locationDescribeLab;
}
- (void)startBaiduMapService {

    _isNeedAddr = YES;
    _isNeedHotSpot = YES;
    [self initBlock];
    [self initLocation];
    
    
    [_locationManager requestLocationWithReGeocode:_isNeedAddr withNetworkState:_isNeedHotSpot completionBlock:self.completionBlock];
}

-(void)initBlock
{
    //    __weak JBSWKWebViewController *weakSelf = self;
    self.completionBlock = ^(BMKLocation *location, BMKLocationNetworkState state, NSError *error)
    {
        if (error)
        {
            
            if((long)error.code==1){
               
            }
            
        }
        
        if (location.location) {//得到定位信息，添加annotation
            __weak typeof(self) weakSelf = self;
            
            NSString *lat = [NSString stringWithFormat:@"%.6f",location.location.coordinate.latitude];
            NSString *lon =[NSString stringWithFormat:@"%.6f",location.location.coordinate.longitude];
            self.cooLab.text = [NSString stringWithFormat:@"经度：%f",lat];
            self.latLab.text = [NSString stringWithFormat:@"纬度：%f",lon];
          
           
            
        }
        
        if (location.rgcData) {
//                        NSLog(@"rgc = %@",[location.rgcData description]);
            self.provinceLab.text = [NSString stringWithFormat:@"省份：%@",location.rgcData.province];
             self.districtLab.text = [NSString stringWithFormat:@"区镇：%@",location.rgcData.district];
             self.streetLab.text = [NSString stringWithFormat:@"街道：%@",location.rgcData.street];
             self.streetNumberLab.text = [NSString stringWithFormat:@"街道号：%@",location.rgcData.streetNumber];
             self.locationDescribeLab.text = [NSString stringWithFormat:@"具体描述：%@",location.rgcData.locationDescribe];
        }
        
//                NSLog(@"netstate = %d",state);
    };
    
    
}

//baiduMap
-(void)initLocation
{
    _locationManager = [[BMKLocationManager alloc] init];
    
    _locationManager.delegate = self;
    
    _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.activityType = CLActivityTypeFitness;
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    _locationManager.allowsBackgroundLocationUpdates = NO;
    _locationManager.locationTimeout = 8;
    _locationManager.reGeocodeTimeout = 8;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
