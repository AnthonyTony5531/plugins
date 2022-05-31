//
//  XCSDKModule.m
//  iOSSDKSample
//
//  Created by eric on 2019/12/25.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCSDKModule.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "XCSdkApiPlugin.h"
#import "XCSDKUtils.h"
#import "XCFlutterVC.h"
#import "XCAdverView.h"

#import <MBProgressHUD/MBProgressHUD.h>

#define kFlutterVCKey   @"flutterVC"
#define kPluginKey      @"plugin"

#define kFlutterAttachDebug
#define kDelayReleaseDuration 0.5

@interface XCSDKModule ()
#ifdef kFlutterAttachDebug
@property (nonatomic,strong) FlutterEngine *flutterEngine;
#endif
@end

@implementation XCSDKModule

+ (instancetype)shareInstance {
    static XCSDKModule *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[XCSDKModule alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
#ifdef kFlutterAttachDebug
        self.flutterEngine = [[FlutterEngine alloc] initWithName:@"fast_ai_engine"];
        [self.flutterEngine run];
        [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
#endif
    }
    return self;
}

#pragma mark - ICON-SDK
- (void)openSDKWithConfig:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
                   naviVC:(UINavigationController *_Nonnull)naviVC
                    error:(NSError *__autoreleasing *)error
                  handler:(XCSDKHandler)handler {
    [self openIconSdk:sdkConfig naviVC:naviVC configError:error handler:handler];
}

- (void)openIconSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
             naviVC:(UINavigationController *_Nonnull)naviVC
        configError:(NSError *__autoreleasing *)configError
            handler:(XCSDKHandler)handler {
    if (!naviVC || ![naviVC isKindOfClass:UINavigationController.class]) {
        *configError = XCError(XCErrorCode_naviVCError, @"naviVC must be UINavigationController class or subclass");
        return;
    }
    if (![self checkSDKConfig:sdkConfig]) {
        *configError = XCError(XCErrorCode_configError, @"config data error");
        return;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:sdkConfig];
    [dict removeObjectForKey:XCSDKPageIdKey];
    [dict removeObjectForKey:XCSDKMainUrlKey];
    [dict removeObjectForKey:XCSDKImgUrlKey];
    [dict removeObjectForKey:XCSDKImUrlKey];
    [dict setObject:sdkConfig[XCSDKMainUrlKey] forKey:kXCMainUrlKey];
    [dict setObject:sdkConfig[XCSDKImgUrlKey] forKey:kXCImgUrlKey];
    [dict setObject:sdkConfig[XCSDKImUrlKey] forKey:kXCImUrlKey];
    [dict setObject:kXCSDKTypeIcon forKey:XCSDKTypeKey];
    NSString *appType = sdkConfig[XCSDKAppTypeKey];
    NSString *launchTitle = sdkConfig[XCSDKLaunchTitleKey];
    if(appType == nil || appType.length == 0) {
        [dict setObject:kXCAppTypeAi forKey:XCSDKAppTypeKey]; //默认使用AI体育页面
    }
    if(launchTitle == nil || launchTitle.length == 0) {
        [dict setObject:[self launchTitleFromAppType:sdkConfig[XCSDKAppTypeKey]] forKey:XCSDKLaunchTitleKey];
    }
    if(!dict[XCSDKLaunchSubTitlesKey] || ((NSArray *)dict[XCSDKLaunchSubTitlesKey]).count == 0) {
        [dict setObject:kLaunchSubTitles forKey:XCSDKLaunchSubTitlesKey];
    }
    
    self.willExitSDK = NO;
    self.sdkConfig = dict;
    self.handler = handler;
    self.rootNaviVC = naviVC;
    self.showNaviBar = naviVC.navigationBar.isHidden;
    [self.rootNaviVC setNavigationBarHidden:YES animated:YES];
    
    NSString *route = [XCSDKUtils jsonFromContain:dict];
    NSLog(@"route=%@", route);
    NSString *name = [NSString stringWithFormat:@"xc.iconsdk.%d", arc4random_uniform(100000)];
    NSLog(@"ICON.EngineName=%@", name);
    FlutterEngine *engine = [[FlutterEngine alloc] initWithName:name project:nil];
    [engine runWithEntrypoint:nil initialRoute:route];
    [self registerPluginWithEngine:engine];
    
    XCFlutterVC *flutterVC = [[XCFlutterVC alloc] initWithEngine:engine nibName:nil bundle:nil];
    if (dict[XCSDKHidesBottomBarWhenPushedKey] != nil) {
        flutterVC.hidesBottomBarWhenPushed = [dict[XCSDKHidesBottomBarWhenPushedKey] boolValue];
    }
    flutterVC.pageId = @"iconPage";
    flutterVC.uiStyle = @"icon";
    [self.rootNaviVC pushViewController:flutterVC animated:YES];
    self.flutterVC = flutterVC;
}

#pragma mark - TAB-SDK
- (BOOL)configSDK:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
         tabbarVC:(UITabBarController *_Nonnull)tabbarVC
            error:(NSError *__autoreleasing *)error
          handler:(XCSDKHandler)handler {
    return [self configTabSdk:sdkConfig tabbarVC:tabbarVC configError:error handler:handler];
}

- (BOOL)configTabSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
            tabbarVC:(UITabBarController *_Nonnull)tabbarVC
         configError:(NSError *__autoreleasing *)configError
             handler:(XCSDKHandler)handler {
    if (![tabbarVC isKindOfClass:UITabBarController.class]) {
        *configError = XCError(XCErrorCode_configError, @"tabbarVC must be a UITabBarController");
        return NO;
    }
    if (![self checkSDKConfig:sdkConfig]) {
        *configError = XCError(XCErrorCode_configError, @"config data error");
        return NO;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:sdkConfig];
    [dict removeObjectForKey:XCSDKMainUrlKey];
    [dict removeObjectForKey:XCSDKImgUrlKey];
    [dict removeObjectForKey:XCSDKImUrlKey];
    [dict setObject:sdkConfig[XCSDKMainUrlKey] forKey:kXCMainUrlKey];
    [dict setObject:sdkConfig[XCSDKImgUrlKey] forKey:kXCImgUrlKey];
    [dict setObject:sdkConfig[XCSDKImUrlKey] forKey:kXCImUrlKey];
    NSString *launchTitle = dict[XCSDKLaunchTitleKey];
    if(!launchTitle || launchTitle.length == 0) {
        [dict setObject:[self launchTitleFromAppType:sdkConfig[XCSDKAppTypeKey]] forKey:XCSDKLaunchTitleKey];
    }
    if(!dict[XCSDKLaunchSubTitlesKey] || ((NSArray *)dict[XCSDKLaunchSubTitlesKey]).count == 0) {
        [dict setObject:kLaunchSubTitles forKey:XCSDKLaunchSubTitlesKey];
    }
    if(dict[XCSDKMainPageIndexKey] != nil) {
        ShareSDKModule.mainPageIndex = [dict[XCSDKMainPageIndexKey] intValue];
        if (ShareSDKModule.mainPageIndex >= ShareSDKModule.tabbarVC.viewControllers.count) {
            ShareSDKModule.mainPageIndex = 2;
        }
    }
    else {
        ShareSDKModule.mainPageIndex = 2;
    }
    
    self.willExitSDK = NO;
    self.tabbarVC = tabbarVC;
    self.sdkConfig = dict;
    self.handler = handler;
    
    __weak __typeof(self) weakSelf = self;
    //self.adView = [XCAdverView showAdView];
    NSLog(@"tabsdkConfig=%@", dict);
    self.adView = [XCAdverView showAdViewWithTitle:dict[XCSDKLaunchTitleKey] randomTitls:dict[XCSDKLaunchSubTitlesKey]];
    [XCSDKUtils queryAdver:sdkConfig handler:^(NSDictionary * _Nullable resp, NSError * _Nullable error) {
        NSLog(@"00-resp=%@-error=%@", resp, error.localizedDescription);
        //if (error != nil) [weakSelf showHUD:@"广告配置获取失败" afterDelay:1];
        
        if (!error && [resp[@"data"] isKindOfClass:NSDictionary.class] && [resp[@"data"][@"loadingImage"] isKindOfClass:NSDictionary.class]) {
            NSString *loadingImage = resp[@"data"][@"loadingImage"][@"ai"];
            if(loadingImage == nil || ![loadingImage hasPrefix:@"http"]) loadingImage = [NSString stringWithFormat:@"%@%@", dict[@"imgUrl"], loadingImage];
            NSLog(@"广告URL=%@, error=%@", loadingImage, error);
            weakSelf.adView.adverUrl = loadingImage;
        }
        else {
            weakSelf.adView.adverUrl = nil;
        }
    }];
#ifdef kShowTabBarTest
    if(self.needShowTabbar) {
        self.adView1 = [XCAdverView showAdViewWithTitle:dict[XCSDKLaunchTitleKey] randomTitls:dict[XCSDKLaunchSubTitlesKey] show:NO];
    }
#endif
    NSLog(@"00-self.adView=%@", self.adView);
    return YES;
}

#ifdef kShowTabBarTest
- (void)setTabMainPage:(XCFlutterVC *)tabMainPage {
    _tabMainPage = tabMainPage;

    [tabMainPage.view addSubview:ShareSDKModule.adView1];
    [ShareSDKModule.adView removeFromSuperview];
    ShareSDKModule.adView = nil;
}
#endif

- (UIViewController *_Nullable)mainPage {
#ifdef kShowTabBarTest
    XCFlutterVC *page = (XCFlutterVC *)[self viewControllerByPageId:kMainPageId];
    if(ShareSDKModule.tabbarVC && ShareSDKModule.needShowTabbar) self.tabMainPage = page;
    return page;
#else
    return [self viewControllerByPageId:kMainPageId];
#endif
}

- (UIViewController *_Nullable)betPage {
    return [self viewControllerByPageId:kBetListPageId];
}

- (void)destroyByPageIds:(NSArray<NSString *> *_Nullable)pageIds {
    if (self.config.count == 0) {
        return;
    }
    
    if (!pageIds || pageIds.count == 0) {
        for (NSString *pageId in self.config.allKeys) {
            [self destroyEngine:pageId];
        }
        [self.config removeAllObjects];
        ShareSDKModule.handler = nil;
    }
    else {
        for (NSString *pageId in pageIds) {
            [self destroyEngine:pageId];
            [self.config removeObjectForKey:pageId];
        }
    }
    NSLog(@"self.config=%@", self.config);
}

- (void)destroyEngine:(NSString *_Nullable)pageId {
    __weak __typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDelayReleaseDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *item = weakSelf.config[pageId];
        XCSdkApiPlugin *plugin = item[kPluginKey];
        [plugin destroy];
#ifndef kFlutterAttachDebug
        XCFlutterVC *flutterVC = item[kFlutterVCKey];
        [flutterVC.engine destroyContext];
#endif
    });
}

