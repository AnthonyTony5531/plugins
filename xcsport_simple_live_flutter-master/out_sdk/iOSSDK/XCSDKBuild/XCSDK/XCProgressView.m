//
//  XCProgressView.m
//  iOSSDKSample
//
//  Created by xc07 on 2020/9/22.
//  Copyright © 2020 eric. All rights reserved.
//

#import "XCProgressView.h"
#import "XCSDKUtils.h"
#import "XCSDKManager.h"

@interface XCProgressView ()

@property(nonatomic, strong) UIView *subProgresView;
@property(nonatomic, strong) UIImageView *ballImage;
@property (nonatomic, strong, nullable) UILabel *progessLabel;
@end

#define kProgressViewH 20

@implementation XCProgressView

#pragma mark - public
+ (XCProgressView *)progressViewSuperView:(UIView *)view{
    
    CGFloat launchViewH = CGRectGetHeight(view.frame);
    NSLog(@"00-launchViewH=%f", launchViewH);
    XCProgressView *progressView = [XCProgressView new];
    [view addSubview:progressView];
    
    progressView.frame = CGRectMake(0, launchViewH - kLaunchTitleViewH-kProgressViewH/2, kXCScreenWidth, kProgressViewH);
    //progressView.frame = CGRectMake(0, kXCScreenHeight - kLaunchTitleViewH-kProgressViewH/2, kXCScreenWidth, kProgressViewH);
    progressView.backgroundColor = [UIColor clearColor];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 9.0, kXCScreenWidth, 4)];
    bgView.backgroundColor = kXCRGBA(34, 34, 34, 1);
    bgView.layer.cornerRadius = 2.0;
    bgView.clipsToBounds = YES;
    [progressView addSubview:bgView];
    
    progressView.subProgresView = [[UIView alloc] initWithFrame:CGRectMake(0, 9.0, 0, 4)];
    progressView.subProgresView.backgroundColor = kXCRGBA(253, 220, 57, 1);
    progressView.subProgresView.layer.cornerRadius = 2.0;
    progressView.subProgresView.clipsToBounds = YES;
    [progressView addSubview:progressView.subProgresView];
    
    progressView.ballImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 4, 12.0, 12.0)];
    progressView.ballImage.image = XCImage(@"sdk_loading_ball");
    [progressView addSubview:progressView.ballImage];
    progressView.ballImage.hidden = YES;
    
    UILabel *progessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, launchViewH-kLaunchTitleViewH-kProgressViewH, kXCScreenWidth, 18)];
    //UILabel *progessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kXCScreenHeight-kLaunchTitleViewH-kProgressViewH, kXCScreenWidth, 18)];
    progessLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    progessLabel.textAlignment = NSTextAlignmentCenter;
    progessLabel.textColor = UIColor.whiteColor;
    progessLabel.attributedText = nil; //[self shaowText:@"资源加载中..."];
    progressView.progessLabel = progessLabel;
    [view addSubview:progessLabel];
    progessLabel.hidden = YES;
    
    progressView.progressViewHidden = YES;
    return progressView;
}


- (void)setProgressText:(NSString *)progressText {
    _progressText = progressText;
    self.progessLabel.attributedText = [self shaowText:progressText];
}


- (void)setProgressValue:(CGFloat)progressValue{
    CGRect rect = self.subProgresView.frame;
    rect.size.width = kXCScreenWidth * progressValue;
    self.subProgresView.frame = rect;
    
//    double angle = kXCScreenWidth * progressValue/2.25;
//    CGAffineTransform rotate = CGAffineTransformMakeRotation(angle);
//    CGAffineTransform translate = CGAffineTransformMakeTranslation((kXCScreenWidth - 5) * progressValue, 1);
//    CGAffineTransform concat = CGAffineTransformConcat(rotate, translate);
//    self.ballImage.transform = concat;
}

- (void)setProgressViewHidden:(BOOL)hidden {
    _progressViewHidden = hidden;
    
    self.hidden = hidden;
    //self.progessLabel.hidden = hidden;
}

#pragma mark - private

- (NSAttributedString *_Nonnull)shaowText:(NSString *_Nonnull)text {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 1;
    shadow.shadowColor = kXCRGBA(0,0,0,0.7);
    shadow.shadowOffset = CGSizeMake(0, 2);//阴影偏移量，x向右偏移，y向下偏移，默认是（0，-3）
    return [[NSAttributedString alloc] initWithString:text attributes:@{NSShadowAttributeName:shadow}];
}


- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
