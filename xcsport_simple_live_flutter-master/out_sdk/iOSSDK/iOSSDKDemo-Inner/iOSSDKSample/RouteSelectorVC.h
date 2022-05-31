//
//  RouteSelectorVC.h
//  iOSSDKSample
//
//  Created by eric on 2021/10/8.
//  Copyright © 2021 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouteSelectorVC : UIViewController
@property (nonatomic) BOOL isGbet; // YES 只展示188，隐藏AI和虚拟体育的入口

@property (nonatomic, strong, nullable) NSMutableDictionary *config;

@property (nonatomic, copy) void(^onRouteSelector)(NSInteger type);
@end

NS_ASSUME_NONNULL_END
