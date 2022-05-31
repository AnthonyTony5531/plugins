//
//  XCRootVC.h
//  iOSSDKSample
//
//  Created by eric on 2019/10/12.
//  Copyright © 2019 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCSDK/XCSDK.h>
#import "XCLoginView.h"

//#define kDEBUG_B1

@interface XCRootVC : UIViewController
/*
 0-环境选择
 1-主域名
 2-推送域名
 3-资源域名
 4-用户名
 5-密码
 */
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray<UITextField *> *textfields;
/*
 0-TAB SDK
 1-ICON SDK
 2-获取模拟配置
 3-启动快捷TZ
 4-进入详情主播
 */
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray<UIButton *> *buttons;
@property (weak, nonatomic) IBOutlet UILabel *userNameTitle;
@property (weak, nonatomic) IBOutlet UILabel *passwordTitle;
@property (weak, nonatomic) IBOutlet UILabel *slipTitle;
@property (weak, nonatomic) IBOutlet UISwitch *slipSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sysRepairLabel;
@property (weak, nonatomic) IBOutlet UISwitch *handledSysRepairSwitch;
@property (weak, nonatomic) IBOutlet UILabel *tokenTimeoutLabel;
@property (weak, nonatomic) IBOutlet UISwitch *handledTokenTimeoutSwitch;
@property (weak, nonatomic) IBOutlet UILabel *tokenTitle;
@property (weak, nonatomic) IBOutlet UITextField *tokenField;

@property (weak, nonatomic) IBOutlet UILabel *showTabbarOnLoadingLabel;
@property (weak, nonatomic) IBOutlet UISwitch *showTabbarOnLoadingSwitch;

/* 匿名登录开关 */
@property (weak, nonatomic) IBOutlet UILabel *anonymousLabel;
@property (weak, nonatomic) IBOutlet UISwitch *anonymousSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *platformSegControl;
@property (weak, nonatomic) IBOutlet UITextField *gidmTexFfield;
@property (weak, nonatomic) IBOutlet UITextField *anchorIdTexFfield;
@property (weak, nonatomic) IBOutlet UISwitch *platformSwitch;
@property (weak, nonatomic) IBOutlet UILabel *platformLabel;
@property (weak, nonatomic) IBOutlet UILabel *gidmLabel;
@property (weak, nonatomic) IBOutlet UILabel *anchorIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *umengIdLable;
@property (weak, nonatomic) IBOutlet UITextField *umengTextField;

@property (nonatomic, strong) XCLoginView *loginView;
@property (nonatomic) NSUInteger envIndex;
@property (nonatomic, copy, nullable) NSString *token;
@property (nonatomic, copy, nullable) NSDictionary *config;
@property (nonatomic, copy, nullable) NSString *adverUrl;

@property (nonatomic, copy, nullable) NSArray<NSDictionary *> *dataSource;
@property (nonatomic) BOOL isShowNewLogin; ///< 登录界面切换 YES-演示版，NO-参数版

@property (weak, nonatomic) IBOutlet UISegmentedControl *appTypeSegmentedControl; ///< App类型：0-ai 1-Gbet 2-虚拟体育
@property (weak, nonatomic) IBOutlet UISegmentedControl *listStyleSegmentedControl; ///< 列表样式：0-手动设置 1-小白 2-老鸟 3-清爽

/// 线路类型 1-ai体育；2-Gbet-app；3-Gbet-h5；4-虚拟体育；5-bet365
@property (nonatomic) NSInteger routeSelectorAppType;

@property (nonatomic, copy, nullable) XCSDKHandler sdkHandler;

#pragma mark - export
- (void)showTABSDK;

- (void)showICONSDK;

- (void)showDetailPage:(NSDictionary *)config;
@end

