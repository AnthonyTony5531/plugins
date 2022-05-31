//
//  XCSDKUtils.m
//  XCSDK
//
//  Created by eric on 2019/12/28.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCSDKUtils.h"
#import "XCConfig.h"
#import "XCSDKManager.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "XCAdverView.h"

// 商户访问类型-默认值
#define kDefaultSourceType @1

@interface XCSDKUtils ()
@end


@implementation XCSDKUtils

#pragma mark - App DEBUG Config
+ (void)loginWithType:(XCSDKConfigType)type
               config:(NSDictionary<NSString *, id> *_Nonnull)config
              handler:(XCSDKConfigHandler)handler {
    if (type < XCSDKConfigMin || type > XCSDKConfigMax || !config.count) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, XCError(-1, @"type or config error"));
        });
        NSAssert(0, @"type or config error");
        return;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[self xc_urls][@(type)]];
    [dict addEntriesFromDictionary:config];
    [self simulate:YES config:dict handler:handler];
}

+ (void)loginWithConfig:(NSDictionary<NSString *, id> *_Nonnull)config
                handler:(XCSDKConfigHandler)handler {
    [self simulate:NO config:config handler:handler];
}

+ (void)simulate:(BOOL)private
          config:(NSDictionary<NSString *, id> *_Nonnull)config
         handler:(XCSDKConfigHandler)handler {
    NSString *mainUrl = private ? config[XCSDKMainUrlKey] : config[@"mainUrl"];
    NSString *merchantId = config[@"merchantId"];
    NSString *loginName = config[@"loginName"];
    NSString *passWord = config[@"passWord"];
    NSAssert(!!mainUrl.length && !!loginName.length && !!passWord.length && !!merchantId.length, @"mainUrl/loginName/passWord/merchantId lenght must not be 0");
    
    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/login", mainUrl];
    NSDictionary *params = @{
        @"merchantId" : merchantId,
        @"loginName" : loginName,
        @"passWord" : [self md5:passWord],
    };
    AFHTTPSessionManager *manager = [self getManagerWithMainUrl:mainUrl];
    [manager POST:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject=%@", responseObject);
        if (handler) {
            if([responseObject[@"code"] intValue] == 200) {
                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                [dict setObject:responseObject[@"data"] ?: @"" forKey:XCSDKTokenKey];
                if (private) {
                    [dict addEntriesFromDictionary:config];
                    [dict removeObjectForKey:@"mainUrl"];
                }
                if([config[kNeedQueryMerchantAccessType] boolValue]) { // 需要请求 商户访问类型
                    [self queryMerchantAccessType:@{XCSDKMainUrlKey : mainUrl, XCSDKTokenKey : responseObject[@"data"]} handler:^(NSNumber * _Nullable sourceType, NSError * _Nullable error) {
                        [dict setObject:sourceType ?: kDefaultSourceType forKey:kSourceType];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (handler) handler(dict, nil);
                        });
                    }];
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (handler) handler(dict, nil);
                    });
                }
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(nil, XCError([responseObject[@"code"] intValue], responseObject[@"msg"]));
                });
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, error);
        });
    }];
}

+ (void)queryAdver:(NSDictionary<NSString *, id> *_Nonnull)config
           handler:(XCSDKConfigHandler)handler {
    if (config == nil || ((NSString *)config[XCSDKMainUrlKey]).length == 0 || ((NSString *)config[XCSDKTokenKey]).length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, XCError(-1, @"config error"));
        });
        return;
    }
    
    NSString *mainUrl = config[XCSDKMainUrlKey];
    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/common/businessConfig", mainUrl];
    NSLog(@"common/businessConfig-mainUrl=%@, token=%@", mainUrl, config[XCSDKTokenKey]);
    AFHTTPSessionManager *manager = [self getManagerUrl:mainUrl withConfig:config];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取广告responseObject=%@", responseObject);
        if (handler) {
            if([responseObject[@"code"] intValue] == 200) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(responseObject, nil);
                });
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(nil, XCError([responseObject[@"code"] intValue], responseObject[@"msg"]));
                });
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, error);
        });
    }];
}

