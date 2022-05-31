//
//  XCRootVC+Utils.m
//  iOSSDKSample
//
//  Created by eric on 2021/10/10.
//  Copyright © 2021 eric. All rights reserved.
//

#import "XCRootVC+Utils.h"
#import "XCLoginVC.h"

@implementation XCRootVC (Utils)

#pragma mark - action
- (void)showAnchor {
    if (self.config[XCSDKMainUrlKey] == nil || self.config[XCSDKTokenKey] == nil) {
        [self showHUD:@"请先获取配置信息~" afterDelay:1.0f];
        return;
    }
    
    if (self.gidmTexFfield.text.length != 0) {
        NSMutableDictionary *config = [NSMutableDictionary dictionaryWithDictionary:self.config];
        [config setObject:self.isAi ? kXCAppTypeAi : kXCAppTypeGbet forKey:XCSDKAppTypeKey];
        [config setObject:self.gidmTexFfield.text forKey:XCSDKGidmKey];
        if(self.anchorIdTexFfield.text.length != 0) [config setObject:self.anchorIdTexFfield.text forKey:XCSDKAnchorIdKey];
        if(self.platformSwitch.on) [config setObject:@(self.platformSegControl.selectedSegmentIndex==0?1:2) forKey:XCSDKSportPlatformKey];
        
        [self showDetailPage:config];
        return;
    }
    
    __weak __typeof(self) weakSelf = self;
    [XCSDKUtils queryAnchorList:self.config handler:^(NSArray<NSDictionary<NSString *,NSString *> *> * _Nullable resp, NSError * _Nullable error) {
        NSLog(@"resp=%@, error=%@", resp, error);
        typeof(weakSelf) self = weakSelf;
        
        if (resp.count == 0 || error != nil) {
            [self showHUD:resp.count == 0 ? @"主播列表为空，请稍后再试~" : error.localizedDescription afterDelay:1.0f];
            return;
        }
        
        NSMutableDictionary *config = [NSMutableDictionary dictionaryWithDictionary:self.config];
        [config setObject:resp.firstObject[XCSDKGidmKey] forKey:XCSDKGidmKey];
        [config setObject:resp.firstObject[XCSDKAnchorIdKey] forKey:XCSDKAnchorIdKey];
        [self showDetailPage:config];
    }];
}

- (void)showFastEnter {
    if (!self.config && !self.token.length) {
        [self showHUD:@"请先获取配置信息" afterDelay:1];
        return;
    }

    XCWebViewVC *webViewVC = [[XCWebViewVC alloc] init];
    //[webViewVC loadWithURL:[NSString stringWithFormat:@"%@/home?token=%@", self.config[XCSDKMainUrlKey], self.config[XCSDKTokenKey]]];
    [webViewVC loadWithURL:[NSString stringWithFormat:@"%@/dataview/bet?theme=100&lang=zh-cn&terType=4&token=%@", self.config[XCSDKMainUrlKey], self.config[XCSDKTokenKey]]];
    [self presentViewController:webViewVC animated:YES completion:nil];
}


- (void)querySDKConfig {
    NSLog(@"【仅dev与cn2可用】");
    [self showHUD:@"模拟配置获取中..."];
    __weak __typeof(self) weakSelf = self;
    NSString *loginName = self.textfields[4].text.length > 0 ? self.textfields[4].text : kName;
    NSString *passWord = self.textfields[5].text.length > 0 ? self.textfields[5].text : kPwd;
    if (self.envIndex < self.dataSource.count) {
//        if([self.dataSource[self.envIndex][XCSelectTypeKey] intValue] == XCSDKConfigPre) {
//            loginName = @"AITest683253";
//            passWord = @"AIPwd557489";
//            self.textfields[4].text = loginName;
//            self.textfields[5].text = passWord;
//        }
        XCSDKConfigType type = [(NSNumber *)self.dataSource[self.envIndex][XCSelectTypeKey] integerValue];
        [XCSDKUtils loginWithType:type
                           config:@{@"merchantId": kMerchantId, @"loginName": loginName, @"passWord": passWord}
                          handler:^(NSDictionary * _Nullable config, NSError * _Nullable error) {
            typeof(weakSelf) self = weakSelf;
            [self hideHUD:!error ? @"模拟配置获取成功" : (error.localizedDescription ?: @"模拟配置获取失败")];
            self.config = [self addDefaultLaunchTitles:config];
            
            if (!error) {
                XCSetUserDefaultsValue(loginName, kLoginAccount);
                XCSetUserDefaultsValue(passWord, kLoginPassword);
            }
        }];
    }
    else {
        if (![XCSDKUtils checkURL:self.textfields[1].text]) {
            [self hideHUD:@"主域名URL错误"];
            return;
        }
        [XCSDKUtils loginWithConfig:@{@"mainUrl": self.textfields[1].text, @"merchantId": kMerchantId, @"loginName": loginName, @"passWord": passWord}
                            handler:^(NSDictionary * _Nullable config, NSError * _Nullable error) {
            typeof(weakSelf) self = weakSelf;
            [self hideHUD:!error ? @"模拟配置获取成功" : (error.localizedDescription ?: @"模拟配置获取失败")];
            self.token = config[XCSDKTokenKey];
            
            if(!error) {
                XCSetUserDefaultsValue(loginName, kLoginAccount);
                XCSetUserDefaultsValue(passWord, kLoginPassword);
            }
        }];
    }
}

