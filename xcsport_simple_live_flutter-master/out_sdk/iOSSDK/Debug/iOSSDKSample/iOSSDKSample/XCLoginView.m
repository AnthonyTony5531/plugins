//
//  XCLoginView.m
//  iOSSDKSample
//
//  Created by xc07 on 2020/9/29.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCLoginView.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import "XCMacro.h"
#import "XCWebViewVC.h"
#import <XCSDK/XCSDK.h>

@interface XCLoginView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *acountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *tabSDKBtn;
@property (weak, nonatomic) IBOutlet UIButton *iconSDKBtn;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (nonatomic, strong) AVPlayerViewController *playerVC;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *webSDKButton;
@property (weak, nonatomic) IBOutlet UILabel *webSDKLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *appTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@end

@implementation XCLoginView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.tabSDKBtn.layer.cornerRadius = 8.0;
    self.tabSDKBtn.clipsToBounds = YES;
    self.iconSDKBtn.layer.cornerRadius = 8.0;
    self.iconSDKBtn.clipsToBounds = YES;
    self.acountField.delegate = self;
    self.passwordField.delegate = self;
#if App_QJ
    self.webSDKButton.layer.cornerRadius = 8.0;
    self.webSDKButton.clipsToBounds = YES;
    self.webSDKButton.hidden = NO;
    self.webSDKLabel.hidden = NO;
    self.versionLabel.text = @"当前环境: Pre(旗舰)";
    self.titleLabel.text = @"欢迎使用AI旗舰版";
    self.topConstraint.constant = 76.0;
#elif App_GJ
    self.versionLabel.text = @"当前环境: GJ(国际)";
    self.titleLabel.text = @"欢迎使用AI国际版";
#elif App_CN2
    self.versionLabel.text = @"当前环境: GJ(国际-CN2环境)";
    self.titleLabel.text = @"欢迎使用AI国际版-CN2环境";
#endif
    
#if App_QJ || App_GJ
    self.webSDKLabel.hidden = YES;
    self.webSDKButton.hidden = YES;
    self.appTypeSegmentedControl.hidden = YES;
#endif

    NSAttributedString *acountAttr = [[NSAttributedString alloc]initWithString:@"请输入账号" attributes:@{
        NSForegroundColorAttributeName : [[UIColor whiteColor] colorWithAlphaComponent:0.3]
    }];
     NSAttributedString *passwordAttr = [[NSAttributedString alloc]initWithString:@"请输入密码" attributes:@{
        NSForegroundColorAttributeName : [[UIColor whiteColor] colorWithAlphaComponent:0.3]
    }];
    self.acountField.attributedPlaceholder = acountAttr;
    self.passwordField.attributedPlaceholder = passwordAttr;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEdit)];
    [self.contentView addGestureRecognizer:tap];
    
    NSString *account = XCGetUserDefaultsValue(kLoginAccount);
    NSString *passsword = XCGetUserDefaultsValue(kLoginPassword);
    self.acountField.text = account;
    self.passwordField.text = passsword;
    [self.contentView insertSubview:self.playerVC.view atIndex:0];
    self.playerVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    self.playerVC.view.frame = self.contentView.bounds;
    
    [self.playerVC.player play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerVC.player.currentItem];
//    [self.tabSDKBtn.layer addSublayer:self.getGradientLayer];
//    [self.iconSDKBtn.layer addSublayer:self.getGradientLayer];
}

- (void)playFinished:(NSNotification *)notification{
    [self.playerVC.player seekToTime:CMTimeMake(0, 1)];
    [self.playerVC.player play];
}

//- (CAGradientLayer *)getGradientLayer{
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    UIColor *color1 = [UIColor colorWithRed:254/255.0 green:224/255.0 blue:99/255.0 alpha:1];
//    UIColor *color2 = [UIColor colorWithRed:255/255.0 green:207/255.0 blue:71/255.0 alpha:1];
//    gradientLayer.colors = @[(__bridge id)color1.CGColor,(__bridge id)color2.CGColor];
//    gradientLayer.locations = @[@0.0,@1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    CGFloat width = kScreenWidth - 38 * 2 - 20;
//    gradientLayer.frame = CGRectMake(0, 0, width, 65.0);
//    return gradientLayer;
//}


- (void)endEdit{
    [self endEditing:YES];
}

- (IBAction)entryTabSDK:(UIButton *)sender {
    sender.enabled = NO;
    [self callbackWithIndex:0];
}

- (IBAction)entryIconSDK:(UIButton *)sender {
    sender.enabled = NO;
    [self callbackWithIndex:1];
}

- (IBAction)onTryPlay:(UIButton *)sender {
    if(self.tryPlay != nil) {
        self.tryPlay();
    }
}

- (IBAction)enterWebSDK:(UIButton *)sender {
    sender.enabled = NO;
    [self callbackWithIndex:2];
}

- (void)callbackWithIndex:(NSUInteger)index {
    [self performSelector:@selector(ButtonEnable) withObject:nil afterDelay:1];
    if (self.acountField.text.length == 0) {
        [self hideHUD:@"请输入账号"];
        return;
    }
    if (self.passwordField.text.length == 0) {
        [self hideHUD:@"请输入密码"];
        return;
    }
    [self endEdit];
    
    self.entrySDKBlock(index, self.acountField.text, self.passwordField.text, self.appTypeSegmentedControl.selectedSegmentIndex == 0);
}

- (void)autoFillAccountPwd {
    self.acountField.text = XCGetUserDefaultsValue(kLoginAccount);
    self.passwordField.text = XCGetUserDefaultsValue(kLoginPassword);
}

- (void)hideHUD:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.f];
    });
}

- (void)ButtonEnable{
    self.tabSDKBtn.enabled = YES;
    self.iconSDKBtn.enabled = YES;
    self.webSDKButton.enabled = YES;
}

- (void)showHUD:(NSString *)text afterDelay:(NSTimeInterval)delay {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.label.text = text;
        if (delay != 0) {
            [hud hideAnimated:YES afterDelay:delay];
        }
    });
}


-(AVPlayerViewController *)playerVC{
    if (!_playerVC) {
        _playerVC = [[AVPlayerViewController alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"login" ofType:@"mp4"];
        NSURL *url = [NSURL fileURLWithPath:path];
        _playerVC.player = [AVPlayer playerWithURL:url];
        _playerVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        //_playerVC.view.backgroundColor = [UIColor whiteColor];
        _playerVC.showsPlaybackControls = NO;
        _playerVC.videoGravity = AVLayerVideoGravityResize;
    }
    return _playerVC;
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

@end