+ (void)queryAnchorList:(NSDictionary<NSString *, id> *_Nonnull)config
                handler:(void(^)(NSArray<NSDictionary<NSString*, NSString *> *> *_Nullable resp, NSError *_Nullable error))handler {
    if (config == nil || ((NSString *)config[XCSDKMainUrlKey]).length == 0 || ((NSString *)config[XCSDKTokenKey]).length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, XCError(-1, @"config error"));
        });
        return;
    }
    /*
     http://dev.m.xc.com/ai/mobile/game/anchorLiveList?groupId=1&gameType=&page=1&pageSize=40&rbType=&videoType=1&hideSame=false
     */
    // 主播直播
//    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/game/anchorLiveList?groupId=2&gameType=&page=1&pageSize=40&rbType=1&videoType=1&hideSame=false", config[XCSDKMainUrlKey]];
    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/game/anchorLiveList?groupId=1&gameType=&page=1&pageSize=40&rbType=&videoType=1&hideSame=false", config[XCSDKMainUrlKey]];
    AFHTTPSessionManager *manager = [self getManagerUrl:config[XCSDKMainUrlKey] withConfig:config];
    NSLog(@"获取主播列表：mainUrl=%@, token=%@", config[XCSDKMainUrlKey], config[XCSDKTokenKey]);
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取主播列表：responseObject=%@", responseObject);
        if (handler) {
            if([responseObject[@"code"] intValue] == 200) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSArray<NSDictionary *> *list = responseObject[@"data"][@"list"];
                    NSMutableArray<NSDictionary *> *anchors = [NSMutableArray array];
                    for (NSDictionary *anchor in list) {
                        [anchors addObject:@{XCSDKGidmKey : anchor[XCSDKGidmKey], XCSDKAnchorIdKey : anchor[XCSDKAnchorIdKey]}];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (handler) handler(anchors, nil);
                    });
                });
                
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(nil, XCError([responseObject[@"code"] intValue], responseObject[@"msg"]));
                });
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, error);
        });
    }];
}

+ (void)queryQuickLogin:(XCSDKConfigType)type handler:(void(^)(NSDictionary *_Nullable resp, NSError *_Nullable error))handler {
    if (XCSDKConfigMax < type || type < XCSDKConfigMin) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, XCError(-1, @"type error"));
        });
        return;
    }
    NSDictionary *config = [self xc_urls][@(type)];
    NSString *mainUrl = config[XCSDKMainUrlKey];
    //mainUrl = @"http://192.168.20.38:9901"; 
    AFHTTPSessionManager *manager = [self getManagerWithMainUrl:mainUrl];
    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/loginTemp", mainUrl];
    [manager POST:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"快捷登录-responseObject=%@", responseObject);
        if (handler) {
            /*
             {
                 code = 200;
                 data =     {
                     loginName = AITest279454;
                     passWord = AIPwd396263;
                     playerId = 192b2688dd3025aca76e27e9a163ae1d;
                     token = 2d70c4f662f44898aee3288fe387c8b7;
                 };
                 msg = SUCCESS;
                 systemTime = 1633749787598;
             }
             */
            if([responseObject[@"code"] intValue] == 200) {
                NSMutableDictionary *resp = [NSMutableDictionary dictionaryWithDictionary:responseObject];
                [resp setObject:config forKey:@"config"];
                
                if(type == XCSDKConfigGJ || type == XCSDKConfigPre) {
                    [self queryMerchantAccessType:@{XCSDKMainUrlKey : mainUrl, XCSDKTokenKey : responseObject[@"data"][@"token"]} handler:^(NSNumber * _Nullable sourceType, NSError * _Nullable error) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [resp setObject:sourceType ?: kDefaultSourceType forKey:kSourceType];
                            if (handler) handler(resp, nil);
                        });
                    }];
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (handler) handler(resp, nil);
                    });
                }
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(nil, XCError([responseObject[@"code"] intValue], responseObject[@"msg"]));
                });
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, error);
        });
    }];
}


/// 获取商户访问类型
/// @param config 至少包含XCSDKMainUrlKey和XCSDKTokenKey的值
/// @param handler 请求结果(商户接入类型：ai-1、小金-3)
+ (void)queryMerchantAccessType:(NSDictionary<NSString *, id> *_Nonnull)config
                        handler:(void(^)(NSNumber *_Nullable sourceType, NSError *_Nullable error))handler {
    NSString *url = [NSString stringWithFormat:@"%@/ai/mobile/merchantAccountServer/api/c/getCMerAccessType", config[XCSDKMainUrlKey]];
    AFHTTPSessionManager *manager = [self getManagerUrl:config[XCSDKMainUrlKey] withConfig:config];
    NSLog(@"商户访问类型：mainUrl=%@, token=%@", config[XCSDKMainUrlKey], config[XCSDKTokenKey]);
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"商户访问类型：responseObject=%@", responseObject);
        if (handler) {
            if([responseObject[@"code"] intValue] == 200) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    id type = responseObject[@"data"][kSourceType];
                    NSLog(@"%@=%@", kSourceType, type);
//                    NSInteger type  = [[(NSDictionary *)responseObject objectForKey:@"data"] objectForKey:@"sourceType"];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (handler) handler(type, nil);
                    });
                });
                
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handler) handler(nil, XCError([responseObject[@"code"] intValue], responseObject[@"msg"]));
                });
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (handler) handler(nil, error);
        });
    }];
}


