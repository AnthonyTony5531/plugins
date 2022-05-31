//
//  XCAlertView.h
//  iOSSDKSample
//
//  Created by pr on 2020/10/24.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XCAlertViewHandler)(NSUInteger index); ///< index 0-重试，1-退出检查


@interface XCAlertView : UIControl
+ (void)showAlertOnView:(UIView *_Nullable)parentView
                  title:(NSString *_Nullable)title
                    msg:(NSString *_Nullable)msg
                handler:(XCAlertViewHandler _Nullable)handler;
@end

NS_ASSUME_NONNULL_END