- (NSMutableDictionary *)config {
    if (!_config) {
        _config = [NSMutableDictionary dictionary];
    }
    return _config;
}

- (BOOL)needShowTabbar {
    NSLog(@"00-needShowTabbar-sdkConfig=%@", self.sdkConfig);
    BOOL isIcon = [self.sdkConfig[XCSDKTypeKey] isEqualToString:@"sdk_default"];
    if (isIcon) {
        return YES;
    }
    
    return [self.sdkConfig[XCSDKShowTabbarOnLoadingKey] boolValue];
}


#pragma mark - utils
- (void)clearSDK {
    NSLog(@"00-%s", __PRETTY_FUNCTION__);
    [self.sdkApiPlugin invokeFlutterMethod:@"iconEngineWillDestroy" params:@{}];
    self.willExitSDK = YES;
    [self.rootNaviVC popViewControllerAnimated:YES];
    self.sdkApiPlugin = nil;
    self.handler = nil;
    
    __weak __typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDelayReleaseDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
#ifndef kFlutterAttachDebug
        [weakSelf.flutterVC.engine destroyContext];
        weakSelf.flutterVC = nil;
#endif
    });
    
    NSLog(@"11-%s", __PRETTY_FUNCTION__);
}


- (void)hideHUD:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:kXCKeyWindow];
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.f];
    });
}

