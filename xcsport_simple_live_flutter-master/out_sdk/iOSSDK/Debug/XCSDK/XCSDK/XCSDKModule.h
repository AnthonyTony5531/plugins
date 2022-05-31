//
//  XCSDKModule.h
//  iOSSDKSample
//
//  Created by eric on 2019/12/25.
//  Copyright © 2019 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import "XCSDKManager.h"
#import "XCSdkApiPlugin.h"
#import "XCAdverView.h"

#define ShareSDKModule  [XCSDKModule shareInstance]

#define kXCMainUrlKey @"mainUrl"
#define kXCImgUrlKey @"imgUrl"
#define kXCImUrlKey @"imUrl"

#define kMainPageId     @"mainPage"
#define kBetListPageId  @"memberBettingPage"

NS_ASSUME_NONNULL_BEGIN
@class XCFlutterVC;
@interface XCSDKModule : NSObject
@property (nonatomic, strong, nullable) NSMutableDictionary *sdkConfig;

@property (nonatomic, weak) XCFlutterVC *flutterVC;
@property (nonatomic, copy, nullable) XCSDKHandler handler;
@property (nonatomic, strong, nullable) XCSdkApiPlugin *sdkApiPlugin;
@property (nonatomic, strong, nullable) XCSdkApiPlugin *betListPlugin;
@property (nonatomic, weak, nullable) UINavigationController *rootNaviVC;
@property (nonatomic, weak, nullable) UITabBarController *tabbarVC;
@property (nonatomic, weak, nullable) XCAdverView *adView;
@property (nonatomic) NSUInteger mainPageIndex;
#ifdef kShowTabBarTest
@property (nonatomic, strong, nullable) XCAdverView *adView1;
@property (nonatomic, weak) XCFlutterVC *tabMainPage;
#endif

@property (nonatomic) BOOL showNaviBar;
@property (nonatomic) BOOL willExitSDK;
+ (instancetype)shareInstance;

#pragma mark - ICON版SDK

- (void)openSDKWithConfig:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
                   naviVC:(UINavigationController *_Nonnull)naviVC
                    error:(NSError *__autoreleasing *)error
                  handler:(XCSDKHandler)handler;

- (void)openIconSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
             naviVC:(UINavigationController *_Nonnull)naviVC
        configError:(NSError *__autoreleasing *)configError
            handler:(XCSDKHandler)handler;

#pragma mark - TAB版SDK
- (BOOL)configSDK:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
         tabbarVC:(UITabBarController *_Nonnull)tabbarVC
            error:(NSError *__autoreleasing *)error
          handler:(XCSDKHandler)handler;

- (BOOL)configTabSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
            tabbarVC:(UITabBarController *_Nonnull)tabbarVC
         configError:(NSError *__autoreleasing *)configError
             handler:(XCSDKHandler)handler;

- (UIViewController *_Nullable)mainPage;
- (UIViewController *_Nullable)betPage;

- (UIViewController *_Nullable)viewControllerByPageId:(NSString *)pageId;

- (void)destroyByPageIds:(NSArray<NSString *> *_Nullable)pageIds;

/// 用于管理flutterVC
@property (nonatomic, strong, nullable) NSMutableDictionary *config;

- (BOOL)needShowTabbar;

#pragma mark - utils
- (void)clearSDK;
@end

NS_ASSUME_NONNULL_END
