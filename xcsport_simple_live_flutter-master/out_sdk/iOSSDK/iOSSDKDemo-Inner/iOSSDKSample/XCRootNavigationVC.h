//
//  XCRootNavigationVC.h
//  iOSSDKSample
//
//  Created by eric on 2020/10/26.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCRootNavigationVC : UINavigationController
@property (nonatomic) BOOL enableEdgePopGesture; ///< 使能侧滑边沿返回宿主App
@property (nonatomic, readonly) BOOL canEdgePopGesture; ///< 当前是否能侧滑边沿返回宿主App
@end

NS_ASSUME_NONNULL_END
