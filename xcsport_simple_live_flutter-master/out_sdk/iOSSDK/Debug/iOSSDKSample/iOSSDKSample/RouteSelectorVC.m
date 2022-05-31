//
//  RouteSelectorVC.m
//  iOSSDKSample
//
//  Created by eric on 2021/10/8.
//  Copyright © 2021 eric. All rights reserved.
//

#import "RouteSelectorVC.h"
#import <SDWebImage/UIImage+Transform.h>
@interface RouteSelectorVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint; ///< 到父视图顶部距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top188Contraint; ///< ai-Gbet到AiappView的距离
@property (weak, nonatomic) IBOutlet UIView *virtualSprotsView;
@property (weak, nonatomic) IBOutlet UIView *aiAppView;
@end

@implementation RouteSelectorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.isGbet) {
        self.aiAppView.hidden = YES;
        self.virtualSprotsView.hidden = YES;
        self.topConstraint.priority = UILayoutPriorityRequired;
        self.top188Contraint.priority = UILayoutPriorityDefaultLow;
        self.topConstraint.constant = 10.f;
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 110, 44)];
    [button setImage:[UIImage imageNamed:@"icon_all_back"] forState:UIControlStateNormal];
    [button setTitle:@" 选择线路" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
    
//    UIImage *img = [UIImage new];
//    [img sd_tintedImageWithColor:UIColor.whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:img];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    [self.navigationController setNavigationBarHidden:YES];
    
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
}

- (IBAction)onRouteSelector:(UIControl *)sender {
    NSLog(@"sender.tag=%d", (int)sender.tag);
    if(self.onRouteSelector != nil) {
        self.onRouteSelector(sender.tag-100);
    }
    else {
        NSLog(@"请设置回调");
    }
}
@end
