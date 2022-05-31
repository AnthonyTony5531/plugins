//
//  XCSdkApiPlugin.h
//  iOSSDKSample
//
//  Created by eric on 2019/12/14.
//  Copyright © 2019 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN
@interface XCSdkApiPlugin : NSObject<FlutterPlugin>

/// iOS调用flutter
/// @param name flutter 方法名
/// @param params 传给flutter的参数
- (void)invokeFlutterMethod:(NSString *_Nonnull)name
                     params:(id _Nullable)params;

- (void)destroy;

/// 是TAB版注单列表
@property (nonatomic, readonly) BOOL isBetList;
@end

NS_ASSUME_NONNULL_END
