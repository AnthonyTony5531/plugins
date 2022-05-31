//
//  XCLoginVC.h
//  iOSSDKSample
//
//  Created by eric on 2021/11/29.
//  Copyright © 2021 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kXCLoginVCSBId @"XCLoginVC"

NS_ASSUME_NONNULL_BEGIN

/// 匿名登录功能-临时账密登录界面
@interface XCLoginVC : UIViewController
@property (nonatomic, copy, nullable) NSString *mainUrl;
@property (nonatomic, copy) void(^loginResult)(NSString *token);
@end

NS_ASSUME_NONNULL_END