- (void)showWebSDK:(NSString *_Nullable)url {
    XCWebViewVC *webViewVC = [[XCWebViewVC alloc] init];
    webViewVC.isWebSDKModule = YES;
    [webViewVC loadWithURL:[NSString stringWithFormat:@"%@?token=%@", url ?: @"http://dev.nm.xc.com/home", self.config[XCSDKTokenKey]]];
    XCNavigationVC *navVC = [[XCNavigationVC alloc] initWithRootViewController:webViewVC];
    if(self.routeSelectorAppType > 0) {
        [self.navigationController.viewControllers.lastObject presentViewController:navVC animated:YES completion:nil];
    }
    else {
        [self presentViewController:navVC animated:YES completion:nil];
    }
}

#pragma mark - initUI

- (void)initDemoUI {
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *naviBarAppearance = [UINavigationBarAppearance new];
        naviBarAppearance.backgroundColor = UIColor.whiteColor;
        naviBarAppearance.backgroundEffect = nil;
        naviBarAppearance.shadowColor = UIColor.clearColor;
        naviBarAppearance.titleTextAttributes  = @{NSForegroundColorAttributeName : UIColor.blackColor};
        //self.navigationController.navigationBar.scrollEdgeAppearance = naviBarAppearance;
        
        [UINavigationBar appearance].standardAppearance = naviBarAppearance;
        [UINavigationBar appearance].scrollEdgeAppearance = naviBarAppearance;
    } else {
        // Fallback on earlier versions
    }
    
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *tabbarAppearance = [UITabBarAppearance new];
        tabbarAppearance.backgroundColor = UIColor.whiteColor;
        [tabbarAppearance configureWithOpaqueBackground];
        [UITabBar appearance].standardAppearance = tabbarAppearance;
        //self.tabBar.standardAppearance = tabbarAppearance;
#ifdef __IPHONE_15_0
        if (@available(iOS 15.0, *)) {
            [UITabBar appearance].scrollEdgeAppearance = tabbarAppearance;
            //self.tabBar.scrollEdgeAppearance = tabbarAppearance; // 设置tabBar或[UITabBar appearance]的scrollEdgeAppearance都有效
        } else {
            // Fallback on earlier versions
        }
