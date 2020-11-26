//
//  LCProxy.m
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import "LCProxy.h"


@interface LCProxy()



@end

@implementation LCProxy


+ (instancetype)shareProxy {
    static LCProxy *lcProxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lcProxy = [LCProxy alloc];
    });
    return lcProxy;
}

#pragma mark FlutterStreamHandler 代理
/**********原生主动传值给flutter-Start**********/
//flutter开始进行监听，并在此方法传入 原生主动传值给flutter的桥梁 event
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    NSLog(@"flutter开始进行监听，并在此方法传入 原生主动传值给flutter的桥梁 event");
    _eventSink = events;
    
//    [self repeatAddNativeCount];
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments{
    _eventSink = nil;
    return nil;
}



- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
}


@end
