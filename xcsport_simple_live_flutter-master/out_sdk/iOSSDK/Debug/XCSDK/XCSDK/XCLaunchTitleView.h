//
//  XCLaunchTitleView.h
//  XCSDK
//
//  Created by xc on 2020/12/31.
//  Copyright © 2020 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCLaunchTitleView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

+ (XCLaunchTitleView *)showLaunchTitleView:(UIView *_Nullable)parentView
                                     title:(NSString *_Nullable)title
                                  subTitle:(NSString *_Nullable)subTitle;
@end

NS_ASSUME_NONNULL_END
