//
//  FlutterRouteManager.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "FlutterManager.h"
//#import <Flutter/Flutter.h>

@interface FlutterManager()
@property (strong, nonatomic) FlutterViewController *flutterViewController;
@property (strong, nonatomic) FlutterMethodChannel* methodChannel;

@end

@implementation FlutterManager

+ (instancetype)shareManager {
    static FlutterManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [FlutterManager alloc];
    });
    return shareManager;
}


- (FlutterViewController *)viewControllerWith1:(NSString *)route callBack:(FlutterMethodCallHandler _Nullable)callBack {
    
    [self.flutterViewController setInitialRoute:route];
    __weak typeof(self) weakSelf = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        
        
        
//        NSDictionary *dic = call.arguments;
//        NSString *type = dic[@"type"];
//        if ([type isEqualToString:@"type0"]) {
//            [weakSelf.flutterViewController dismissViewControllerAnimated:YES completion:nil];
//        }
        callBack(call,result);
    }];
    return self.flutterViewController;
}


- (FlutterViewController *)viewControllerWith:(NSString *)route callBack:(FlutterMethodCallHandler _Nullable)callBack {
    
    [self.flutterViewController setInitialRoute:route];
    __weak typeof(self) weakSelf = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSDictionary *dic = call.arguments;
        NSString *type = dic[@"type"];
        if ([type isEqualToString:@"type0"]) {
            [weakSelf.flutterViewController dismissViewControllerAnimated:YES completion:nil];
        }
        callBack(call,result);
    }];
    return self.flutterViewController;
}

- (FlutterViewController *)flutterViewController {
    if (!_flutterViewController) {
        _flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    }
    return _flutterViewController;
}

- (FlutterMethodChannel *)methodChannel {
    if (!_methodChannel) {
        //flutter传参给oc通道
        _methodChannel = [FlutterMethodChannel
                          methodChannelWithName:@"com.flutterbus/demo"
                          binaryMessenger:(NSObject<FlutterBinaryMessenger> *)self.flutterViewController];
    }
    return _methodChannel;
}

@end
