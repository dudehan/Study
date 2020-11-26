//
//  LCProxy.h
//  MyApp
//
//  Created by ddhMacMini on 2020/5/8.
//  Copyright © 2020 ddhMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface LCProxy : NSProxy
+ (instancetype)shareProxy;
@property (copy, nonatomic) FlutterEventSink eventSink;

@property (weak, nonatomic) id target;

@end

NS_ASSUME_NONNULL_END
