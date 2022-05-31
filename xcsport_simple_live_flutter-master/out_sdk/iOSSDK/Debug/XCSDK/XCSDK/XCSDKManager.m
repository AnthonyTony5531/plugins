//
//  XCSDKManager.m
//  iOSSDKSample
//
//  Created by eric on 2019/12/14.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCSDKManager.h"
#import "XCSDKModule.h"
#import <UIKit/UIKit.h>
#import "XCSDKUtils.h"

#define kXCSDKVersion @"3.18.0"

#pragma mark - SDK配置相关key
/* ------ 必传配置项相关key ------ */
NSString * const XCSDKMainUrlKey = @"webHomePagePath";
NSString * const XCSDKImgUrlKey = @"merchantAppImgPath";
NSString * const XCSDKImUrlKey = @"merchantAppPushPath";
NSString * const XCSDKTokenKey = @"token";
NSString * const XCSDKTypeKey = @"sdkType";
NSString * const XCSDKAppTypeKey = @"appType";
NSString * const XCSDKListStyleKey = @"listStyle";

/* ------ 跳主播直播页面必传配置项相关key ------ */
NSString * const XCSDKGidmKey = @"gidm";
NSString * const XCSDKAnchorIdKey = @"anchorId";
NSString * const XCSDKSportPlatformKey = @"sportPlatform";


/* ------ 非必传配置项相关key ------ */
NSString * const XCSDKLaunchTitleKey = @"launchTitle";
NSString * const XCSDKLaunchSubTitlesKey = @"launchSubTitles";

NSString * const XCSDKVideoUrlKey = @"videoUrl";
NSString * const XCSDKPageIdKey = @"page";
NSString * const XCSDKHandledSysRepairKey = @"handledSysRepair";
NSString * const XCSDKHandledTimeoutKey = @"handledTimeout";

NSString * const XCSDKMerchantIdKey = @"merchantId";
NSString * const XCSDKShowRechargeKey = @"showRecharge";
NSString * const XCSDKShowCashKey = @"showCash";
NSString * const XCSDKShowTransferKey = @"showTransfer";

NSString * const XCSDKShowTabbarOnLoadingKey = @"showTabbarOnLoading";
NSString * const XCSDKMainPageIndexKey = @"mainPageIndex";

NSString * const XCSDKHidesBottomBarWhenPushedKey = @"hidesBottomBarWhenPushed";

NSString * const XCSDKUmAppKey = @"umAppKey";
NSString * const XCSDKUmChannel = @"umChannel";
NSString * const XCSDKUseInnerUmAppKey = @"useInnerUmAppKey";

#pragma mark - SDK与App交互方法key
/* ------ flutter调App方法key ------ */
NSString * const XCAppMethodDownloadProgress = @"downloadProgress";
NSString * const XCAppMethodLoadAssetsError = @"load_assets_error";
NSString * const XCAppMethodRetryAlert = @"retry_load_assets_alert";

NSString * const XCAppMethodBalanceChanged = @"onBalanceChanged";
NSString * const XCAppMethodCashOut = @"cash_out";
NSString * const XCAppMethodRecharge = @"recharge";
NSString * const XCAppMethodTransfer = @"transfer";

NSString * const XCAppMethodExitSDK = @"exit_sdk";
NSString * const XCAppMethodShowBottomBar = @"showBottomBar";
NSString * const XCAppMethodHideBottomBar = @"hideBottomBar";

NSString * const XCAppMethodTokenTimeout = @"tokenTimeout";
NSString * const XCAppMethodSystemRepair = @"operation_maintenance_503";

NSString * const XCAppMethodViewWillAppear = @"viewWillAppear";
NSString * const XCAppMethodViewDidAppear = @"viewDidAppear";
NSString * const XCAppMethodViewWillDisappear = @"viewWillDisappear";
NSString * const XCAppMethodViewDidDisappear = @"viewDidDisappear";

NSString * const XCAppMethodCanAutorotate = @"canAutorotate";

NSString * const XCAppMethodSDKVersion = @"sdk_version";

NSString * const XCAppMethodEdgePopGesture = @"edgePopGesture";
NSString * const XCSDKEdgePopGestureNotification = @"edgePopGestureNotification";

NSString * const XCAppMethodDidEnterSDK = @"didEnterSDK";

NSString * const XCAppMethodNeedLogin = @"needLogin";

NSString * const XCAPPMethodLangChanged = @"langChanged";

