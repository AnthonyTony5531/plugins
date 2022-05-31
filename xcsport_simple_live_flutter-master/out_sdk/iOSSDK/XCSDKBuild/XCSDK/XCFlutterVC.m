//
//  XCFlutterVC.m
//  XCSDK
//
//  Created by eric on 2020/1/11.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCFlutterVC.h"
#import "XCSDKModule.h"

@interface XCFlutterVC ()

@end

@implementation XCFlutterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(ShareSDKModule.handler != nil) ShareSDKModule.handler(@"viewWillAppear", @{@"animated": @(animated), @"UIStyle": self.uiStyle, @"pageId" : self.pageId});
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (ShareSDKModule.rootNaviVC != nil && !ShareSDKModule.rootNaviVC.navigationBar.isHidden) {
        [ShareSDKModule.rootNaviVC setNavigationBarHidden:YES animated:YES];
    }
    
    if(ShareSDKModule.handler != nil) ShareSDKModule.handler(@"viewDidAppear", @{@"animated": @(animated), @"UIStyle": self.uiStyle, @"pageId" : self.pageId});
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (ShareSDKModule.willExitSDK && ShareSDKModule.rootNaviVC != nil) {
        [ShareSDKModule.rootNaviVC setNavigationBarHidden:ShareSDKModule.showNaviBar animated:YES];
    }
    
    if(ShareSDKModule.handler != nil) ShareSDKModule.handler(@"viewWillDisappear", @{@"animated": @(animated), @"UIStyle": self.uiStyle, @"pageId" : self.pageId});
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    bool hasFlutterVC = NO;
    NSLog(@"00-%s, nav=%@, rootNaviVC=%@", __PRETTY_FUNCTION__, self.navigationController, ShareSDKModule.rootNaviVC);
    if(self.navigationController != nil || ShareSDKModule.rootNaviVC != nil) {
        UINavigationController *naviVC = self.navigationController ?: ShareSDKModule.rootNaviVC;
        NSLog(@"22-naviVC=%@", naviVC);
        for (UIViewController *vc in naviVC.viewControllers.reverseObjectEnumerator) {
            hasFlutterVC = [vc isKindOfClass:self.class];
            NSLog(@"vc=%@, hasFlutterVC=%d", vc, hasFlutterVC);
            if(hasFlutterVC) break;
        }
    }
    if(ShareSDKModule.handler != nil) ShareSDKModule.handler(@"viewDidDisappear", @{@"animated": @(animated), @"UIStyle": self.uiStyle, @"pageId" : self.pageId});
    
    NSLog(@"33-hasFlutterVC=%d, willExitSDK=%d, %s", hasFlutterVC, ShareSDKModule.willExitSDK, __PRETTY_FUNCTION__);
    if(!hasFlutterVC && !ShareSDKModule.willExitSDK) { // 侧滑返回后
        NSLog(@"44-hasFlutterVC, fun:%s", __PRETTY_FUNCTION__);
        [ShareSDKModule clearSDK];
    }
}

@end
