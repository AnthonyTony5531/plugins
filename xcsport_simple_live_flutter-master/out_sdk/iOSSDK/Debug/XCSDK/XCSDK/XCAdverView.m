//
//  XCAdverView.m
//  XCSDK
//
//  Created by pr on 2020/10/26.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCAdverView.h"
#import "XCProgressView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "XCLaunchTitleView.h"
#import "XCSDKUtils.h"
#import "XCSDKManager.h"
#import "XCSDKModule.h"

@implementation UIView (XCSDKKit)
+ (id)xc_loadViewNib {
    NSArray *views = [XCBundle loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    if (views.count) {
        return [views lastObject];
    }
    return nil;
}

+ (CGFloat)bottomMarginSafeArea {
    CGFloat safeBottom = 0;
    if (@available(iOS 11.0, *)) {
        safeBottom = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    } else {
        // Fallback on earlier versions
    }
    return safeBottom;
}
@end

@implementation UIWindow (XCSDKKit)
+ (UIWindow *)xc_getKeyWindow {
    if (@available(iOS 13.0, *)) {
        UIWindow *keyWindow = nil;
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if ([windowScene isKindOfClass:UIWindowScene.class]) {
                //if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
                //}
            }
        }
        return keyWindow;
    }
    else {
        return [UIApplication sharedApplication].keyWindow;
    }
}
@end


@interface XCAdverView ()
@property (nonatomic, strong, nullable) UIImageView *adImageView;
@property (nonatomic, strong) XCProgressView *progressView;
@property (nonatomic, weak) XCLaunchTitleView *launchTitleView;

@property (nonatomic, copy, nullable) NSArray<NSString *> *subTitles;
@property (nonatomic, strong, nullable) NSTimer *timer;
@property (nonatomic) NSInteger index;
@property (nonatomic) BOOL animateFinished;
@property (nonatomic) BOOL canDismiss;
@end

#define kXCLaunchTitleAnimationDuration 0.5f

@implementation XCAdverView

+ (XCAdverView *)showAdViewWithTitle:(NSString * _Nullable)title
                         randomTitls:(NSArray<NSString *> * _Nullable)randomTitls
                                show:(BOOL)show {
    XCAdverView *adView = [self createAdverView:show];
    [adView addAdImageView];
    if(title != nil) [adView addLaunchTitleViewWithTitle:title subTitles:randomTitls];
    [adView addProgressView];
    
    if(randomTitls != nil && randomTitls.count != 0) adView.subTitles = randomTitls;
    return adView;
}

+ (XCAdverView *)showAdViewWithTitle:(NSString *_Nullable)title
                         randomTitls:(NSArray<NSString *> *_Nullable)randomTitls {
    return [self showAdViewWithTitle:title randomTitls:randomTitls show:YES];
}

+ (XCAdverView *)showAdView {
    return [self showAdViewWithTitle:nil randomTitls:nil show:YES];
}

- (void)setAdverUrl:(NSString *)adverUrl {
    _adverUrl = adverUrl;
    BOOL hasLaunchTitle = [self hasLaunchTitle];
    NSLog(@"hasLaunchTitle=%d", hasLaunchTitle);
    if (adverUrl != nil) {
        __weak __typeof(self) weakSelf = self;
        self.adImageView.contentMode = hasLaunchTitle ? UIViewContentModeScaleAspectFill : UIViewContentModeCenter;
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:adverUrl] placeholderImage:hasLaunchTitle ? nil : XCImage(@"sdk_loading_default") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!hasLaunchTitle) { // 原需求
                NSLog(@"00-原需求");
                weakSelf.adImageView.contentMode = UIViewContentModeScaleAspectFill;
                
                CATransition *transition = [CATransition animation];
                transition.type = kCATransitionFade;
                transition.duration = .4f;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [weakSelf.adImageView.layer addAnimation:transition forKey:nil];
            }
            else { // 新需求
                NSLog(@"11-3.8新需求");
                [weakSelf launchTitleViewAnimation];
            }
        }];
    }
    else {
        self.adImageView.image = nil;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self launchTitleViewAnimation];
        });
    }
}

- (BOOL)updateProgress:(NSDictionary *_Nullable)params {
    BOOL isDownLoadEnd = [params[@"isDownloadEnd"] isEqualToString:@"true"];
    CGFloat progress = [params[@"progress"] floatValue];
    NSInteger total = [params[@"total"] integerValue];
    NSString *tag = params[@"tag"];
    NSString *text = [NSString stringWithFormat:@"当前进度：%.2f%%   资源总大小：%.2fMB", progress*100, total/1024.0/1024.0];
    NSLog(@"updateProgress:params=%@", params);
    if([kBetListPageId isEqualToString:tag] && isDownLoadEnd) return NO;
    
    self.launchTitleView.progressLabel.text = text;
    //self.progressView.progressText = text;
    self.progressView.progressValue = progress;
    if(self.progressView.progressViewHidden && self.animateFinished) {
        self.progressView.progressViewHidden = NO;
        self.launchTitleView.progressLabel.hidden = NO;
    }
    if (progress > 0.99 && isDownLoadEnd) { // flutter下载页面先消失，覆盖在flutter上的原生进度页面要后消失
        [self.timer invalidate];
        self.timer = nil;
        self.canDismiss = YES;
        
        if (self.animateFinished) {
            [self removeFromSuperview];
            return YES;
        }
    }
    return NO;
}


