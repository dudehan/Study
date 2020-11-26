//
//  EventChannelVC.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "EventChannelVC.h"
#import "FlutterManager.h"

@interface EventChannelVC ()
@property (copy, nonatomic) FlutterEventSink eventSink;
@property (assign, nonatomic) NSInteger count;

@property (strong, nonatomic) UILabel *textLabel;
@end

@implementation EventChannelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
    self.view.backgroundColor = [UIColor greenColor];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 50.0, 250.0, 40.0)];
    _textLabel.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:_textLabel];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
                action:@selector(showFlutter)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"EventChannelVC" forState:UIControlStateNormal];
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
    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
        [flutterViewController setInitialRoute:@"route3"];
        
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.flutterbus/demo" binaryMessenger:flutterViewController.binaryMessenger ];
    //    [basicMsgChannel sendMessage:@"test"];
    [eventChannel setStreamHandler:(NSObject<FlutterStreamHandler> *)self];
    [self presentViewController:flutterViewController animated:YES completion:nil];
};

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    _eventSink = events;
    
    return nil;
}



- (void)repeatAddNativeCount{
    self.count += 1;
    //通过桥梁传值
    if (_eventSink) {
        //调用block，传参给flutter
       _eventSink(@(_count));
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