#endif
    } else {
        // Fallback on earlier versions
    }
    
    self.dataSource = @[
        @{XCSelectTitleKey : @"YC365",      XCSelectTypeKey: @(XCSDKConfigYC365)},
        @{XCSelectTitleKey : @"Thai",       XCSelectTypeKey: @(XCSDKConfigThai)},
        @{XCSelectTitleKey : @"Vietnam",    XCSelectTypeKey: @(XCSDKConfigVietnam)},
        @{XCSelectTitleKey : @"ThaiDev",    XCSelectTypeKey: @(XCSDKConfigThaiDevYc365d)},
        @{XCSelectTitleKey : @"VietnamDev", XCSelectTypeKey: @(XCSDKConfigVietnamDevYc365d)},
        @{XCSelectTitleKey : @"Merchant",   XCSelectTypeKey: @(XCSDKConfigMerchant)},
        @{XCSelectTitleKey : @"XJ",         XCSelectTypeKey: @(XCSDKConfigXJ)},
        @{XCSelectTitleKey : @"DEV",        XCSelectTypeKey: @(XCSDKConfigDev)},
        @{XCSelectTitleKey : @"CN2",        XCSelectTypeKey: @(XCSDKConfigCn2)},
        @{XCSelectTitleKey : @"CN2XC",      XCSelectTypeKey: @(XCSDKConfigCn2XC)},
        @{XCSelectTitleKey : @"QJ",         XCSelectTypeKey: @(XCSDKConfigPre)},
        @{XCSelectTitleKey : @"NM01",       XCSelectTypeKey: @(XCSDKConfigNM01)},
        @{XCSelectTitleKey : @"CN2H603",    XCSelectTypeKey: @(XCSDKConfigCN2H603)},
#ifdef kDEBUG_B1
        @{XCSelectTitleKey : @"FAT",     XCSelectTypeKey: @(XCSDKConfigFat)},
        @{XCSelectTitleKey : @"CN3",     XCSelectTypeKey: @(XCSDKConfigCn3)},
        @{XCSelectTitleKey : @"BetaFat", XCSelectTypeKey: @(XCSDKConfigBetaFat)},
        @{XCSelectTitleKey : @"B1",      XCSelectTypeKey: @(XCSDKConfigB1)},
        @{XCSelectTitleKey : @"GJ",      XCSelectTypeKey: @(XCSDKConfigGJ)},
        @{XCSelectTitleKey : @"LT",      XCSelectTypeKey: @(XCSDKConfigUAT)},
        @{XCSelectTitleKey : @"XZ",      XCSelectTypeKey: @(XCSDKConfigXZ)},
        @{XCSelectTitleKey : @"YP",      XCSelectTypeKey: @(XCSDKConfigYP)},
        @{XCSelectTitleKey : @"商户接入", XCSelectTypeKey: @(XCSDKConfigDev)},
#else
        @{XCSelectTitleKey : @"商户接入", XCSelectTypeKey: @(XCSDKConfigDev)},
#endif
    ];
    
    // 友盟冲突验证
    //[UMConfigure initWithAppkey:@"6066917b18b72d2d2442ffce" channel:@"umeng"];

    self.isShowNewLogin = NO;
#if App_QJ || App_GJ || App_CN2 || App_Gbet
    self.isShowNewLogin = YES;
    NSLog(@"旗舰/国际/CN2/Gbet版展示新版登录 isShowNewLogin=%d", self.isShowNewLogin);
#endif
    
    if (self.isShowNewLogin) {
        [self configlLogin];
    }
    else{
        [self initUI];
        [self querySDKConfig];
    }
    NSLog(@"sdkVersion=%@", [XCSDKManager sdkVersion]);
}

- (void)initUI {
    self.title = @"商户";
    self.view.backgroundColor = UIColor.whiteColor;
    
    for (UIButton *btn in self.buttons) {
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 4;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = UIColor.grayColor.CGColor;
    }
    
//    self.gidmTexFfield.text = @"ib_3843972";
//    self.envIndex = 2;
    self.textfields[0].text = self.dataSource[0][XCSelectTitleKey];
    self.textfields[4].text = kName;
    self.textfields[1].enabled = NO;
    self.textfields[2].enabled = NO;
    self.textfields[3].enabled = NO;
    self.textfields[5].text = kPwd;
    
    self.umengTextField.text = @"615facacac9567566e8b6cb8";
}


