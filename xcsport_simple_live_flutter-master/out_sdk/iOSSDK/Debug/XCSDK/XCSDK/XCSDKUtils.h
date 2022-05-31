//
//  XCSDKUtils.h
//  XCSDK
//
//  Created by eric on 2019/12/28.
//  Copyright © 2019 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define XCError(c, desc)    [NSError errorWithDomain:@"com.xucheng.sdk.aisport" code:c userInfo:@{NSLocalizedDescriptionKey : desc ?: @"expect error"}]

#define kXCSCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define kXCSCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)

#define isPhoneX            [XCSDKUtils hasLiuHai]

#define kNeedQueryMerchantAccessType @"needQueryMerchantAccessType"
#define kSourceType @"sourceType"

typedef enum : NSInteger {
    XCSDKConfigMin = -1,
    XCSDKConfigDev,
    XCSDKConfigYC365,
    XCSDKConfigXJ, ///< 只有小金商户
    XCSDKConfigCn2, ///< 参数版
    XCSDKConfigCn2XC, ///< xc域名
    XCSDKConfigCn3,
//    XCSDKConfigMax,
    XCSDKConfigBetaFat,
    XCSDKConfigFat,
    XCSDKConfigUAT,
    XCSDKConfigPre, ///< 旗舰版
    XCSDKConfigGJ, ///< 国际版
    XCSDKConfigB1,
    XCSDKConfigXZ,
    XCSDKConfigYP,
    XCSDKConfigThai,
    XCSDKConfigVietnam,
    XCSDKConfigThaiDevYc365d,
    XCSDKConfigVietnamDevYc365d,
    XCSDKConfigMerchant,
    XCSDKConfigMax,
} XCSDKConfigType;

typedef void(^XCSDKConfigHandler)(NSDictionary<NSString *, id> *_Nullable config, NSError *_Nullable error); ///< 模拟登录回调，config信息包含(token等信息)，error-信息

@interface XCSDKUtils : NSObject

#pragma mark - 模拟登录

/// 模拟登录并获取config配置信息
/// @param type 模拟环境【仅内部演示用】
/// @param config @{@"merchantId": merchantId, @"loginName": loginName, @"passWord": passWord}
/// @param handler 回调 config-包含token等信息，error-入参错误信息
+ (void)loginWithType:(XCSDKConfigType)type
               config:(NSDictionary<NSString *, id> *_Nonnull)config
              handler:(XCSDKConfigHandler)handler;


/// 模拟登录并获取config配置信息
/// @param config @{@"mainUrl": mainUrl, @"merchantId": merchantId, @"loginName": loginName, @"passWord": passWord}
/// @param handler 回调 config-仅包含token，error-入参错误信息
+ (void)loginWithConfig:(NSDictionary<NSString *, id> *_Nonnull)config
                handler:(XCSDKConfigHandler)handler;


#pragma mark - 获取广告配置
/// 获取广告配置信息
/// @param config @{XCSDKTokenKey:@"", XCSDKMainUrlKey:@""}
/// @param handler 回调包含广告信息，error-入参错误信息
+ (void)queryAdver:(NSDictionary<NSString *, id> *_Nonnull)config
           handler:(XCSDKConfigHandler)handler;


#pragma mark - 在播主播列表
/// 获取主播列表信息
/// @param config @{XCSDKTokenKey:@"", XCSDKMainUrlKey:@""}
/// @param handler resp-主播列表，error-错误信息
+ (void)queryAnchorList:(NSDictionary<NSString *, id> *_Nonnull)config
                handler:(void(^)(NSArray<NSDictionary<NSString*, NSString*> *> *_Nullable resp, NSError *_Nullable error))handler;

/// 快速登录
/// @param type 模拟环境【仅内部演示用】
/// @param handler resp-获取token等信息，error-错误信息
+ (void)queryQuickLogin:(XCSDKConfigType)type handler:(void(^)(NSDictionary *_Nullable resp, NSError *_Nullable error))handler;


#pragma mark - 获取商户访问类型
/// 获取商户访问类型
/// @param config 至少包含XCSDKMainUrlKey和XCSDKTokenKey的值
/// @param handler 请求结果(商户接入类型：ai-1、小金-3)
+ (void)queryMerchantAccessType:(NSDictionary<NSString *, id> *_Nonnull)config
                        handler:(void(^)(NSNumber *_Nullable sourceType, NSError *_Nullable error))handler;

#pragma mark - JSON Kit
+ (NSString *)jsonFromContain:(id)contain;

#pragma mark - Valid

+ (BOOL)checkURL:(NSString *)url;

+ (BOOL)checkStr:(NSString *)str;

#pragma mark - device
+ (BOOL)hasLiuHai;

#pragma mark - cryptor
+ (NSString *)md5:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
