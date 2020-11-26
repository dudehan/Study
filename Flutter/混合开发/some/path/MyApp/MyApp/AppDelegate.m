//
//  AppDelegate.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/7.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface AppDelegate ()
//@property (strong, nonatomic) FlutterPluginAppLifeCycleDelegate *lifeCycleDelegate;
@end

@implementation AppDelegate

//- (instancetype)init {
//    if (self = [super init]) {
//        _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
//    }
//    return self;
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    [self.flutterEngine runWithEntrypoint:@"other" libraryURI:@"other.dart"];
//    [self.flutterEngine runWithEntrypoint:@"other"];
//    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    
    
//    ====
//    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
//
//      FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
//                                              methodChannelWithName:@"samples.flutter.dev/battery"
//                                              binaryMessenger:controller];
//
//      [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
//        // Note: this method is invoked on the UI thread.
//        // TODO
//      }];

//      [GeneratedPluginRegistrant registerWithRegistry:self];
    
//    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
