//
//  XCTabBarController.m
//  iOSSDKSample
//
//  Created by xc on 2020/7/31.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCTabBarController.h"
#import <XCSDK/XCSDK.h>
#import "XCMacro.h"
#import <XCSDK/XCSDKUtils.h>
#import <XCSDK/XCSDKManager.h>
#import <UIImageView+WebCache.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "XCNavigationVC.h"
#import "XCLoginVC.h"

//TODO: iOS14兼容性：因SDK内部使用FlutterSDK的版本是1.22.6，此版本Product Name不支持中文(非UTF8)，配置中文(非UTF8)会导致crash，如宿主App需要设置中文(非UTF8)App名请通过设置TARGET->General->Indentity->Display Name来替代

static NSDictionary *sConfig = nil;
static NSString *sAdverUrl = @"";

@interface XCTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, weak) UIViewController *betPage; ///< SDK betPage页面
@property (nonatomic, weak) UIViewController *mainPage; ///< SDK mainPage页面
@property (nonatomic, weak) XCNavigationVC *betNavVC; ///< betPage页面导航控制器
@property (nonatomic, weak) XCNavigationVC *mainNavVC; ///< mainPage页面导航控制器
@property (nonatomic) BOOL didConfigSDK; ///< YES-TabSDK已配置，NO-为配置
@end
@implementation XCTabBarController
#define LazyLoadingMode1 1
#define LazyLoadingMode2 2
#define TabSDKMode LazyLoadingMode1 // 强烈建议使用懒加载方式2或1接入TabSDK
- (void)viewDidLoad {
    [super viewDidLoad];
#if TabSDKMode == LazyLoadingMode1
    // TODO:懒加载方式1：初始化viewControllers->>需要使用SDK时配置SDK->>初始化mainPage/betPage->>资源加载页/启动页加载时(不会挡住其他tab子页面)
    // 2.1.1、配置SDK
    BOOL ret = [self configTabSDK]; if(!ret) return;
    // 2.1.2、初始化viewControllers
    [self initViewControllers];
    // 2.1.3、使用的时候再初始化betPage或mainPage
    if (self.selectedIndex == 2) [self configSDKPage:YES]; // 默认选中mainPage则在此初始化
#elif TabSDKMode == LazyLoadingMode2
    // TODO:懒加载方式2：初始化viewControllers->>需要使用SDK时配置SDK->>初始化mainPage/betPage->>资源加载页/启动页加载时(不会挡住其他tab子页面)
    // 2.2.1、初始化viewControllers
    [self initViewControllers]; self.selectedIndex = 1;
#else
    // TODO:旧方式：先配置SDK->>初始化viewControllers->>初始化betPage和mainPage->>资源加载页/启动页加载时(会挡住其他tab子页面)
    /* 如需同时初始化betPage和mainPage，请先初始化betPage然后再初始化mainPage并用UINavigationController(或其子类)包装（如仅使用一个，初始化一个即可）
     包装示例比如：[[UINavigationVC alloc] initWithRootViewController:mainPage],或[[XCNavigationVC alloc] initWithRootViewController:mainPage] */
    // 1.1、配置SDK
    BOOL ret = [self configTabSDK]; if(!ret) return;
    // 1.2、初始化viewControllers
    [self initViewControllers];
    // 1.3、初始化betPage和mainPage
    self.betNavVC.viewControllers = @[[XCSDKManager betPage]];
    self.mainNavVC.viewControllers = @[[XCSDKManager mainPage]];
#endif
    [self initTabBar];
    self.delegate = self;
    self.view.backgroundColor = UIColor.orangeColor;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"Native-%@", self.selectedIndex == 2 ? @"主页" : @"其他页面");
    if(self.selectedIndex == 2) {
        [XCSDKManager startVideo]; // 切回主页播放视频
    }
    else {
        [XCSDKManager pauseVideo]; // 切非主页暂停视频
    }

#if TabSDKMode == LazyLoadingMode1 || TabSDKMode == LazyLoadingMode2
    // 2.2.2、配置SDK
    if(!self.didConfigSDK) { BOOL ret = [self configTabSDK]; if(!ret) return; }
    // 2.2.3、初始化mainPage或betPage
    if(self.selectedIndex == 2) [self configSDKPage:YES];
    else if(self.selectedIndex == 3) [self configSDKPage:NO];