// 新建登录窗口
- (void)configlLogin {
    self.navigationController.navigationBar.hidden = YES;
    self.loginView = [[NSBundle mainBundle] loadNibNamed:@"XCLoginView" owner:self options:nil].firstObject;
    self.loginView.hidden = NO;
    self.loginView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    self.loginView.frame = self.view.bounds;
    [self.view addSubview:self.loginView];
    __weak __typeof(self) weakSelf = self;
    [self.loginView setEntrySDKBlock:^(NSUInteger index, NSString * _Nonnull account, NSString * _Nonnull password, NSInteger appType) {
        weakSelf.appTypeSegmentedControl.selectedSegmentIndex = appType;
        
        [weakSelf showHUD:@"登录中..."];
        XCSDKConfigType envType = XCSDKConfigPre; // 默认旗舰版
        NSDictionary *config = @{@"merchantId": kMerchantId, @"loginName": account, @"passWord": password};
#if App_GJ
        envType = XCSDKConfigGJ;
#elif App_CN2
        envType = XCSDKConfigUAT;
#elif App_Gbet
        envType = XCSDKConfigGBetPre;
#endif
        
#if App_QJ || App_GJ
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:config];
        [dic setObject:@YES forKey:kNeedQueryMerchantAccessType];
        config = dic;
#endif
        
        NSLog(@"envType=%ld", envType);
        [XCSDKUtils loginWithType:envType
                           config:config
                          handler:^(NSDictionary * _Nullable config, NSError * _Nullable error) {
            
            [weakSelf hideHUD:!error ? @"模拟配置获取成功" : (error.localizedDescription ?: @"模拟配置获取失败")];
            weakSelf.config = [weakSelf addDefaultLaunchTitles:config];
            if (!config) return;
                
            [weakSelf saveLoginAccount:account withPassword:password];
#if App_QJ || App_GJ || App_Gbet
            // 旗舰、国际版跳选择线路页面
            RouteSelectorVC *selectorVC = [[RouteSelectorVC alloc] init];
            selectorVC.isGbet = [(NSNumber *)weakSelf.config[kSourceType] intValue] == 3;
            selectorVC.config = [[NSMutableDictionary alloc] initWithDictionary:weakSelf.config];
            selectorVC.onRouteSelector = ^(NSInteger appType) {
                [weakSelf selectorWithAppType:appType sdkType:index];
            };
            [weakSelf.navigationController pushViewController:selectorVC animated:YES];
#else
            if (index == 0) { // tabSDK
                [weakSelf showTABSDK];
            }
            else if (index == 1) { // iconSDK
                [weakSelf showICONSDK];
            }
            else { // webview sdk
                [weakSelf showWebSDK:nil];
            }
#endif
        }];
    }];
    
    XCSDKConfigType envType = XCSDKConfigPre; // 默认旗舰版
#if App_GJ
    envType = XCSDKConfigGJ;
#elif App_CN2
    envType = XCSDKConfigUAT;
#endif
    //envType = XCSDKConfigDev;
    // 试玩回调
    self.loginView.tryPlay = ^{
        [weakSelf showHUD:@"登录信息获取中..."];
        [XCSDKUtils queryQuickLogin:envType handler:^(NSDictionary * _Nullable resp, NSError * _Nullable error) {
            NSLog(@"resp=%@, error=%@", resp, error);
            BOOL success = resp[@"data"][@"token"] != nil;
            [weakSelf hideHUD:success ? @"配置获取成功" : error.localizedDescription ?: @"配置获取失败，请稍后再试~"];
            if(!success) return;
            
            NSString *token = resp[@"data"][@"token"];
            NSString *loginName = resp[@"data"][@"loginName"];
            NSString *passWord = resp[@"data"][@"passWord"];
            NSNumber *sourceType = resp[kSourceType];
            XCSetUserDefaultsValue(token, kToken);
            XCSetUserDefaultsValue(loginName, kLoginAccount);
            XCSetUserDefaultsValue(passWord, kLoginPassword);
            NSDictionary *config = resp[@"config"];
            weakSelf.config = @{
                XCSDKMainUrlKey     : config[XCSDKMainUrlKey] ?: @"",
                XCSDKImgUrlKey      : config[XCSDKImgUrlKey] ?: @"",
                XCSDKImUrlKey       : config[XCSDKImUrlKey] ?: @"",
                XCSDKTokenKey       : token ?: @"",
                XCSDKMerchantIdKey  : kMerchantId,
                XCSDKShowRechargeKey: @YES,
                XCSDKShowCashKey    : @YES,
                XCSDKShowTransferKey: @YES,
                XCSDKHandledSysRepairKey: @YES,
                XCSDKHandledTimeoutKey: @YES,
                XCSDKShowTabbarOnLoadingKey : @(weakSelf.showTabbarOnLoadingSwitch.on),
                kSourceType : sourceType ?: @NO,
            };
            weakSelf.config = [weakSelf addDefaultLaunchTitles:weakSelf.config];
            [weakSelf.loginView autoFillAccountPwd];
                
#if App_QJ || App_GJ || App_Gbet
            // 旗舰、国际版跳选择线路页面
            RouteSelectorVC *selectorVC = [[RouteSelectorVC alloc] init];
            selectorVC.isGbet = sourceType.intValue == 3;
            selectorVC.config = [[NSMutableDictionary alloc] initWithDictionary:weakSelf.config];
            selectorVC.onRouteSelector = ^(NSInteger appType) {
                [weakSelf selectorWithAppType:appType sdkType:1];
            };
            [weakSelf.navigationController pushViewController:selectorVC animated:YES];
#else
            [weakSelf showICONSDK];
#endif
        }];
    };
}