+ (AFHTTPSessionManager *)getManagerWithMainUrl:(NSString *)mainUrl {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager.requestSerializer setValue:token ?: @"" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:mainUrl?:@"http://dev.m.xc.com/" forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"4" forHTTPHeaderField:@"terType"];
    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"wid"];
    [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"lang"];
    [manager.requestSerializer setValue:@"0" forHTTPHeaderField:@"groupId"];
    [manager.requestSerializer setValue:@"3.12" forHTTPHeaderField:@"apiVer"];
    [manager.requestSerializer setValue:@"3.15.2" forHTTPHeaderField:@"sdkVer"];
    [manager.requestSerializer setValue:@"Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.25 Mobile Safari/537.36" forHTTPHeaderField:@"User-Agent"];
    manager.requestSerializer.timeoutInterval = 10.f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json", @"text/json", @"text/javascript", @"text/plain"]];
    
    return manager;
}

+ (AFHTTPSessionManager *)getManagerUrl:(NSString *)url withConfig:(NSDictionary *)config{
    AFHTTPSessionManager *manager = [XCSDKUtils getManagerWithMainUrl:url];
    NSString *token = config[XCSDKTokenKey];
    if (token.length > 0) {
        [manager.requestSerializer setValue:token forHTTPHeaderField:XCSDKTokenKey];
    }
    return manager;
}

