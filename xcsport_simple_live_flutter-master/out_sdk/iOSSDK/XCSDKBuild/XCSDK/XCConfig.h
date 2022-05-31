//
//  XCConfig.h
//  iOSSDKSample
//
//  Created by eric on 2020/1/6.
//  Copyright © 2020 eric. All rights reserved.
//

#ifndef XCConfig_h
#define XCConfig_h

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>

#define kRedColor [UIColor colorWithRed:246/255.0 green:93/255.0 blue:54/255.0 alpha:1]

#define kXCMerchantId    @"038f3e1d118e41c9a248f045701a37b4" // 商户ID
#define kXCLoginNameKey  @"XCLoginName"
#define kXCLoginPwdKey   @"XCLoginPWD"
#define kXCLoginTokenKey @"XCLoginToken"

#define XCGetString(key)        [[NSUserDefaults standardUserDefaults] stringForKey:key];
#define XCSetString(str, key)   [[NSUserDefaults standardUserDefaults] setObject:str forKey:key];\
    [[NSUserDefaults standardUserDefaults] synchronize];
#endif /* XCConfig_h */