- (void)showHUD:(NSString *)text afterDelay:(NSTimeInterval)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.label.text = text;
        if (delay != 0) {
            [hud hideAnimated:YES afterDelay:delay];
        }
    });
}

- (UIViewController *_Nullable)viewControllerByPageId:(NSString *)pageId {
    if (!self.sdkConfig || !self.handler || !pageId) {
        return nil;
    }
    
    [self.sdkConfig setObject:kXCSDKTypeTab forKey:XCSDKTypeKey];
    [self.sdkConfig removeObjectForKey:XCSDKPageIdKey];
    [self.sdkConfig setObject:pageId forKey:XCSDKPageIdKey];
    NSString *appType = self.sdkConfig[XCSDKAppTypeKey];
    if(appType == nil && [appType isEqualToString:@""]) {
        [self.sdkConfig setObject:kXCAppTypeAi forKey:XCSDKAppTypeKey]; // 默认使用AI体育页面
    }
    NSString *route = [XCSDKUtils jsonFromContain:self.sdkConfig];
    
    NSString *name = [NSString stringWithFormat:@"xc.tabsdk.%@", pageId];
    FlutterEngine *engine = [[FlutterEngine alloc] initWithName:name project:nil];
    [engine runWithEntrypoint:nil initialRoute:route];
    [self registerPluginWithEngine:engine];
    
    XCFlutterVC *flutterVC = [[XCFlutterVC alloc] initWithEngine:engine nibName:nil bundle:nil];
    flutterVC.pageId = pageId;
    flutterVC.uiStyle = @"tab";
    
    BOOL isBetList = [kBetListPageId isEqualToString:pageId];
    [self.config setObject:@{kFlutterVCKey : flutterVC, kPluginKey : isBetList ? self.betListPlugin : self.sdkApiPlugin} forKey:pageId];
    
    NSLog(@"%@ route=%@", pageId, route);
    NSLog(@"self.config=%@", self.config);
    return flutterVC;
}


