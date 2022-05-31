//
//  XCNavigationVC.m
//  iOSSDKSample
//
//  Created by xc on 2021/2/24.
//  Copyright © 2021 eric. All rights reserved.
//

#import "XCNavigationVC.h"

@interface XCNavigationVC ()

@end
//TODO: iOS14兼容性：因SDK内部使用FlutterSDK的版本是1.22.6，此版本Product Name不支持中文(非UTF8)，配置中文(非UTF8)会导致crash，如宿主App需要设置中文(非UTF8)App名请通过设置TARGET->General->Indentity->Display Name来替代

@implementation XCNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setNavigationBarHidden:YES animated:animated];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

@end
