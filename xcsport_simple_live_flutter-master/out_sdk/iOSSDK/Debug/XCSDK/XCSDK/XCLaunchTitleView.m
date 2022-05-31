//
//  XCLaunchTitleView.m
//  XCSDK
//
//  Created by xc on 2020/12/31.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCLaunchTitleView.h"

@implementation XCLaunchTitleView

+ (XCLaunchTitleView *)showLaunchTitleView:(UIView *_Nullable)parentView
                                     title:(NSString *_Nullable)title
                                  subTitle:(NSString *_Nullable)subTitle {
    UIView *view = parentView ?: kXCKeyWindow;
    XCLaunchTitleView *launchTitleView = [XCLaunchTitleView xc_loadViewNib];
    launchTitleView.frame = view.bounds;//CGRectMake(0, 0, kXCScreenWidth, kXCScreenHeight);
    launchTitleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:launchTitleView];
    
    launchTitleView.titleLabel.font = [UIFont systemFontOfSize:21 weight:UIFontWeightBold];
    launchTitleView.subTitleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    launchTitleView.titleLabel.text = title;
    launchTitleView.subTitleLabel.text = subTitle;
    return launchTitleView;
}

@end