#pragma mark - route selector
/// 线路选择
/// @param appType 线路类型 0-ai体育/Gbet；1-Gbet-app(老UI)；2-Gbet-h5(老UI)；3-虚拟体育；4-小游戏，5-Gbet-h5(新UI)
/// @param sdkType SDK类型 0-tab 1-icon
- (void)selectorWithAppType:(NSInteger)appType sdkType:(NSInteger)sdkType {
    self.routeSelectorAppType = appType + 1;
    
    switch (appType) {
        case 0:
        case 1:
        case 3:
        {
            if(sdkType == 0) {
                [self showTABSDK];
            }
            else {
                [self showICONSDK];
            }
            break;
        }
        case 4:
        {
            [self showToast:nil];
            break;
        }
        case 2:
        case 5:
        {
            // Gbet-h5
            NSString *url = nil;
#if App_QJ || App_Gbet
            url = @"https://h5.juxiangbaojie.com/home";
#elif App_GJ
            url = @"https://h5.aiguoji888.com/home";
#else
            // 其他
#endif
            [self showWebSDK:url];
            break;
        }
        default:
            break;
    }
}


/// sdk title
- (NSString *)getSDKTitle {
    if(self.routeSelectorAppType == 0) {
        // 参数版 title
        switch (self.appTypeSegmentedControl.selectedSegmentIndex) {
            case 0:
                return kLaunchTitle;
            case 1:
                return kLaunchTitleGbet;
            case 2:
                return kLaunchTitleVM;
            case 3:
                return kLaunchTitleMG;
            default:
                return kLaunchTitle;
        }
    }
    
    // 旗舰/国际/CN2/Gbet版 title
    switch (self.routeSelectorAppType) {
        case 1:
#if App_Gbet
            return kLaunchTitleGbet;
#else
            return kLaunchTitle;
#endif
        case 2:
        case 3:
            return kLaunchTitleGbet;
        case 4:
            return kLaunchTitleVM;
        case 5:
            return kLaunchTitleMG;
        default:
            return kLaunchTitle;
    }
}


/// sdkAppType
- (NSString *)getAppType {
    if(self.routeSelectorAppType == 0) {
        // 参数版 App类型
        switch (self.appTypeSegmentedControl.selectedSegmentIndex) {
            case 0:
                return kXCAppTypeAi;
            case 1:
                return kXCAppTypeGbet;
            case 2:
                return kXCAppTypeVM;
            case 3:
                return kLaunchTitleMG;
            default:
                return kXCAppTypeAi;
        }
    }
    
    // 旗舰/国际/CN2/Gbet版 App类型
    switch (self.routeSelectorAppType) {
        case 1:
#if App_Gbet
            return kXCAppTypeGbet;
#else
            return kXCAppTypeAi;
#endif
        case 2:
        case 3:
        case 6:
            return kXCAppTypeGbet;
        case 4:
            return kXCAppTypeVM;
        case 5:
            return kXCAppTypeMG;
        default:
            return kXCAppTypeAi;
    }
}
#pragma mark - utils
- (void)showSampleVC:(NSString *_Nullable)showName {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCSampleVC *sampleVC = [mainSB instantiateViewControllerWithIdentifier:kXCSampleVCSBId];
    sampleVC.showName = showName;
    [self presentViewController:sampleVC animated:YES completion:nil];
}

- (void)showHUD:(NSString *_Nullable)text {
    [self showHUD:text afterDelay:0];
}

- (void)hideHUD:(NSString * _Nullable)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:kXCKeyWindow];
        hud.label.numberOfLines = 2;
        hud.mode = MBProgressHUDModeText;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.f];
    });
}

- (void)showToast:(NSString *_Nullable)text {
    NSString *msg = text ?: @"小游戏模块开发中~";
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = msg;
        hud.label.font = [UIFont systemFontOfSize:14];
        [hud hideAnimated:YES afterDelay:1];
    });
}

- (void)showHUD:(NSString *_Nullable)text afterDelay:(NSTimeInterval)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.label.font = [UIFont systemFontOfSize:14];
        hud.label.text = text;
        if (delay != 0) {
            [hud hideAnimated:YES afterDelay:delay];
        }
    });
}

