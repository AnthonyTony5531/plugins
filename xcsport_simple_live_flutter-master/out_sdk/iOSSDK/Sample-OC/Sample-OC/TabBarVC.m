//
//  TabBarVC.m
//  Sample-OC
//
//  Created by eric on 2022/4/8.
//

#import "TabBarVC.h"

@interface TabBarVC ()<UITabBarControllerDelegate>
@property (nonatomic, copy, nullable) XCSDKHandler sdkHandler;

@property (nonatomic) BOOL lazyLoadMode;
@property (nonatomic) BOOL didConfigSDK;

@property (nonatomic, weak) UIViewController *betPage;
@property (nonatomic, weak) UIViewController *mainPage;
@end

#define kTitles @[@"广场", @"游戏", @"体育", @"注单", @"我的"]

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSDKHandler];
    
    // 推荐方式：懒加载方式
    [self lazyLoadTABSDK];
    
    // 直接加载
    //[self loadTABSDK];
}

- (void)lazyLoadTABSDK {
    self.lazyLoadMode = YES;
    [self initViewControllers];
    [self initTabBar];
}

- (void)loadTABSDK {
    self.lazyLoadMode = NO;
    [self initViewControllers];
    [self initTabBar];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"Native-%@", self.selectedIndex == 2 ? @"主页" : @"其他页面");
    if(self.lazyLoadMode) {
        if(self.selectedIndex == 2 || self.selectedIndex == 2) {
            if (!self.didConfigSDK) {
                [self configTabSDK];
            }
            UINavigationController *navVC = (UINavigationController *)viewController;
            if(self.selectedIndex == 2 && self.mainPage == nil) {
                UIViewController *page = [XCSDKManager mainPage];
                self.mainPage = page;
                navVC.viewControllers = @[page];
            }
            else if(self.selectedIndex == 3 && self.betPage == nil) {
                UIViewController *page = [XCSDKManager betPage]; // 先创建mainPage，然后再创建betPage
                self.betPage = page;
                navVC.viewControllers = @[page];
            }
        }
    }
    
    if(self.selectedIndex == 2) {
        [XCSDKManager startVideo]; // 切回主页播放视频
    }
    else {
        [XCSDKManager pauseVideo]; // 切非主页暂停视频
    }
}

#pragma mark - private
/// 配置TabSDK
- (BOOL)configTabSDK {
    NSError *error = nil;
    NSDictionary *config = @{
        XCSDKMainUrlKey : @"http://dev.m.yc365d.com",
        XCSDKImgUrlKey  : @"http://dev.img.yc365d.com",
        XCSDKImUrlKey   : @"ws://dev.m.yc365d.com",
        // XCSDKTokenKey不传为匿名方式访问SDK，TAB版匿名方式进入SDK仅供商户快速接入，实际应用登录token是必传的
        //XCSDKTokenKey   : @"登录token"
    };
    BOOL success = [XCSDKManager configTabSdk:config tabbarVC:self configError:&error handler:self.sdkHandler];
    self.didConfigSDK = success;
    return success;
}


- (void)initViewControllers {
    self.delegate = self;
    
    UINavigationController *mainNavVC = [self navigationVCForIndex:2];
    UINavigationController *betNavVC = [self navigationVCForIndex:3];
    
    if(!self.lazyLoadMode) {
        [self configTabSDK];
        UIViewController *mainPage = [XCSDKManager mainPage];
        UIViewController *betPage = [XCSDKManager betPage];
        mainNavVC.viewControllers = @[mainPage];
        betNavVC.viewControllers = @[betPage];
        
        self.mainPage = mainPage;
        self.betPage = betPage;
    }
    
    self.viewControllers = @[
        [self navigationVCForIndex:0],
        [self navigationVCForIndex:1],
        mainNavVC, // 先展示一个占位/空页面
        betNavVC, // 先展示一个占位/空页面-按需添加
        [self navigationVCForIndex:4],
    ];
    
    if(!self.lazyLoadMode) self.selectedIndex = 2;
}

- (void)initTabBar {
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *naviBarAppearance = [UINavigationBarAppearance new];
        naviBarAppearance.backgroundColor = UIColor.whiteColor;
        naviBarAppearance.backgroundEffect = nil;
        naviBarAppearance.shadowColor = UIColor.clearColor;
        naviBarAppearance.titleTextAttributes  = @{NSForegroundColorAttributeName : UIColor.blackColor};
        
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
        } else {
            // Fallback on earlier versions
        }
#endif
    } else {
        // Fallback on earlier versions
    }
    
    for (int i = 0; i < 5; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.blackColor, NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.blueColor, NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        item.selectedImage = [[UIImage imageNamed:@"nav_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = [[UIImage imageNamed:@"nav_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.title = kTitles[i];
    }
}


- (UINavigationController *_Nullable)navigationVCForIndex:(NSUInteger)index {
    if(index > 4) {
        index = index % 5;
    }
    
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.whiteColor;
    vc.title = kTitles[index];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    if(index == 2 || index == 3) {
        [navVC setNavigationBarHidden:YES animated:NO];
    }
    else {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [btn setTitle:@"退出SDK" forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        btn.backgroundColor = UIColor.orangeColor;
        [btn addTarget:self action:@selector(exitTABSDK) forControlEvents:UIControlEventTouchUpInside];
        [vc.view addSubview:btn];
        btn.center = vc.view.center;
    }
    return navVC;
}


- (void)configSDKHandler {
    self.sdkHandler = ^(NSString * _Nonnull method, NSDictionary<NSString *,id> * _Nullable params) {
        NSLog(@"method = %@, params=%@", method, params);
        if ([method isEqualToString:XCAppMethodCashOut]) {
        }
        else if ([method isEqualToString:XCAppMethodRecharge]) {
        }
        else if ([method isEqualToString:XCAppMethodTransfer]) {
        }
        else if ([method isEqualToString:XCAppMethodNeedLogin]) { // 匿名登录模式进入，触发登录
        }
        else if ([method isEqualToString:XCAppMethodExitSDK]) { // 宿主App-主动退出SDK
        }
        else if ([method isEqualToString:XCAppMethodBalanceChanged]) { // 余额变化
            CGFloat balance = [params[@"value"] floatValue];
            NSLog(@"balance=%f", balance);
        }
        else if ([method isEqualToString:XCAppMethodRetryAlert]) {  // 因网络问题下载SDK资源包失败，按需实现
            NSUInteger index = [params[@"index"] intValue];
            if (index == 0) {} // 重试
            else if (index == 1) {} // 去检查网络
        }
        else if ([method isEqualToString:XCAppMethodTokenTimeout]) { // token超时;
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
    };
}

- (void)exitTABSDK {
    if(self.mainPage != nil || self.betPage != nil) {
        [XCSDKManager destroyByPageIds:nil]; // SDK页面释放
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)dealloc {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.sdkHandler = nil;
}


@end
