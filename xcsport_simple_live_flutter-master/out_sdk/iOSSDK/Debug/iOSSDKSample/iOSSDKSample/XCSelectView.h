//
//  XCSelectView.h
//  checkOnline
//
//  Created by tn on 2020/5/8.
//  Copyright © 2020 nc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TNSelectViewHandler)(NSDictionary *dict, NSUInteger index);

//static NSString *_Nullable const XCSelectValueKey = @"value"; ///< value
static NSString *_Nullable const XCSelectTitleKey = @"title"; ///< title
static NSString *_Nullable const XCSelectTypeKey = @"type"; ///< type

@interface XCSelectView : UIControl
+ (void)showSelectViewOnView:(UIView *_Nullable)parentView
                    contentY:(CGFloat)contentOffsetY
                     handler:(TNSelectViewHandler _Nullable)handler;

+ (void)showSelectViewOnView:(UIView *_Nullable)parentView
                contentFrame:(CGRect)contentFrame
                  dataSource:(NSArray<NSDictionary<NSString *, NSString *> *> *_Nullable)dataSource
                     handler:(TNSelectViewHandler _Nullable)handler;
@end

@interface UIView (XCKit)
+ (id)loadViewNib;
@end

@interface UIWindow (XCKit)
+ (UIWindow *)getKeyWindow;
@end

NS_ASSUME_NONNULL_END
