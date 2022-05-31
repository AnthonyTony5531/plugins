//
//  XCSdkApiPlugin.m
//  iOSSDKSample
//
//  Created by eric on 2019/12/14.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCSdkApiPlugin.h"
#import "XCSDKManager.h"
#import "XCSDKModule.h"
#import "XCFlutterVC.h"
#import "XCAlertView.h"
#import "XCSDKUtils.h"
#import <Flutter/Flutter.h>

static NSString *sPageId = nil;
@interface XCSdkApiPlugin ()<FlutterStreamHandler>
@property (nonatomic, copy, nullable) FlutterEventSink flutterEventSink;
@property (nonatomic, copy, nullable) FlutterEventSink betListEventSink;
@property (nonatomic, weak)  FlutterMethodChannel *methodChannel; ///< flutter invoke native
@property (nonatomic, weak)  FlutterEventChannel *eventChannel; ///< native invoke flutter
@end

@implementation XCSdkApiPlugin
- (BOOL)isBetList {
    return self.betListEventSink != nil;
}

#pragma mark - FlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    XCSdkApiPlugin *sdkApiPlugin = [[XCSdkApiPlugin alloc] init];
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"xc_sdk_api/method" binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:sdkApiPlugin channel:methodChannel];
    sdkApiPlugin.methodChannel = methodChannel;

    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"xc_sdk_api/event" binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:sdkApiPlugin];
    sdkApiPlugin.eventChannel = eventChannel;
    
    BOOL betList = [kBetListPageId isEqualToString:ShareSDKModule.sdkConfig[XCSDKPageIdKey]];
    if(betList) {
        ShareSDKModule.betListPlugin = sdkApiPlugin;
    }
    else {
        ShareSDKModule.sdkApiPlugin = sdkApiPlugin;
    }
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"%s try=%@", __PRETTY_FUNCTION__, call.method);
    if (!ShareSDKModule.handler) {
        return;
    }
    
    NSMutableDictionary *arguments = [([call.arguments isKindOfClass:NSDictionary.class] ? call.arguments : @{}) mutableCopy];
    if([XCAppMethodNeedLogin isEqualToString:call.method]) {
        [arguments setObject:ShareSDKModule.sdkConfig[kXCMainUrlKey] forKey:XCSDKMainUrlKey];
    }
    ShareSDKModule.handler(call.method, arguments);
    if ([XCAppMethodExitSDK isEqualToString:call.method]) {
        NSLog(@"00-native 退出SDK");

        if (!ShareSDKModule.flutterVC) {
            return;
        }
        
        NSLog(@"11-native 退出SDK");
        [ShareSDKModule clearSDK];
        NSLog(@"22-native 退出SDK");
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    else if ([XCAppMethodEdgePopGesture isEqualToString:call.method]) {
        NSLog(@"%@", call.arguments);
        [[NSNotificationCenter defaultCenter] postNotificationName:XCSDKEdgePopGestureNotification object:call.arguments];
    }
#pragma clang diagnostic pop
    else if ([@"sdk_version" isEqualToString:call.method]) {
        // 获取SDK版本
        if (result) {
            result([XCSDKManager sdkVersion]);
        }
    }
    else if ([XCAppMethodCashOut isEqualToString:call.method]) {
        // 提现
    }
    else if ([XCAppMethodRecharge isEqualToString:call.method]) {
        // 充值
    }
    else if ([XCAppMethodTransfer isEqualToString:call.method]) {
        // 转账
    }
    else if ([XCAppMethodShowBottomBar isEqualToString:call.method]){
        // 显示tabbar底部栏
        dispatch_async(dispatch_get_main_queue(), ^{
            ShareSDKModule.tabbarVC.tabBar.hidden = NO;
        });
    }
    else if ([XCAppMethodHideBottomBar isEqualToString:call.method]){
        // 隐藏tabbar底部栏
        dispatch_async(dispatch_get_main_queue(), ^{
           ShareSDKModule.tabbarVC.tabBar.hidden = YES;
        });
    }
    else if ([XCAppMethodDownloadProgress isEqualToString:call.method]){
        // SDK资源包下载进度
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"DownloadProgress params=%@", [XCSDKUtils jsonFromContain:call.arguments]);
            [ShareSDKModule.adView updateProgress:call.arguments];
#ifdef kShowTabBarTest
            BOOL canReset = [ShareSDKModule.adView1 updateProgress:call.arguments];
            if (canReset) ShareSDKModule.adView1 = nil;
#endif
        });
    }
    else if ([XCAppMethodLoadAssetsError isEqualToString:call.method]) {
        [XCAlertView showAlertOnView:kXCKeyWindow title:@"温馨提示" msg:call.arguments[@"desc"] handler:^(NSUInteger index) {
            if (index == 0) { // 通知flutter重试
                result(@{@"event" : XCAppMethodRetryAlert, @"params" : @{@"buttonIndex": @(index), @"msg":@"native nofity flutter retry load assets"}});
            }
            ShareSDKModule.handler(XCAppMethodRetryAlert, @{@"index": @(index)});
        }];
    }
    else if ([XCAPPMethodLangChanged isEqualToString:call.method]) { // 切换语言
        NSLog(@"langChanged call.method==%@ call.arguments==%@",call.method,[XCSDKUtils jsonFromContain:call.arguments]);
        [XCSDKManager onLangChange:call.arguments[@"lang"]];
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)destroy {
    [self.methodChannel setMethodCallHandler:nil];
    [self.eventChannel setStreamHandler:nil];
    self.flutterEventSink = nil;
    self.betListEventSink = nil;
}

#pragma mark - FlutterStreamHandler
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    if(self.isBetList) {
        self.betListEventSink = events;
    }
    else {
        self.flutterEventSink = events;
    }
    NSLog(@"onListenWithArguments arguments=%@, events=%@", arguments,events);
    return nil;
}

- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    if(self.isBetList) {
        self.betListEventSink = nil;
    }
    else {
        self.flutterEventSink = nil;
    }
    return nil;
}

#pragma mark - public

/// iOS调用flutter
/// @param name flutter 方法名
/// @param params 传给flutter的参数
- (void)invokeFlutterMethod:(NSString *_Nonnull)name
                     params:(id _Nullable)params {
    NSLog(@"invokeFlutterMethod name=%@, params=%@, self.flutterEventSink=%@", name, params, self.flutterEventSink);

    if ((self.flutterEventSink != nil || self.betListEventSink != nil) && name.length) {
        NSLog(@"invokeFlutterMethod 111");
        if(self.isBetList) {
            self.betListEventSink(@{@"event" : name, @"params" : params ?: [NSNull null]});
        }
        else {
            self.flutterEventSink(@{@"event" : name, @"params" : params ?: [NSNull null]});
        }
    }
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [self destroy];
}

@end
