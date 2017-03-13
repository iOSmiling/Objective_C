//
//  LocationVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/3/10.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "LocationVC.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationVC ()<CLLocationManagerDelegate>
{
    CLGeocoder *_geocoder;//地理编码
}

@property (nonatomic,strong) CLLocationManager *locationManager;//定位管理器

@end

@implementation LocationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"定位";
    
    //定位
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways))
    {
        //定位功能可用
        self.locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置定位精度
        _locationManager.distanceFilter = 10;
        [_locationManager requestAlwaysAuthorization];//ios8添加这句
        [_locationManager startUpdatingLocation];
        
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied)
    {
        //定位不能用
        NSLog(@"定位不能用");
        
    }
    
    //地理编码
    
    _geocoder = [[CLGeocoder alloc] init];
    
    [self getCoordinateByAddress:@"上海"];
//    [self getAddressByLatitude:39.54 longitude:116.28];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currLocation = [locations lastObject];
    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
    
    [self getAddressByLatitude:currLocation.coordinate.latitude longitude:currLocation.coordinate.longitude];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorDenied)
    {
        //访问被拒绝
    }
    
    if ([error code] == kCLErrorLocationUnknown)
    {
        //无法获取位置信息
    }
}

#pragma mark 根据地名确定地理坐标
-(void)getCoordinateByAddress:(NSString *)address
{
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error)
    {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
        CLPlacemark *placemark=[placemarks firstObject];
        
        CLLocation *location=placemark.location;//位置
        CLRegion *region=placemark.region;//区域
        NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
        //        NSString *name=placemark.name;//地名
        //        NSString *thoroughfare=placemark.thoroughfare;//街道
        //        NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
        //        NSString *locality=placemark.locality; // 城市
        //        NSString *subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
        //        NSString *administrativeArea=placemark.administrativeArea; // 州
        //        NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
        //        NSString *postalCode=placemark.postalCode; //邮编
        //        NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
        //        NSString *country=placemark.country; //国家
        //        NSString *inlandWater=placemark.inlandWater; //水源、湖泊
        //        NSString *ocean=placemark.ocean; // 海洋
        //        NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
        NSLog(@"位置:%@,区域:%@,详细信息:%@",location,region,addressDic);
    }];
}

#pragma mark 根据坐标取得地名
-(void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
    //反地理编码
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark=[placemarks firstObject];
        NSLog(@"详细信息:%@",placemark.addressDictionary);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
