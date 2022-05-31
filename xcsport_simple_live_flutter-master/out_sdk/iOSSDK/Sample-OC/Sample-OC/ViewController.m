//
//  ViewController.m
//  Sample-OC
//
//  Created by eric on 2022/4/8.
//

#import "ViewController.h"
#import <XCSDK/XCSDK.h>
#import "TabBarVC.h"

@interface ViewController ()
@property (nonatomic, copy, nullable) XCSDKHandler sdkHandler;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (IBAction)showICONSDK:(UIButton *)sender {
    NSError *error = nil;
    NSDictionary *config = @{
        XCSDKMainUrlKey : @"http://dev.m.yc365d.com",
        XCSDKImgUrlKey  : @"http://dev.img.yc365d.com",
        XCSDKImUrlKey   : @"ws://dev.m.yc365d.com",
        //XCSDKTokenKey   : @"登录token" // XCSDKTokenKey不传为匿名方式访问SDK
    };

    [XCSDKManager openIconSdk:config naviVC:self.navigationController configError:&error handler:self.sdkHandler];
}


- (IBAction)showTABSDK:(UIButton *)sender {
    [self.navigationController pushViewController:[[TabBarVC alloc] init] animated:YES];
}

- (void)dealloc {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.sdkHandler = nil;
}

@end
