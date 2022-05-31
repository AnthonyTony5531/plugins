//
//  XCRootVC+Utils.h
//  iOSSDKSample
//
//  Created by eric on 2021/10/10.
//  Copyright © 2021 eric. All rights reserved.
//

#import "XCRootVC.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <UMCommon/UMConfigure.h>
#import <XCSDK/XCSDK.h>

#import "XCTabBarController.h"
#import "XCNavigationVC.h"
#import "XCRootNavigationVC.h"
#import "RouteSelectorVC.h"
#import "XCSelectView.h"
#import "XCSampleVC.h"
#import "XCWebViewVC.h"
#import "AppDelegate.h"

#import "XCLoginView.h"
#import "AFNetworking.h"
#import "XCMacro.h"

NS_ASSUME_NONNULL_BEGIN

#define kMainUrlKey @"mainUrlKey"
#define kImUrlKey   @"imUrlKey"
#define kImgUrlKey  @"imgUrlKey"
#define kTokenKey   @"tokenKey"

@interface XCRootVC (Utils)
#pragma mark - action
- (void)showAnchor;

- (void)showFastEnter;

- (void)querySDKConfig;

- (void)showWebSDK:(NSString *_Nullable)url;

#pragma mark - initUI
- (void)initDemoUI;

- (void)initUI;

// 新建登录窗口
- (void)configlLogin;

#pragma mark - route selector
/// 线路选择
/// @param appType 线路类型 0-ai体育；1-Gbet-app；2-Gbet-h5；3-虚拟体育
/// @param sdkType SDK类型 0-tab 1-icon
- (void)selectorWithAppType:(NSInteger)appType sdkType:(NSInteger)sdkType;


/// sdk title
- (NSString *)getSDKTitle;

/// sdkAppType
- (NSString *)getAppType;

#pragma mark - utils
- (void)showSampleVC:(NSString *_Nullable)showName;

- (void)showHUD:(NSString *_Nullable)text;

- (void)hideHUD:(NSString *_Nullable)text;

- (void)showHUD:(NSString *_Nullable)text afterDelay:(NSTimeInterval)delay;

- (void)showHUDAndRelogin;

- (NSMutableDictionary *)addDefaultLaunchTitles:(NSDictionary *)config;

- (void)saveLoginAccount:(NSString *)account withPassword:(NSString *)password;

- (void)saveUserInfo;

- (void)readUserInfo;

- (void)showModule;

- (void)hiddenModule;

- (void)onFloatButton:(UIButton *_Nullable)sender;

#pragma mark - 匿名登录功能-临时登录界面
- (void)showAnonymousLogninVC:(NSDictionary<NSString *,id> * _Nullable)params;

#pragma mark - hide keyboard
- (void)hideKeyboard;

#pragma mark - textField
- (BOOL)shouldBeginEditing:(UITextField *)textField;

#pragma mark - appType utils

/// 是AI体育
- (BOOL)isAi;

/// 是Gbet/188体育
- (BOOL)isGbet;

/// 是虚拟体育
- (BOOL)isVs;
@end

NS_ASSUME_NONNULL_END
