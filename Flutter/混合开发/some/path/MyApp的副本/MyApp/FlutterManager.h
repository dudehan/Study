//
//  FlutterRouteManager.h
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Flutter;

NS_ASSUME_NONNULL_BEGIN

@interface FlutterManager : NSProxy
+ (instancetype)shareManager;
- (FlutterViewController *)viewControllerWith:(NSString *)route callBack:(FlutterMethodCallHandler _Nullable)callBack;

@end

NS_ASSUME_NONNULL_END