- (void)registerPluginWithEngine:(FlutterEngine *)engine {
    [GeneratedPluginRegistrant registerWithRegistry:engine]; // 注册flutter插件
    [XCSdkApiPlugin registerWithRegistrar:[engine registrarForPlugin:@"sdkApiPlugin"]]; // 注册XCSdkApiPlugin
}


- (BOOL)checkSDKConfig:(NSDictionary *)sdkConfig {
    if (![sdkConfig isKindOfClass:NSDictionary.class] ||
        ![XCSDKUtils checkURL:sdkConfig[XCSDKMainUrlKey]] ||
        ![XCSDKUtils checkURL:sdkConfig[XCSDKImgUrlKey]] ||
        ![XCSDKUtils checkStr:sdkConfig[XCSDKImUrlKey]] ||
        (![XCSDKUtils checkStr:sdkConfig[XCSDKTokenKey]] && [kXCAppTypeVM isEqualToString:sdkConfig[XCSDKAppTypeKey]])) {
        return NO;
    }
    return YES;
}

- (NSString *)launchTitleFromAppType:(NSString *)appType {
    if([appType isEqualToString:kXCAppTypeAi]) return kLaunchTitle;
    else if([appType isEqualToString:kXCAppTypeGbet] || [appType isEqualToString:@"live188"]) return kLaunchTitleGbet;
    else if([appType isEqualToString:kXCAppTypeVM]) return kLaunchTitleVM;
    else if([appType isEqualToString:kXCAppType365]) return kLaunchTitle365;
    else return kLaunchTitle;
}

@end