/* ------ App调用flutter方法key ------ */
NSString * const XCSDKMethodUpdateSDKToken = @"updateSDKToken";
NSString * const XCAppMethodBottomBarIndex = @"bottomBarIndex"; ///< 选择底部栏索引
NSString * const XCAppMethodPauseVideo = @"pauseVideo"; ///< 暂停视频
NSString * const XCAppMethodStartVideo = @"startVideo"; ///< 播放视频
NSString * const XCAPPMethodOnLangChanged = @"onLangChanged"; // 语言切换

@implementation XCSDKManager
#pragma mark - ICON版SDK
+ (void)openSDKWithConfig:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
                   naviVC:(UINavigationController *_Nonnull)naviVC
                    error:(NSError *__autoreleasing  _Nullable *)error
                  handler:(XCSDKHandler)handler {
    [self openIconSdk:sdkConfig naviVC:naviVC configError:error handler:handler];
}

+ (void)openIconSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
             naviVC:(UINavigationController *_Nonnull)naviVC
        configError:(NSError *__autoreleasing *)configError
            handler:(XCSDKHandler)handler {
    [ShareSDKModule openIconSdk:sdkConfig naviVC:naviVC configError:configError handler:handler];
}

#pragma mark - TAB版SDK
+ (BOOL)configSDK:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
         tabbarVC:(UITabBarController *_Nonnull)tabbarVC
            error:(NSError *__autoreleasing *)error
          handler:(XCSDKHandler)handler {
    return [self configTabSdk:sdkConfig tabbarVC:tabbarVC configError:error handler:handler];
}

+ (BOOL)configTabSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
            tabbarVC:(UITabBarController *_Nonnull)tabbarVC
         configError:(NSError *__autoreleasing *)configError
             handler:(XCSDKHandler)handler {
    return [ShareSDKModule configTabSdk:sdkConfig tabbarVC:tabbarVC configError:configError handler:handler];
}

+ (UIViewController *_Nullable)mainPage {
    return [ShareSDKModule mainPage];
}

+ (UIViewController * _Nullable)betPage {
    return [ShareSDKModule betPage];
}

+ (NSArray<NSString *> *_Nullable)pageIds {
    return [ShareSDKModule.config allKeys];
}

+ (void)destroyByPageIds:(NSArray<NSString *> *_Nullable)pageIds {
    [ShareSDKModule destroyByPageIds:pageIds];
}

+ (void)updateToken:(NSString *_Nonnull)token {
    if (![token isKindOfClass:NSString.class] || token.length == 0) return;
    
    [ShareSDKModule.sdkApiPlugin invokeFlutterMethod:@"updateSDKToken" params:@{@"token": token?:@""}];
}

+ (void)selectBottomItemIndex:(NSInteger)selectIndex{
    NSString *index = [NSString stringWithFormat:@"%zd",selectIndex];
    [ShareSDKModule.sdkApiPlugin invokeFlutterMethod:XCAppMethodBottomBarIndex params:@{@"index" : index}];
}


#pragma mark - 展示详情页
+ (void)showDetailPage:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
                naviVC:(UINavigationController *_Nonnull)naviVC
           configError:(NSError *__autoreleasing *)configError
               handler:(XCSDKHandler)handler {
    if(!sdkConfig[XCSDKGidmKey]) {
        *configError = XCError(XCErrorCode_configError, @"gidm can not be nil");
        return;
    }
    NSLog(@"即将进入详情页 sdkConfig=%@", sdkConfig);
    [self openIconSdk:sdkConfig naviVC:naviVC configError:configError handler:handler];
}

#pragma mark - 视频暂停/播放
/// 暂停视频
+ (void)pauseVideo {
    [ShareSDKModule.sdkApiPlugin invokeFlutterMethod:XCAppMethodPauseVideo params:@{}];
}

/// 播放视频
+ (void)startVideo {
    [ShareSDKModule.sdkApiPlugin invokeFlutterMethod:XCAppMethodStartVideo params:@{}];
}

#pragma  mark - 语言切换
+ (void)onLangChange:(NSString *_Nonnull)lang {
    NSLog(@"c=====%@",lang);
    [ShareSDKModule.betListPlugin invokeFlutterMethod:XCAPPMethodOnLangChanged params:@{@"lang":lang?:@""}];
}

#pragma mark - Common
+ (NSString *_Nonnull)sdkVersion {
    return kXCSDKVersion;
}
@end
