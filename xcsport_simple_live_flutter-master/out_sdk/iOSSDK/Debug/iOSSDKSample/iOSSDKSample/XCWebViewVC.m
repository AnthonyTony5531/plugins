//
//  XCWebViewVC.m
//  iOSSDKSample
//
//  Created by eric on 20/01/15.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCWebViewVC.h"
#import <XCSDK/XCSDK.h>

@interface XCWebViewVC ()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong, nullable) WKWebView *webView;

@end

@implementation XCWebViewVC


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(self.isWebSDKModule) {
#if App_QJ
        self.title = @"AI体育-旗舰版";
#elif App_GJ
        self.title = @"AI体育-国际版";
#else
        self.title = @"AI体育";
#endif
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (void)addCloseButton {
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(kXCSCREEN_WIDTH-50, isPhoneX ? 44+10 : 20+10, 60, 60)];
    [closeButton setImage:[UIImage imageNamed:@"icon_popup_black"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeWebview:) forControlEvents:UIControlEventTouchUpInside];
    if(self.isWebSDKModule) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    }
    else {
        [self.view addSubview:closeButton];
    }
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        WKPreferences *preference = [[WKPreferences alloc]init];
        preference.minimumFontSize = 0;
        preference.javaScriptEnabled = YES;
        preference.javaScriptCanOpenWindowsAutomatically = YES;
        config.preferences = preference;
        config.allowsInlineMediaPlayback = YES;
        //config.requiresUserActionForMediaPlayback = YES;
        config.allowsPictureInPictureMediaPlayback = YES;

        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kXCSCREEN_WIDTH, kXCSCREEN_HEIGHT-44-(isPhoneX ? 44 : 20)) configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        [self.view addSubview:_webView];

        self.edgesForExtendedLayout = UIRectEdgeNone;
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        NSLog(@"_webView.frame=%@, self.view.frame=%@", NSStringFromCGRect(_webView.frame), NSStringFromCGRect(self.view.frame));
        [self addCloseButton];
    }
    return _webView;
}

- (void)closeWebview:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadWithURL:(NSString *_Nullable)urlString {
    if (urlString.length == 0) {
        return;
    }
    NSLog(@"00-loadWithURL-urlString=%@", urlString);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

#pragma mark - WKNavigationDelegate

//需要响应身份验证时调用 同样在block中需要传入用户身份凭证
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //用户身份信息
    NSURLCredential * newCred = [[NSURLCredential alloc] initWithUser:@"user123" password:@"123" persistence:NSURLCredentialPersistenceNone];
    //为 challenge 的发送方提供 credential
    [challenge.sender useCredential:newCred forAuthenticationChallenge:challenge];
    completionHandler(NSURLSessionAuthChallengeUseCredential,newCred);
}

@end
