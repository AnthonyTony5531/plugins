//
//  XCRootVC.m
//  iOSSDKSample
//
//  Created by eric on 2019/10/12.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCRootVC.h"
#import "AppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "XCSampleVC.h"
#import "AFNetworking.h"
#import "XCWebViewVC.h"
#import "XCRootNavigationVC.h"
#import "XCSelectView.h"
#import "XCMacro.h"
#import "XCTabBarController.h"
#import "XCLoginView.h"
#import "XCWebViewVC.h"
#import "XCNavigationVC.h"
#import <UMCommon/UMConfigure.h>
#import "RouteSelectorVC.h"
#import "XCRootVC+Utils.h"

@interface XCRootVC ()<UITextFieldDelegate>
@end

@implementation XCRootVC

//TODO: iOS14兼容性：因SDK内部使用FlutterSDK的版本是1.22.6，此版本Product Name不支持中文(非UTF8)，配置中文(非UTF8)会导致crash，如宿主App需要设置中文(非UTF8)App名请通过设置TARGET->General->Indentity->Display Name来替代
#pragma mark - ICON版SDK
/// 启动ICON版SDK
- (IBAction)showICONSDKModule:(UIButton *)sender {
    [self hideKeyboard];
    
    if (self.envIndex == self.dataSource.count-1) {
        self.config = @{
            XCSDKMainUrlKey : self.textfields[1].text,
            XCSDKImUrlKey   : self.textfields[2].text,
            XCSDKImgUrlKey  : self.textfields[3].text,
            XCSDKTokenKey   : self.tokenField.text,
            XCSDKHandledSysRepairKey: @(self.handledSysRepairSwitch.on),
            XCSDKHandledTimeoutKey: @(self.handledTokenTimeoutSwitch.on),
        };
        self.config = [self addDefaultLaunchTitles:self.config];
        [self saveUserInfo];
    }
    else if (!self.config) {
        [self showHUD:@"请先获取配置信息" afterDelay:1];
        return;
    }

    NSError *error = nil;
    NSMutableDictionary *config = [@{
        XCSDKMainUrlKey     : self.config[XCSDKMainUrlKey] ?: @"",
        XCSDKImgUrlKey      : self.config[XCSDKImgUrlKey] ?: @"",
        XCSDKImUrlKey       : self.config[XCSDKImUrlKey] ?: @"",
        XCSDKTokenKey       : self.config[XCSDKTokenKey] ?: @"",
        XCSDKMerchantIdKey  : kMerchantId,
        XCSDKShowRechargeKey: @"1",
        XCSDKShowCashKey    : @"1",
        XCSDKShowTransferKey: @"1",
        XCSDKAppTypeKey : [self getAppType],
        XCSDKShowTabbarOnLoadingKey : @(self.showTabbarOnLoadingSwitch.on),
        XCSDKHandledSysRepairKey: @(self.handledSysRepairSwitch.on),
        XCSDKHandledTimeoutKey: @(self.handledTokenTimeoutSwitch.on),
    } mutableCopy];
    
#if App_PARAMS
    if(self.anonymousSwitch.on && !self.isVs) { // 虚拟体育没匿名登录
        [config removeObjectForKey:XCSDKTokenKey];
    }
#endif
    config = [self addDefaultLaunchTitles:config];
    NSLog(@"native-iconSDKConfig=%@", config);
    
    [XCSDKManager openIconSdk:config naviVC:self.navigationController configError:&error handler:self.sdkHandler];
    // 错误处理
    if (!!error) {
        NSLog(@"error=%@", error);
        NSString *msg = @"其他错误";
        switch (error.code) {
            case XCErrorCode_naviVCError:
            {
                msg = @"根控制器为空或类型错误";
                break;
            }
            case XCErrorCode_configError:
            {
                msg = @"配置信息错误或缺失";
                break;
            }
            default:
            {
                //...
                break;
            }
        }
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}

#pragma mark - TAB版SDK
/// 启动TAB版SDK
- (IBAction)showTABSDKModule:(UIButton *)sender {
    if (self.envIndex == self.dataSource.count - 1) {
        self.config = @{
            XCSDKMainUrlKey : self.textfields[1].text,
            XCSDKImUrlKey   : self.textfields[2].text,
            XCSDKImgUrlKey  : self.textfields[3].text,
            XCSDKTokenKey   : self.tokenField.text,
            XCSDKMerchantIdKey  : kMerchantId,
            XCSDKShowRechargeKey: @"0",
            XCSDKShowCashKey    : @"0",
            XCSDKShowTransferKey: @"0",
            XCSDKShowTabbarOnLoadingKey : @(self.showTabbarOnLoadingSwitch.on),
            XCSDKHandledSysRepairKey: @(self.handledSysRepairSwitch.on),
            XCSDKHandledTimeoutKey: @(self.handledTokenTimeoutSwitch.on),
        };
        self.config = [self addDefaultLaunchTitles:self.config];
        if (self.textfields[1].text.length == 0 ||
            self.textfields[2].text.length == 0 ||
            self.textfields[3].text.length == 0 ||
            self.tokenField.text.length == 0) {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"配置信息错误或缺失" preferredStyle:UIAlertControllerStyleAlert];
                [alertVC addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:alertVC animated:YES completion:nil];
            return;
        }
        [self saveUserInfo];
    }
    NSMutableDictionary *mConfig = [NSMutableDictionary dictionaryWithDictionary:self.config];
    [mConfig setObject:@(self.showTabbarOnLoadingSwitch.on) forKey:XCSDKShowTabbarOnLoadingKey];
    [mConfig setObject:[self getAppType] forKey:XCSDKAppTypeKey];
    [mConfig setObject:[self getSDKTitle] forKey:XCSDKLaunchTitleKey];
#if App_PARAMS
    if(self.anonymousSwitch.on && !self.isVs) { // 虚拟体育没匿名登录
        [mConfig removeObjectForKey:XCSDKTokenKey];
    }
#endif
    XCTabBarController.config = mConfig;
    [self.navigationController pushViewController:[[XCTabBarController alloc] init] animated:YES];
}