+ (NSDictionary *)xc_urls {
    return @{
        // thai
        @(XCSDKConfigThai) : @{
            XCSDKImUrlKey : @"ws://cn2.tm.aisports.io",
            XCSDKImgUrlKey : @"http://img.aisports.io",
            XCSDKMainUrlKey : @"http://cn2.tm.aisports.io",
        },
        // vietnam
        @(XCSDKConfigVietnam) : @{
            XCSDKImUrlKey : @"ws://cn2.vm.aisports.io",
            XCSDKImgUrlKey : @"http://img.aisports.io",
            XCSDKMainUrlKey : @"http://cn2.vm.aisports.io",
        },
        // Thai-DEV-Yc365d
        @(XCSDKConfigThaiDevYc365d) : @{
            XCSDKImUrlKey : @"ws://dev.m106.yc365d.com",
            XCSDKImgUrlKey : @"http://dev.img.yc365d.com",
            XCSDKMainUrlKey : @"http://dev.m106.yc365d.com",
        },
        // Vietnam-DEV-Yc365d
        @(XCSDKConfigVietnamDevYc365d) : @{
            XCSDKImUrlKey : @"ws://dev.m107.yc365d.com",
            XCSDKImgUrlKey : @"http://dev.img.yc365d.com",
            XCSDKMainUrlKey : @"http://dev.m107.yc365d.com",
        },
        // 商户接入
        @(XCSDKConfigMerchant) : @{
            XCSDKImUrlKey : @"ws://mx01m.aisport.io",
            XCSDKImgUrlKey : @"http://img.aisport.io",
            XCSDKMainUrlKey : @"http://mx01m.aisport.io",
        },
        // dev
        @(XCSDKConfigDev) : @{
            XCSDKImUrlKey : @"ws://dev.m.xc.com",
            XCSDKImgUrlKey : @"http://dev.img.xc.com",
            XCSDKMainUrlKey : @"http://dev.m.xc.com",
        },
        // 小金
        @(XCSDKConfigXJ) : @{
            XCSDKImUrlKey : @"ws://dev.h605.yc365d.com",
            XCSDKImgUrlKey : @"http://dev.img.yc365d.com",
            XCSDKMainUrlKey : @"http://dev.h605.yc365d.com",
        },
        // 内网yxtx网络DEV
        @(XCSDKConfigYC365) : @{
            XCSDKImUrlKey : @"ws://dev.m.yc365d.com",
            XCSDKImgUrlKey : @"http://dev.img.yc365d.com",
            XCSDKMainUrlKey : @"http://dev.m.yc365d.com",
        },
        // cn2-xc
        @(XCSDKConfigCn2XC) : @{
            XCSDKImUrlKey : @"ws://cn2.m.xcspt.com",
            XCSDKImgUrlKey : @"http://img.xcspt.com",
            XCSDKMainUrlKey : @"http://cn2.m.xcspt.com",
        },
        // lt
        @(XCSDKConfigUAT) : @{
            XCSDKImUrlKey : @"ws://m.lt3389.com",
            XCSDKImgUrlKey : @"http://img.lt3389.com",
            XCSDKMainUrlKey : @"http://m.lt3389.com",
        },
        // pre QJ
        @(XCSDKConfigPre) : @{
            XCSDKImUrlKey : @"ws://m.juxiangbaojie.com",
            XCSDKImgUrlKey : @"https://img.juxiangbaojie.com",
            XCSDKMainUrlKey : @"https://m.juxiangbaojie.com",
        },
        // cn2
        @(XCSDKConfigCn2) : @{
            XCSDKImUrlKey : @"ws://cn2.m.aisports.io",
            XCSDKImgUrlKey : @"http://cn2.img.aisports.io",
            XCSDKMainUrlKey : @"http://cn2.m.aisports.io",
        },
        // cn3
        @(XCSDKConfigCn3) : @{
            XCSDKImUrlKey : @"ws://nc.m.aisport.io",
            XCSDKImgUrlKey : @"http://nc.img.aisport.io",
            XCSDKMainUrlKey : @"http://nc.m.aisport.io",
        },
        // BetaFat
        @(XCSDKConfigBetaFat) : @{
            XCSDKImUrlKey : @"ws://beta-fat.m.xc.com",
            XCSDKImgUrlKey : @"http://beta-fat.img.xc.com",
            XCSDKMainUrlKey : @"http://beta-fat.m.xc.com",
        },
        // Fat
        @(XCSDKConfigFat) : @{
            XCSDKImUrlKey : @"ws://fat.m.xc.com",
            XCSDKImgUrlKey : @"http://fat.img.xc.com",
            XCSDKMainUrlKey : @"http://fat.m.xc.com",
        },
        //GJ
        @(XCSDKConfigGJ) : @{
            XCSDKImUrlKey : @"ws://m.aiguoji888.com",
            XCSDKImgUrlKey : @"https://img.aiguoji888.com",
            XCSDKMainUrlKey : @"https://m.aiguoji888.com",
        },
        //MX
        @(XCSDKConfigB1) : @{
            XCSDKImUrlKey : @"ws:mxq01m.dolahuo.com",
            XCSDKImgUrlKey : @"https://img.mayidaojia321.com",
            XCSDKMainUrlKey : @"https://mxq01m.dolahuo.com",
        },
        //XZ
        @(XCSDKConfigXZ) : @{
            XCSDKImUrlKey : @"ws://dev.m.xz.com",
            XCSDKImgUrlKey : @"http://dev.img.xz.com",
            XCSDKMainUrlKey : @"http://dev.m.xz.com",
        },
        //YP
        @(XCSDKConfigYP) : @{
            XCSDKImUrlKey : @"ws://m.yipinbeier.com",
            XCSDKImgUrlKey : @"https://img.yipinbeier.com",
            XCSDKMainUrlKey : @"https://m.yipinbeier.com",
        },
    };
}
#pragma mark - JSON Kit
+ (NSString *)jsonFromContain:(id)contain {
    if (![NSJSONSerialization isValidJSONObject:contain]) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:contain options:NSJSONWritingPrettyPrinted error:&error];
    if (!data || error) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark - Valid

+ (BOOL)checkURL:(NSString *)url {
    if(url == nil) return false;
    return url.length != 0 && ([url hasPrefix:@"http"] || [url hasPrefix:@"https"]);
}

+ (BOOL)checkStr:(NSString *)str {
    return str != nil && str.length != 0;
}


#pragma mark - device
+ (BOOL)hasLiuHai {
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneX;
    }
    if (@available(iOS 11.0, *)) {
        if (kXCKeyWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}

#pragma mark - cryptor
+ (NSString *)md5:(NSString *)str {
    if (str.length == 0) {
        return @"";
    }
    
    const char *value = [str UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    }
    
    return outputString;
}
@end