- (void)showHUDAndRelogin {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.label.font = [UIFont systemFontOfSize:14];
        hud.label.text = @"ICON版-Token已失效";
        [hud hideAnimated:YES afterDelay:1];
    });
    
    NSString *name = XCGetUserDefaultsValue(kLoginAccount);
    NSString *pwd = XCGetUserDefaultsValue(kLoginPassword);
    NSString *mainUrl = self.config[XCSDKMainUrlKey];
    if(!name && !pwd && !mainUrl) {
        NSDictionary *config = @{
            @"mainUrl"    : mainUrl,
            @"loginName"  : name,
            @"passWord"   : pwd,
            @"merchantId" : kMerchantId,
        };
        NSLog(@"ICON版-重新登录：config=%@", config);
        [XCSDKUtils loginWithConfig:config handler:^(NSDictionary<NSString *,NSString *> * _Nullable config, NSError * _Nullable error) {
            if (error) {
                NSLog(@"ICON版-重新获取token失败=%@", error.localizedDescription);
                return;
            }
            
            NSLog(@"ICON版-重新获取token=%@", config[XCSDKTokenKey]);
            [XCSDKManager updateToken:config[XCSDKTokenKey]];
        }];
    }
}

- (NSMutableDictionary *)addDefaultLaunchTitles:(NSDictionary *)config {
    if (!config) {
        return nil;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:config];
    [dict setObject:[self getSDKTitle] forKey:XCSDKLaunchTitleKey];
    [dict setObject:@(self.listStyleSegmentedControl.selectedSegmentIndex) forKey:XCSDKListStyleKey];
    [dict setObject:kLaunchSubTitles forKey:XCSDKLaunchSubTitlesKey];
    if(self.umengTextField.text.length > 0) {
        [dict setObject:self.umengTextField.text forKey:XCSDKUmAppKey];
    }
    return dict;
}

//- (NSArray<NSString *> *)listStyleKeys {
//    return @[@"" @"laoniao", @"concise", @"xiaobai"];
//}

- (void)saveLoginAccount:(NSString *)account withPassword:(NSString *)password{
    XCSetUserDefaultsValue(account, kLoginAccount);
    XCSetUserDefaultsValue(password, kLoginPassword);
}

- (void)saveUserInfo{
    
    NSString *mainUrl = self.textfields[1].text.length > 0 ? self.textfields[1].text : @"";
    NSString *imgUrl = self.textfields[2].text.length > 0 ?self.textfields[2].text : @"";
    NSString *imUrl =  self.textfields[3].text.length > 0 ?self.textfields[3].text : @"";
    NSString *token = self.tokenField.text.length > 0 ? self.tokenField.text : @"";
    XCSetUserDefaultsValue(mainUrl, kMainUrlKey);
    XCSetUserDefaultsValue(imgUrl, kImgUrlKey);
    XCSetUserDefaultsValue(imUrl, kImUrlKey);
    XCSetUserDefaultsValue(token, kTokenKey);
}

- (void)readUserInfo{
    self.textfields[1].text = XCGetUserDefaultsValue(kMainUrlKey);
    self.textfields[2].text = XCGetUserDefaultsValue(kImgUrlKey);
    self.textfields[3].text = XCGetUserDefaultsValue(kImUrlKey);
    self.tokenField.text = XCGetUserDefaultsValue(kTokenKey);
}

- (void)showModule{
    
    self.tokenTitle.hidden = YES;
    self.tokenField.hidden = YES;
    self.userNameTitle.hidden = NO;
    self.textfields[4].hidden = NO;
    self.passwordTitle.hidden = NO;
    self.textfields[5].hidden = NO;
    self.slipTitle.hidden = NO;
    self.slipSwitch.hidden = NO;
    self.handledSysRepairSwitch.hidden = NO;
    self.handledTokenTimeoutSwitch.hidden = NO;
    self.sysRepairLabel.hidden = NO;
    self.tokenTimeoutLabel.hidden = NO;
    [self.buttons setValue:@NO forKey:@"hidden"];
    self.umengIdLable.hidden = NO;
    self.umengTextField.hidden = NO;
    
    self.platformSegControl.hidden = NO;
    self.platformSwitch.hidden = NO;
    self.platformLabel.hidden = NO;
    self.gidmTexFfield.hidden = NO;
    self.anchorIdTexFfield.hidden = NO;
    self.gidmLabel.hidden = NO;
    self.anchorIdLabel.hidden = NO;
    self.showTabbarOnLoadingSwitch.hidden = NO;
    self.showTabbarOnLoadingLabel.hidden = NO;
    self.appTypeSegmentedControl.hidden = NO;
    self.anonymousSwitch.hidden = NO;
    self.anonymousLabel.hidden = NO;
    self.listStyleSegmentedControl.hidden = NO;
}

