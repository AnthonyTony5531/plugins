//
//  XCLoginView.h
//  iOSSDKSample
//
//  Created by xc07 on 2020/9/29.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCLoginView : UIControl

/// index：0-TABSDK,1-ICONSDK,2-webview快捷方式；account：登录账号；password：密码  appType；App类型，0-ai、1-Gbet
@property (nonatomic, copy) void(^entrySDKBlock)(NSUInteger index,NSString *account, NSString *password, NSInteger appType);

/// 试玩
@property (nonatomic, copy) void(^tryPlay)(void);

/// 自动填充试玩账密
- (void)autoFillAccountPwd;
@end

NS_ASSUME_NONNULL_END
