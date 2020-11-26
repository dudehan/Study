//
//  MethodChannelVC.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "MethodChannelVC.h"
#import "FlutterManager.h"

@interface MethodChannelVC ()
@property (strong, nonatomic) FlutterMethodChannel* methodChannel;
@property (strong, nonatomic) FlutterViewController *flutterViewController;
@end

@implementation MethodChannelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
               action:@selector(showFlutter)
     forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"MethodChannelVC" forState:UIControlStateNormal];
    button1.backgroundColor = UIColor.blueColor;
    button1.frame = CGRectMake(80.0, 150.0, 250.0, 40.0);
    [self.view addSubview:button1];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back addTarget:self
               action:@selector(back)
     forControlEvents:UIControlEventTouchUpInside];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.backgroundColor = UIColor.redColor;
    back.frame = CGRectMake(15.0, 30.0, 45.0, 45.0);
    [self.view addSubview:back];
    
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showFlutter {
    _flutterViewController =
    [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [_flutterViewController setInitialRoute:@"route1"];
    
    _methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"com.flutterbus/demo"
                      binaryMessenger:_flutterViewController.binaryMessenger];
    
    __weak typeof(self) weakSelf = self;
    [_methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        
        NSDictionary *dic = call.arguments;
        NSString *type = dic[@"type"];
        [weakSelf.methodChannel invokeMethod:@"methodHandle" arguments:nil];
        NSLog(@"%@",call.arguments);
        if ([call.method isEqualToString:@"exitFlutter"]) {
            SEL select = NSSelectorFromString(call.method);
            [weakSelf performSelector:select withObject:nil];
        }

//        [weakSelf.methodChannel invokeMethod:@"mytest" arguments:nil];
        result(@"xx");
    }];
    [self presentViewController:_flutterViewController animated:YES completion:nil];
};

- (void)exitFlutter {
    
    [_flutterViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSString *)getFromOCClientMessage {
    
    
    // result:一个回调，如果Dart侧失败，则回调参数为FlutterError类型；
    // 如果Dart侧没有实现此方法，则回调参数为FlutterMethodNotImplemented类型；
    // 如果回调参数为nil获取其它类型，表示Dart执行成功
    
    
    return @"我来自OC client!!!";
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