#pragma mark - 进入指定主播-ICON
- (IBAction)queryAnchorListAndEnterSDK:(UIButton *)sender {
    [self showAnchor];
}

#pragma mark - 进入指定比赛详情
- (void)gotoDetailPage:(NSDictionary *)config {
    NSError *configError = nil;
    [XCSDKManager showDetailPage:config naviVC:self.navigationController configError:&configError handler:self.sdkHandler];
    if(!configError) {
        NSLog(@"0-gotoDetailPage-错误信息：%@", configError.localizedDescription);
    }
}

#pragma mark - other action
- (IBAction)showWebSDKModule:(NSString *)url {
    [self showWebSDK:url];
}

- (IBAction)edgePopGestureSwitch:(UISwitch *)sender {
    [self hideKeyboard];
    
    [(XCRootNavigationVC *)self.navigationController setEnableEdgePopGesture:sender.on];
}

- (IBAction)fastEnter:(UIButton *)sender {
    [self hideKeyboard];
    [self showFastEnter];
}

/// 获取相关配置与token
- (IBAction)queryConfig:(UIButton *)sender {
    [self hideKeyboard];
    
    [self querySDKConfig];
}

- (IBAction)onPlatformSwitch:(UISwitch *)sender {
    self.platformSegControl.enabled = sender.on;
}

- (IBAction)appTypeChange:(UISegmentedControl *)sender {
    //Ai
    if (sender.selectedSegmentIndex == 0) {
        self.umengTextField.text = @"615facacac9567566e8b6cb8";
    }
    //Gbet
    else if(sender.selectedSegmentIndex == 1){
        self.umengTextField.text = @"61646a2a14e22b6a4f1ccf17";
    }
}


#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initDemoUI];
    
    __weak __typeof(self) weakSelf = self;
    self.sdkHandler = ^(NSString * _Nonnull method, NSDictionary<NSString *,id> * _Nullable params) {
        typeof(weakSelf) self = weakSelf;
        NSLog(@"method = %@, params=%@", method, params);
        NSString *showName = nil;
        if ([method isEqualToString:XCAppMethodCashOut]) {
            showName = @"宿主App-提现页面";
            [self showSampleVC:showName];
        }
        else if ([method isEqualToString:XCAppMethodRecharge]) {
            showName = @"宿主App-充值页面";
            [self showSampleVC:showName];
        }
        else if ([method isEqualToString:XCAppMethodTransfer]) {
            showName = @"宿主App-转账页面";
            [self showSampleVC:showName];
        }
        else if ([method isEqualToString:XCAppMethodNeedLogin]) {
            [self showAnonymousLogninVC:params]; // 匿名登录模式进入，触发登录
        }
        else if ([method isEqualToString:XCAppMethodExitSDK]) {
            // @"宿主App-主动退出SDK";
            [self readUserInfo];
        }
        //else if ([method isEqualToString:XCAppMethodEdgePopGesture]) {/*@"是否可以边沿侧滑返回";*/}
        else if ([method isEqualToString:XCAppMethodBalanceChanged]) { // 余额变化
            CGFloat balance = [params[@"value"] floatValue];
            NSLog(@"balance=%f", balance);
        }
        else if ([method isEqualToString:XCAppMethodRetryAlert]) {  // 因网络问题下载SDK资源包失败，按需实现
            NSUInteger index = [params[@"index"] intValue];
            if (index == 0) {} // 重试
            else if (index == 1) {} // 去检查网络
        }
        else if ([method isEqualToString:XCAppMethodTokenTimeout]) {
            // token超时;
            if (self.handledTokenTimeoutSwitch.on) { // 外部处理
                [self showHUDAndRelogin];
            }
        }
        else if ([method isEqualToString:XCAppMethodSystemRepair]) { // 系统维护-会回调多次(通过code/msg/whTime key获取相关信息)
            NSUInteger code = [params[@"code"] intValue];
            NSString *msg = params[@"msg"];
            NSString *whTime = params[@"whTime"];
            NSLog(@"code=%zd, msg=%@, whTime=%@", code, msg, whTime);
        }
        else if ([method isEqualToString:XCAppMethodDidEnterSDK]) {
            // ICON版已进入SDK;
            NSLog(@"--ICON版已进入SDK--");
        }
        else if([method isEqualToString:XCAppMethodCanAutorotate]){ // 当前页面是支持自动旋转
            BOOL autorotate = [params[@"autorotate"] boolValue]; // YES-支持，NO不支持
            NSLog(@"autorotate=%d", autorotate);
#if App_QJ || App_GJ || App_CN2
            NSLog(@"旗舰/国际/CN2版不展示HUD");
#else
            [weakSelf showHUD:autorotate ? @"开启自动旋转" : @"关闭自动旋转" afterDelay:1.f];
#endif
        }
    };
}

- (void)dealloc {
    self.sdkHandler = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.isShowNewLogin animated:animated];
}

#pragma mark - rotate
- (BOOL)shouldAutorotate{
    return NO;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.textfields[0] == textField) {
        return NO;
    }
    if(textField.canResignFirstResponder) [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return [self shouldBeginEditing:textField];
}

#pragma mark - export
- (void)showTABSDK {
    [self showTABSDKModule:nil];
}

- (void)showICONSDK {
    [self showICONSDKModule:nil];
}

- (void)showDetailPage:(NSDictionary *)config {
    [self gotoDetailPage:config];
}

@end
