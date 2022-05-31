//
//  UITabBarController+Autorotate.m
//  iOSSDKSample
//
//  Created by xc07 on 2020/10/13.
//  Copyright © 2020 eric. All rights reserved.
//

#import "UITabBarController+Autorotate.h"


@implementation UITabBarController (Autorotate)

- (BOOL)shouldAutorotate{
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
