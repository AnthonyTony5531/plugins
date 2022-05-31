//
//  XCProgressView.h
//  iOSSDKSample
//
//  Created by xc07 on 2020/9/22.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCProgressView : UIView
+ (XCProgressView *)progressViewSuperView:(UIView *)view;

@property (nonatomic, assign) CGFloat progressValue;

@property (nonatomic, copy, nullable) NSString *progressText;

@property (nonatomic) BOOL progressViewHidden;
@end

NS_ASSUME_NONNULL_END
