//
//  XCWebViewVC.h
//  iOSSDKSample
//
//  Created by eric on 20/01/15.
//  Copyright © 2019 eric. All rights reserved.
//

#import <WebKit/WebKit.h>


@interface XCWebViewVC : UIViewController

@property (nonatomic) BOOL isWebSDKModule; ///<  NO-fastWebSDK，YES-WebSDKModule
- (void)loadWithURL:(NSString *_Nullable)urlString;

@end
