//
//  XCMacro.h
//  iOSSDKSample
//
//  Created by xc on 2020/7/31.
//  Copyright © 2020 eric. All rights reserved.
//

#ifndef XCMacro_h
#define XCMacro_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "XCSelectView.h"

#define kMerchantId @"038f3e1d118e41c9a248f045701a37b4" // 商户ID

#ifdef DEBUG
    #define kName       @"llll"
#else
    #define kName       @"lll"
#endif

#define kPwd        @"aa123456"

#define TNColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define TNColorWithRGB(r, g, b)     TNColorWithRGBA(r, g, b, 1.0)
#define TNColorWithHex(hex)         TNColorWithRGBA((((hex) & 0xFF0000) >> 16), (((hex) & 0x00FF00) >> 8), ((hex) & 0x0000FF), 1.0)
#define TNColorWithHexA(hex, a)     TNColorWithRGBA((((hex) & 0xFF0000) >> 16), (((hex) & 0x00FF00) >> 8), ((hex) & 0x0000FF), a)

#define kXCKeyWindow [UIWindow getKeyWindow]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kLoginAccount   @"LoginAccount"
#define kLoginPassword  @"LoginPassword"
#define kToken          @"kTPToken"

/* --- 保存/获取Value ---*/
#pragma mark - NSUserDefault 存储
#define XCUserDefaults [NSUserDefaults standardUserDefaults]
// 如果value为nil,代表删除
#define XCSetUserDefaultsValue(value,key) \
    do {\
        if (value) { \
            [XCUserDefaults setObject:value forKey:key];\
            [XCUserDefaults synchronize];\
        }\
        else {\
            [XCUserDefaults removeObjectForKey:key];\
        }\
    } while(0)
#define XCGetUserDefaultsValue(key) [XCUserDefaults objectForKey:key]

/* --- 保存/获取int ---*/
#define XCSetUserDefaultsInt(i, k)  \
    do { \
        [XCUserDefaults setInteger:i forKey:k];\
        [XCUserDefaults synchronize];\
    } while(0)
#define XCGetUserDefaultsInt(key)   [XCUserDefaults integerForKey:key]

/* --- 保存/获取bool ---*/
#define XCSetUserDefaultsBool(b, k) \
    do { \
        [XCUserDefaults setBool:b forKey:k];\
        [XCUserDefaults synchronize];\
    } while(0)
#define XCGetUserDefaultsBool(key)  [XCUserDefaults boolForKey:key]

#endif /* XCMacro_h */