- (void)hiddenModule{
    self.tokenTitle.hidden = NO;
    self.tokenField.hidden = NO;
    self.userNameTitle.hidden = YES;
    self.textfields[4].hidden = YES;
    self.passwordTitle.hidden = YES;
    self.textfields[5].hidden = YES;
    self.slipTitle.hidden = YES;
    self.slipSwitch.hidden = YES;
    self.handledSysRepairSwitch.hidden = YES;
    self.handledTokenTimeoutSwitch.hidden = YES;
    self.sysRepairLabel.hidden = YES;
    self.tokenTimeoutLabel.hidden = YES;
    [self.buttons setValue:@YES forKey:@"hidden"];
    self.buttons[0].hidden = NO;
    self.buttons[1].hidden = NO;
    self.umengIdLable.hidden = YES;
    self.umengTextField.hidden = YES;
    
    self.platformSegControl.hidden = YES;
    self.platformSwitch.hidden = YES;
    self.platformLabel.hidden = YES;
    self.gidmTexFfield.hidden = YES;
    self.anchorIdTexFfield.hidden = YES;
    self.gidmLabel.hidden = YES;
    self.anchorIdLabel.hidden = YES;
    self.showTabbarOnLoadingSwitch.hidden = YES;
    self.showTabbarOnLoadingLabel.hidden = YES;
    self.appTypeSegmentedControl.hidden = YES;
    self.anonymousSwitch.hidden = YES;
    self.anonymousLabel.hidden = YES;
    self.listStyleSegmentedControl.hidden = YES;
    [self readUserInfo];
}

- (void)onFloatButton:(UIButton *_Nullable)sender {
    XCSampleVC *sampleVC = [[XCSampleVC alloc] init];
    sampleVC.showName = @"showName";
    [self.navigationController pushViewController:sampleVC animated:YES];
}

#pragma mark - 匿名登录功能-临时登录界面

- (void)showAnonymousLogninVC:(NSDictionary<NSString *,id> * _Nullable)params {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCLoginVC *loginVC = [mainSB instantiateViewControllerWithIdentifier:kXCLoginVCSBId];
    loginVC.mainUrl = params[XCSDKMainUrlKey];
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - hide keyboard
- (IBAction)onContentViewTap:(UIControl *)sender {
    [self hideKeyboard];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

#pragma mark - textField
- (BOOL)shouldBeginEditing:(UITextField *)textField {
    if (self.textfields[0] == textField) {
        __weak __typeof(self) weakSelf = self;
        CGRect frame = [textField convertRect:textField.bounds toView:kXCKeyWindow];
        [XCSelectView showSelectViewOnView:kXCKeyWindow contentFrame:CGRectMake(CGRectGetMinX(frame)+4, CGRectGetMaxY(frame)+4, 150, self.dataSource.count*40) dataSource:self.dataSource handler:^(NSDictionary * _Nonnull dict, NSUInteger index) {
            typeof(weakSelf) self = weakSelf;
            BOOL isLast = index == self.dataSource.count-1;
            self.envIndex = index;
            self.textfields[0].text = dict[XCSelectTitleKey];
            self.textfields[1].enabled = isLast;
            self.textfields[2].enabled = isLast;
            self.textfields[3].enabled = isLast;
            if (isLast) {
                self.config = nil;
                self.token = nil;
                [self hiddenModule];
                
//                self.textfields[1].text = @"mainUrl";
//                self.textfields[2].text = @"imUrl";
//                self.textfields[3].text = @"imgUrl";
//                self.tokenField.text = @"token";
            }
            else {
                [self querySDKConfig];
                [self showModule];
            }
        }];
        return NO;
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - appType utils
- (BOOL)isAi {
    return self.appTypeSegmentedControl.selectedSegmentIndex == 0;
}

- (BOOL)isGbet {
    return self.appTypeSegmentedControl.selectedSegmentIndex == 1;
}

- (BOOL)isVs {
    return self.appTypeSegmentedControl.selectedSegmentIndex == 2;
}
@end
