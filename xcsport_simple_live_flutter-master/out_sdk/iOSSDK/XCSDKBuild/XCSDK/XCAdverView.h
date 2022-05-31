//
//  XCAdverView.h
//  XCSDK
//
//  Created by pr on 2020/10/26.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTabBarHeight (49 + [UIView bottomMarginSafeArea])

NS_ASSUME_NONNULL_BEGIN
@interface UIView (XCSDKKit)
+ (id)xc_loadViewNib;

+ (CGFloat)bottomMarginSafeArea;
@end

@interface UIWindow (XCSDKKit)
+ (UIWindow *)xc_getKeyWindow;
@end

@interface XCAdverView : UIView
+ (XCAdverView *)showAdViewWithTitle:(NSString * _Nullable)title
                         randomTitls:(NSArray<NSString *> * _Nullable)randomTitls
                                show:(BOOL)show;

+ (XCAdverView *)showAdViewWithTitle:(NSString *_Nullable)title
                         randomTitls:(NSArray<NSString *> *_Nullable)randomTitls;

+ (XCAdverView *)showAdView;

@property (nonatomic, copy, nullable) NSString *adverUrl;

- (BOOL)updateProgress:(NSDictionary *_Nullable)params;
@end

NS_ASSUME_NONNULL_END
