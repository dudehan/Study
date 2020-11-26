//
//  BasicMsgChannalVC.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "BasicMsgChannalVC.h"
#import "FlutterManager.h"

@interface BasicMsgChannalVC ()
@property (strong, nonatomic) FlutterViewController *flutterViewController;
@end

@implementation BasicMsgChannalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
                action:@selector(showFlutter)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"BasicMsgChannalVC" forState:UIControlStateNormal];
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
//    ssh-keygen -t rsa -C "929364989@qq.com"
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)showFlutter {
    _flutterViewController =
    [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [_flutterViewController setInitialRoute:@"route2"];
    //_flutterViewController.binaryMessenger 最终为:FlutterEngine.binaryMessenger
    FlutterBasicMessageChannel *basicMsgChannel = [FlutterBasicMessageChannel messageChannelWithName:@"com.flutterbus/demo" binaryMessenger:_flutterViewController.binaryMessenger];
    
//    [basicMsgChannel sendMessage:@"test"];
    __weak typeof(self) weakSelf =self;
    //调用到FlutterEngine中的FlutterBinaryMessenger代理方法
    [basicMsgChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
        NSLog(@"%@",message);
        
        NSString *method = message[@"method"];
        if ([method isEqualToString:@"exitFlutter"]) {
            SEL select = NSSelectorFromString(method);
            [weakSelf performSelector:select withObject:nil];
        }
        
        callback(@{@"method": @"test3", @"ontent": @"flutter 中的数据", @"code": @102});
    }];
    [self presentViewController:_flutterViewController animated:YES completion:nil];
};

- (void)exitFlutter {
    
    [_flutterViewController dismissViewControllerAnimated:YES completion:nil];
    
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
