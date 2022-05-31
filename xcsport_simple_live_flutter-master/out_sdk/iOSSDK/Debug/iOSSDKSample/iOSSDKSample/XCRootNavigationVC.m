//
//  XCRootNavigationVC.m
//  iOSSDKSample
//
//  Created by eric on 2020/10/26.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCRootNavigationVC.h"
#import <XCSDK/XCSDKManager.h>

@interface XCRootNavigationVC ()<UIGestureRecognizerDelegate>
@end
//TODO: iOS14兼容性：因SDK内部使用FlutterSDK的版本是1.22.6，此版本Product Name不支持中文(非UTF8)，配置中文(非UTF8)会导致crash，如宿主App需要设置中文(非UTF8)App名请使用General-Indentity-Display Name来替代

@implementation XCRootNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 默认是禁掉侧滑
    self.enableEdgePopGesture = NO;
    _canEdgePopGesture = YES;
}

- (void)setEnableEdgePopGesture:(BOOL)enableEdgePopGesture {
    _enableEdgePopGesture = enableEdgePopGesture;
    if (enableEdgePopGesture) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(edgePopGestureNotification:) name:XCSDKEdgePopGestureNotification object:nil];
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:XCSDKEdgePopGestureNotification object:nil];
        self.interactivePopGestureRecognizer.delegate = nil;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)edgePopGestureNotification:(NSNotification *)note {
    if (!self.enableEdgePopGesture || ![note.name isEqualToString:XCSDKEdgePopGestureNotification]) {
        return;
    }

    if (self.interactivePopGestureRecognizer.delegate != self) {
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    NSDictionary *arguments = note.object;
    NSLog(@"note.object=%@", note.object);
    if (![arguments isKindOfClass:NSDictionary.class]) {
        return;
    }
    _canEdgePopGesture = [arguments[@"canEdgePopGesture"] boolValue];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.childViewControllers.count == 1 || !self.canEdgePopGesture || !self.enableEdgePopGesture) {
        return NO;
    }
    return YES;
}
@end
