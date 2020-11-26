//
//  ViewController.m
//  FlutterBoostDemo
//
//  Created by ddhMacMini on 2020/8/3.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "ViewController.h"
#import "DemoVCViewController.h"
#import "UIViewControllerDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"push native" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)pushNext {
    NSLog(@"xxxxx");
//    DemoVCViewController *vc = [[DemoVCViewController alloc] init];
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
