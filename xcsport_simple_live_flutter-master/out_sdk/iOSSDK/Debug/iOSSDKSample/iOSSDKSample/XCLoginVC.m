//
//  XCLoginVC.m
//  iOSSDKSample
//
//  Created by eric on 2021/11/29.
//  Copyright © 2021 eric. All rights reserved.
//

#import "XCLoginVC.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <XCSDK/XCSDK.h>
#import "XCMacro.h"

@interface XCLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@end

@implementation XCLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"XCLoginVC-mainUrl=%@", self.mainUrl);
#if DEBUG
    self.accountTF.text = @"llll";
    self.passwordTF.text = @"aa123456";
#endif
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

- (IBAction)hideKeyboard:(UIControl *)sender {
    [self.view endEditing:YES];
}

- (IBAction)onLogin:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if(self.accountTF.text.length == 0 || self.passwordTF.text.length == 0) {
        [self showHUD:@"账号或密码不能为空" afterDelay:1];
        return;
    }
    

    [self showHUD:@"登录中..."];
    __weak __typeof(self) weakSelf = self;
    [XCSDKUtils loginWithConfig:@{@"mainUrl": self.mainUrl, @"loginName": self.accountTF.text, @"passWord": self.passwordTF.text, @"merchantId": kMerchantId}
                        handler:^(NSDictionary<NSString *,id> * _Nullable config, NSError * _Nullable error) {
        typeof(weakSelf) self = weakSelf;
        [self hideHUD:error == nil ? @"登录成功" : (error.localizedDescription ?: @"登录失败")];
        if(error) return;
        
        NSLog(@"匿名-重新获取token=%@", config[XCSDKTokenKey]);
        [XCSDKManager updateToken:config[XCSDKTokenKey]];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}


#pragma mark - HUD
- (void)showHUD:(NSString *_Nullable)text {
    [self showHUD:text afterDelay:0];
}

- (void)hideHUD:(NSString * _Nullable)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:kXCKeyWindow];
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.f];
    });
}

- (void)showHUD:(NSString *_Nullable)text afterDelay:(NSTimeInterval)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kXCKeyWindow animated:YES];
        hud.label.text = text;
        if (delay != 0) {
            [hud hideAnimated:YES afterDelay:delay];
        }
    });
}

@end