#pragma mark - private
+ (XCAdverView *)createAdverView:(BOOL)show {
    BOOL needShowTabbar = ShareSDKModule.needShowTabbar;
    CGRect frame = CGRectMake(0, 0, kXCScreenWidth, kXCScreenHeight - (needShowTabbar ? kTabBarHeight : 0));
    NSLog(@"00-createAdverView-needMaskTabbar=%d, kTabBarHeight=%f, frame=%@, tabbarVC=%@, count=%zd, mainPageIndex=%zd", needShowTabbar, kTabBarHeight, NSStringFromCGRect(frame), ShareSDKModule.tabbarVC, ShareSDKModule.tabbarVC.viewControllers.count, ShareSDKModule.mainPageIndex);
    
    XCAdverView *adView = [[XCAdverView alloc] initWithFrame:frame];
    adView.backgroundColor = UIColor.blueColor;//[[UIColor whiteColor] colorWithAlphaComponent:0.3];
    if(show) {
        if(ShareSDKModule.tabbarVC && ShareSDKModule.needShowTabbar) {
#ifdef kShowTabBarTest
            [ShareSDKModule.tabbarVC.view insertSubview:adView belowSubview:ShareSDKModule.tabbarVC.view.subviews.lastObject];
#else
            if(ShareSDKModule.tabbarVC.viewControllers.count > ShareSDKModule.mainPageIndex) {
                UIViewController *mainVC = ShareSDKModule.tabbarVC.viewControllers[ShareSDKModule.mainPageIndex];
                NSLog(@"11-createAdverView-nav=%@", mainVC);
                [mainVC.view addSubview:adView];
            }
            else {
                NSLog(@"22-createAdverView");
                [ShareSDKModule.tabbarVC.view insertSubview:adView belowSubview:ShareSDKModule.tabbarVC.view.subviews.lastObject];
            }
#endif
        }
        else {
            NSLog(@"33-createAdverView");
            [kXCKeyWindow addSubview:adView];
        }
    }
    return adView;
}

//+ (void)logSubViews:(UIView *)supperView str:(NSString *)str {
//    NSLog(@"00-logSubViews:str");
//    [self logSubViews:ShareSDKModule.tabbarVC.view str:@"-"];
//    NSLog(@"11-logSubViews:str");
//    for (UIView *view in supperView.subviews) {
//        NSLog(@"%@%@", str, view);
//        if (view.subviews.count > 0) {
//            [self logSubViews:view str:[NSString stringWithFormat:@"%@-", str]];
//        }
//    }
//}

- (void)launchTitleViewAnimation {
    NSLog(@"00-launchTitleViewAnimation");
    [UIView animateWithDuration:kXCLaunchTitleAnimationDuration delay:.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.launchTitleView.frame = CGRectMake(0, CGRectGetHeight(self.bounds)-kLaunchTitleViewH, kXCScreenWidth, kLaunchTitleViewH);
        [self regularUpdate];
    } completion:^(BOOL finished) {
        self.animateFinished = YES;
        NSLog(@"11-launchTitleViewAnimation-canDismiss=%d", self.canDismiss);
        if (self.canDismiss) {
            NSLog(@"22-launchTitleViewAnimation");
            [self removeFromSuperview];
        }
    }];
}

- (void)regularUpdate {
    if (self.subTitles.count <= 1) {
        return;
    }
    
    __weak __typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSUInteger index = 0;
        while (index == weakSelf.index) {
            index = random()%(weakSelf.subTitles.count);
        }
        weakSelf.index = index;
        
        weakSelf.launchTitleView.subTitleLabel.text = weakSelf.subTitles[index];
    }];
}

- (BOOL)hasLaunchTitle {
    return self.launchTitleView != nil;
}

- (void)addAdImageView {
    UIImageView *adImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    adImageView.contentMode = UIViewContentModeCenter;
    adImageView.backgroundColor = [UIColor whiteColor];
    adImageView.image = XCImage(@"sdk_loading_default");
    [self addSubview:adImageView];
    self.adImageView = adImageView;
}

- (void)addProgressView {
    XCProgressView *progressView = [XCProgressView progressViewSuperView:self];
    self.progressView = progressView;
}

- (void)addLaunchTitleViewWithTitle:(NSString *)title
                          subTitles:(nullable NSArray<NSString *> *)subTitles {
    
    self.index = random()%(subTitles.count);
    self.launchTitleView = [XCLaunchTitleView showLaunchTitleView:self
                                                            title:title
                                                         subTitle:subTitles[self.index]];
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
