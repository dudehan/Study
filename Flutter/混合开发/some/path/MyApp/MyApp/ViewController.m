//
//  ViewController.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/7.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "LCProxy.h"
#import "FlutterManager.h"

#import "MethodChannelVC.h"
#import "BasicMsgChannalVC.h"
#import "EventChannelVC.h"


@import Flutter;
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (assign, nonatomic) NSInteger count;

@property (strong, nonatomic) FlutterMethodChannel* methodChannel;


@end

@implementation ViewController{
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.count = 0;
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
               action:@selector(pushToMethodChannelVC)
     forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"MethodChannelVC" forState:UIControlStateNormal];
    button1.backgroundColor = UIColor.blueColor;
    button1.frame = CGRectMake(80.0, 150.0, 250.0, 40.0);
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
               action:@selector(pushToBasicMsgChannalVC)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"BasicMsgChannalVC" forState:UIControlStateNormal];
    button2.backgroundColor = UIColor.blueColor;
    button2.frame = CGRectMake(80.0, 200.0, 250.0, 40.0);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self
               action:@selector(pushToEventChannelVC)
     forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"EventChannelVC" forState:UIControlStateNormal];
    button3.backgroundColor = UIColor.blueColor;
    button3.frame = CGRectMake(80.0, 250.0, 250.0, 40.0);
    [self.view addSubview:button3];
    
}

- (void)pushToMethodChannelVC {
    [self presentViewController:[[MethodChannelVC alloc] init] animated:YES completion:nil];
}
- (void)pushToBasicMsgChannalVC {
    [self presentViewController:[[BasicMsgChannalVC alloc] init] animated:YES completion:nil];
}
- (void)pushToEventChannelVC {
    [self presentViewController:[[EventChannelVC alloc] init] animated:YES completion:nil];
}

- (void)test {
    __weak typeof(self) weakSelf = self;
    FlutterViewController *vc = [[FlutterManager shareManager] viewControllerWith:@"route1" callBack:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSDictionary *dic = call.arguments;
        NSString *type = dic[@"type"];
        weakSelf.count = [dic[@"data"][@"count"] integerValue];
        if([type isEqualToString:@"type3"]) {
            //传参法二：result为flutter回调，可在此block内给flutter传递参数
            result(@"我来自oc");
        }
    }];
    
    LCProxy *lcProxy = [LCProxy shareProxy];
    lcProxy.target = self;
    //oc给flutter传参法一： 通过channel，oc传参给flutter通道
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.wx.eventChannel/demo" binaryMessenger:(NSObject<FlutterBinaryMessenger> *)vc];
    [eventChannel setStreamHandler:(NSObject<FlutterStreamHandler> *)lcProxy];

    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showFlutter {
    FlutterViewController *flutterViewController =
    [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [flutterViewController setInitialRoute:@"route1"];
    //flutter传参给oc通道
    _methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"com.flutterbus/demo"
                      binaryMessenger:flutterViewController.binaryMessenger];
    LCProxy *lcProxy = [LCProxy shareProxy];
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.wx.eventChannel/demo" binaryMessenger:flutterViewController.binaryMessenger];
    [eventChannel setStreamHandler:(NSObject<FlutterStreamHandler> *)lcProxy];
    
    __weak typeof(self) weakSelf = self;
    [_methodChannel invokeMethod:@"mytest" arguments:nil];
    [_methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        
        
        NSDictionary *dic = call.arguments;
        NSString *type = dic[@"type"];
        weakSelf.count = [dic[@"data"][@"count"] integerValue];
        if ([type isEqualToString:@"type0"]) {
            NSLog(@"%@",call.method);
            [flutterViewController dismissViewControllerAnimated:YES completion:nil];
            result(@YES);
        } else if([type isEqualToString:@"type3"]) {
            [weakSelf.methodChannel invokeMethod:@"mytest" arguments:nil];
            //可在此block内给flutter传递参数
            result([weakSelf getFromOCClientMessage]);
        }
    }];
    
    
    [self presentViewController:flutterViewController animated:YES completion:nil];
};

- (void)repeatAddNativeCount{
    self.count += 1;
    //通过桥梁传值
    if ([LCProxy shareProxy].eventSink) {
        //调用block，传参给flutter
        [LCProxy shareProxy].eventSink(@(_count));
        
    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self repeatAddNativeCount];
//    });
}

- (void)setCount:(NSInteger)count {
    @synchronized (self) {
        _count = count;
        _textLabel.text = [NSString stringWithFormat:@"%ld",(long)_count];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self repeatAddNativeCount];
    
}

- (NSString *)getFromOCClientMessage {
    
    
    // result:一个回调，如果Dart侧失败，则回调参数为FlutterError类型；
    // 如果Dart侧没有实现此方法，则回调参数为FlutterMethodNotImplemented类型；
    // 如果回调参数为nil获取其它类型，表示Dart执行成功
    
    
    return @"我来自OC client!!!";
}


@end
