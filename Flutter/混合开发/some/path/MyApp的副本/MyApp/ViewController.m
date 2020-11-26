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
@import Flutter;
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (assign, nonatomic) NSInteger count;


@end

@implementation ViewController{
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.count = 0;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(test)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.blueColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}


- (void)test1 {
    
    
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
    FlutterMethodChannel* methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"com.flutterbus/demo"
                                           binaryMessenger:(NSObject<FlutterBinaryMessenger> *)flutterViewController];
    LCProxy *lcProxy = [LCProxy shareProxy];
    //oc给flutter传参法一： 通过channel，oc传参给flutter通道
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.wx.eventChannel/demo" binaryMessenger:(NSObject<FlutterBinaryMessenger> *)flutterViewController];
    [eventChannel setStreamHandler:(NSObject<FlutterStreamHandler> *)lcProxy];
    
    __weak typeof(self) weakSelf = self;
    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSDictionary *dic = call.arguments;
        NSString *type = dic[@"type"];
        weakSelf.count = [dic[@"data"][@"count"] integerValue];
        if ([type isEqualToString:@"type0"]) {
            NSLog(@"%@",call.method);
            [flutterViewController dismissViewControllerAnimated:YES completion:nil];
            result(@YES);
        } else if([type isEqualToString:@"type3"]) {
            //传参法二：result为flutter回调，可在此block内给flutter传递参数
            result(@"我来自oc");
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
    return @"我来自OC client!!!";
}


@end
