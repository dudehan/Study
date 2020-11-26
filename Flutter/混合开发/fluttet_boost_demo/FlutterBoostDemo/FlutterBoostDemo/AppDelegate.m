//
//  AppDelegate.m
//  FlutterBoostDemo
//
//  Created by ddhMacMini on 2020/8/3.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import <FlutterBoost.h>
#import "PlatformRouterImp.h"
#import "ViewController.h"
#import "UIViewControllerDemo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.router = [[PlatformRouterImp alloc] init];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:self.router
                                                        onStart:^(FlutterEngine *engine) {
                                                            
                                                        }];
     
     
     return YES;
}



@end