#endif
}
/// 配置TabSDK
- (BOOL)configTabSDK {
    NSError *error = nil;
    __weak __typeof(self) weakSelf = self;
    BOOL ret = [XCSDKManager configTabSdk:XCTabBarController.config tabbarVC:self configError:&error handler:^(NSString *_Nonnull method, NSDictionary * _Nullable params) {
        NSLog(@"method=%@, params=%@", method, params);
        if ([method isEqualToString:XCAppMethodBalanceChanged]) { // 余额变化
            CGFloat balance = [params[@"value"] floatValue];
            NSLog(@"balance=%f", balance);
        }
        else if ([method isEqualToString:XCAppMethodTokenTimeout]) {  // token已失效
            if ([XCTabBarController.config[XCSDKHandledTimeoutKey] boolValue]) { // 外部处理
                [weakSelf showHUDAndRelogin];
            }
        }
        else if ([method isEqualToString:XCAppMethodSystemRepair]) { // 系统维护-会回调多次(通过code/msg/whTime key获取相关信息)
            int code = [params[@"code"] intValue];
            NSString *msg = params[@"msg"];
            NSString *whTime = params[@"whTime"];
            NSLog(@"code=%d, msg=%@, whTime=%@", code, msg, whTime);
        }
        else if ([method isEqualToString:XCAppMethodRetryAlert]) {  // 因网络问题下载SDK资源包失败，按需实现
            NSUInteger index = [params[@"index"] intValue];
            if (index == 0) {} // 重试
            else if (index == 1) {} // 去检查网络
        }
        else if ([method isEqualToString:XCAppMethodViewWillAppear]) { // 视图展示消失回调
            bool animated = [params[@"animated"] boolValue]; // 父视图动画(仅仅iOS有)
            NSString *uiStyle = params[@"UIStyle"]; // tab版为tab,icon版为icon
            NSString *pageId = params[@"pageId"]; // tab的pageId可以为mainPage与memberBettingPage，icon为iconPage
            NSLog(@"animated=%d, uiStyle=%@, pageId=%@", animated, uiStyle, pageId);
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
        else if ([method isEqualToString:XCAppMethodNeedLogin]) {
            [self showAnonymousLogninVC:params];
        }
    }];
    if (ret) self.didConfigSDK = YES;
    return ret;
}
/// 配置SDK页面
/// @param isMainPage YES-mainPage NO-betPage
- (void)configSDKPage:(BOOL)isMainPage {
    if (isMainPage) {
        if (self.mainPage) return;
        UIViewController *mainPage = [XCSDKManager mainPage]; // 使用的时候初始化
        self.mainNavVC.viewControllers = @[mainPage];
        self.mainPage = mainPage;
    }
    else {
        if (self.betPage) return;
        UIViewController *betPage = [XCSDKManager betPage]; // 使用的时候初始化
        self.betNavVC.viewControllers = @[betPage];
        self.betPage = betPage;
        
    }
}
- (void)initViewControllers {
    XCNavigationVC *mainNavVC = [[XCNavigationVC alloc] initWithRootViewController:[self vcFromTitle:self.titles[2] imageNamed:self.images[2]]];
    XCNavigationVC *betNavVC = [[XCNavigationVC alloc] initWithRootViewController:[self vcFromTitle:self.titles[3] imageNamed:self.images[3]]];
    self.viewControllers = @[
        [[XCNavigationVC alloc] initWithRootViewController:[self vcFromTitle:self.titles[0] imageNamed:self.images[0]]],
        [[XCNavigationVC alloc] initWithRootViewController:[self vcFromTitle:self.titles[1] imageNamed:self.images[1]]],
        mainNavVC, // 先展示一个占位/空页面
        betNavVC, // 先展示一个占位/空页面
        [[XCNavigationVC alloc] initWithRootViewController:[self vcFromTitle:self.titles[4] imageNamed:self.images[4]]],
    ];
    self.mainNavVC = mainNavVC;
    self.betNavVC = betNavVC;
    self.selectedIndex = 2;
}

- (void)initTabBar {
    for (int i = 0; i < 5; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:TNColorWithHex(0x426D93), NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:TNColorWithHex(0x2B44B1), NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        item.selectedImage = [[UIImage imageNamed:self.selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = [[UIImage imageNamed:self.normalImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.title = self.titles[i];
    }
}

#pragma mark - 匿名登录功能-临时登录界面

- (void)showAnonymousLogninVC:(NSDictionary<NSString *,id> * _Nullable)params {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCLoginVC *loginVC = [mainSB instantiateViewControllerWithIdentifier:kXCLoginVCSBId];
    loginVC.mainUrl = params[XCSDKMainUrlKey];
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - getter
- (NSArray<NSString *> *)titles {
    return @[@"广场", @"游戏", @"体育", @"注单", @"我的"];
}

- (NSArray<NSString *> *)images {
    return @[@"img_playground", @"img_game", @"", @"img_betlist_top", @"img_mine"];
}

- (NSArray<NSString *> *)normalImages {
    return @[@"nav_playground_normal",@"nav_game_normal",@"nav_sports_normal",@"nav_betlist_normal",@"nav_mine_normal"];
}

- (NSArray<NSString *> *)selectImages {
    return @[@"nav_playground_selected",@"nav_game_selected",@"nav_sports_selected",@"nav_betlist_selected",@"nav_mine_selected"];
}

- (UIViewController *)vcFromTitle:(NSString *)title imageNamed:(NSString *)imageNamed {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.whiteColor;
    vc.title = title;
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    img.contentMode = UIViewContentModeScaleToFill;
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    img.frame = vc.view.bounds;
    [vc.view addSubview:img];
    return vc;
}

- (UIViewController *)getBetPage {
    double screenWidth = [UIScreen mainScreen].bounds.size.width;
    double screenHeight = [UIScreen mainScreen].bounds.size.height;
    double statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    double tabBarHeight = self.tabBar.frame.size.height;
    double menuHeight = statusHeight + 40.0;
    
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.whiteColor;
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_betlist_top"]];
    img.contentMode = UIViewContentModeScaleToFill;
    img.frame = CGRectMake(0, 0, screenWidth, menuHeight);
    [vc.view addSubview:img];
    
    UIViewController *betPage = [XCSDKManager betPage];
    betPage.view.frame = CGRectMake(0, statusHeight + 40.0, screenWidth, screenHeight - menuHeight - tabBarHeight);
    [vc addChildViewController:betPage];
    [vc.view addSubview:betPage.view];
    [betPage willMoveToParentViewController:vc];
    [betPage didMoveToParentViewController:vc];
    return vc;
}

#pragma mark - HUD
- (void)showHUDAndRelogin {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.label.text = @"TAB版-Token已失效";
        [hud hideAnimated:YES afterDelay:1];
    });
    
    NSString *name = XCGetUserDefaultsValue(kLoginAccount);
    NSString *pwd = XCGetUserDefaultsValue(kLoginPassword);
    if(name != nil && pwd != nil) {
        NSMutableDictionary *config = [NSMutableDictionary dictionaryWithDictionary:XCTabBarController.config];
        [config setObject:config[XCSDKMainUrlKey] forKey:@"mainUrl"];
        [config setObject:name forKey:@"loginName"];
        [config setObject:pwd forKey:@"passWord"];
        NSLog(@"TAB版-重新登录：config=%@", config);
        [XCSDKUtils loginWithConfig:config handler:^(NSDictionary<NSString *,NSString *> * _Nullable config, NSError * _Nullable error) {
            if (error) {
                NSLog(@"TAB版-重新获取token失败=%@", error.localizedDescription);
                return;
            }
            
            NSLog(@"TAB版-重新获取token=%@", config[XCSDKTokenKey]);
            [XCSDKManager updateToken:config[XCSDKTokenKey]];
        }];
    }
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

#pragma mark - private
- (void)dealloc {
    NSLog(@"SDK-单页面释放");
}

- (void)popOut:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
#pragma mark - public

+ (void)setConfig:(NSDictionary *)config {
    sConfig = config;
}

+ (NSDictionary *)config {
    return sConfig;
}

@end
