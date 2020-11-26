//
//  SceneDelegate.m
//  FlutterBoostDemo
//
//  Created by ddhMacMini on 2020/8/3.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import <FlutterBoost.h>
#import "ViewController.h"
#import "UIViewControllerDemo.h"


@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
//    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
//     [self.window makeKeyAndVisible];
     
    
    PlatformRouterImp *router = ((AppDelegate *)[UIApplication sharedApplication].delegate).router;
    
    
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
     vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
    
     
     FLBFlutterViewContainer *fvc = [[FLBFlutterViewContainer alloc] init];
     [fvc setName:@"first" params:@{}];
     fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
     
     
     UITabBarController *tabVC = [[UITabBarController alloc] init];
     UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
     router.navigationController = rvc;
     
     tabVC.viewControllers = @[vc,fvc];
     self.window.rootViewController = rvc;
     
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
