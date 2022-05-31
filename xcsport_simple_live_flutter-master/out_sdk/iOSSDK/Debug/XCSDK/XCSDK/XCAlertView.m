//
//  XCAlertView.m
//  iOSSDKSample
//
//  Created by pr on 2020/10/24.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCAlertView.h"
//#import "XCSelectView.h"
//#import "XCMacro.h"


@interface XCAlertView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (nonatomic, copy) XCAlertViewHandler handler;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic) BOOL removing;

@end

@implementation XCAlertView

+ (void)showAlertOnView:(UIView *_Nullable)parentView
                  title:(NSString *_Nullable)title
                    msg:(NSString *_Nullable)msg
                handler:(XCAlertViewHandler _Nullable)handler {
    UIView *view = parentView ?: kXCKeyWindow;
    XCAlertView *selectView = [XCAlertView xc_loadViewNib];
    //[selectView addTarget:selectView action:@selector(dismissWithIndex:) forControlEvents:UIControlEventTouchUpInside];
    selectView.frame = view.bounds;
    selectView.handler = handler;
    [view addSubview:selectView];
    selectView.contentView.layer.cornerRadius = 8;
    selectView.contentView.clipsToBounds = YES;
    
    selectView.alpha = 0.f;
    [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        selectView.alpha = 1.f;
    } completion:^(BOOL finished) {
    }];
}


- (void)dismissWithIndex:(NSUInteger)index {
    if (self.removing) {
        return;
    }
    
    self.removing = YES;
    [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        if(self.handler) self.handler(index);
        [self removeFromSuperview];
    }];
}

- (IBAction)onRetry:(UIButton *)sender {
    [self dismissWithIndex:0];
}

- (IBAction)onCheckNetwork:(UIButton *)sender {
//    [self dismissWithIndex:1];
    if(self.handler) self.handler(1);
    
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {}];
    }
}

@end
