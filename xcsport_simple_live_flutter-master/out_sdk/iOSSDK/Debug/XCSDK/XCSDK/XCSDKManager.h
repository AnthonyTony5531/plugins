//
//  XCSDKManager.h
//  iOSSDKSample
//
//  Created by eric on 2019/12/14.
//  Copyright © 2019 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UINavigationController, UIViewController, UITabBarController;

/* ------ SDK类型值 ------ */
#define kXCSDKTypeIcon  @"sdk_default" // ICON版-默认
#define kXCSDKTypeTab   @"sdk_Inline" // TAB版

/* ------ App类型值 ------ */
#define kXCAppTypeAi    @"ai" // 默认 ai
#define kXCAppTypeGbet  @"Gbet" // Gbet
#define kXCAppTypeVM    @"vmSports" // 虚拟体育
#define kXCAppType365   @"bet365" // 365 暂不支持

NS_ASSUME_NONNULL_BEGIN

#pragma mark - SDK配置相关key
/* ------ 必传配置项相关key ------ */
FOUNDATION_EXPORT NSString * const XCSDKMainUrlKey; ///< App主域名
FOUNDATION_EXPORT NSString * const XCSDKImgUrlKey; ///< App资源域名
FOUNDATION_EXPORT NSString * const XCSDKImUrlKey; ///< App推送服务域名
FOUNDATION_EXPORT NSString * const XCSDKTokenKey; ///< App登录token
FOUNDATION_EXPORT NSString * const XCSDKTypeKey; ///< sdk类型(iOS-内部隐式传入无需再传，安卓-必须显式传入)  ICON版：sdk_default，TAB版：sdk_Inline

FOUNDATION_EXPORT NSString * const XCSDKAppTypeKey; ///< app类型，AI体育页面：ai，Gbet页面：isGbet

FOUNDATION_EXPORT NSString * const XCSDKListStyleKey; ///< 列表样式 不传/空-手动设置 laoniao-老鸟，concise-清爽，xiaobai-小白
/* ------ 跳详情/主播直播页必传配置项相关key ------ */
FOUNDATION_EXPORT NSString * const XCSDKGidmKey; ///< 赛事id-跳比赛必传
FOUNDATION_EXPORT NSString * const XCSDKAnchorIdKey; ///< 主播id，如有需跳主播，此项与XCSDKGidmKey都为必传
FOUNDATION_EXPORT NSString * const XCSDKSportPlatformKey; ///< 数据源类型(可传1，2)，默认1，非必传

/* ------ 非必传配置项相关key ------ */
FOUNDATION_EXPORT NSString * const XCSDKLaunchTitleKey; ///< 游戏启动/加载页 标题
FOUNDATION_EXPORT NSString * const XCSDKLaunchSubTitlesKey; ///< 游戏启动/加载页 副标题

FOUNDATION_EXPORT NSString * const XCSDKVideoUrlKey; ///< 小视频域名
FOUNDATION_EXPORT NSString * const XCSDKPageIdKey; ///< 展示当页面的pageId
FOUNDATION_EXPORT NSString * const XCSDKHandledSysRepairKey; ///< 传YES-屏蔽SDK内部处理，商户需自己处理系统维护，传NO或不传-SDK内部处理
FOUNDATION_EXPORT NSString * const XCSDKHandledTimeoutKey; ///< ICON版：传YES-屏蔽SDK内部处理，商户需重新获取token然后回传给SDK， 传NO或不传-使用SDK内部处理； TAB版：忽略此值

FOUNDATION_EXPORT NSString * const XCSDKMerchantIdKey; ///< 商户ID
FOUNDATION_EXPORT NSString * const XCSDKShowRechargeKey; ///< 展示充值
FOUNDATION_EXPORT NSString * const XCSDKShowCashKey; ///< 展示提现
FOUNDATION_EXPORT NSString * const XCSDKShowTransferKey; ///< 展示转账

FOUNDATION_EXPORT NSString * const XCSDKShowTabbarOnLoadingKey; ///< 启动页/资源加载页是否遮住底部Tabbar（仅TAB版有效）【yes/true/1-不遮住，no/false/0-遮住，默认遮住】
FOUNDATION_EXPORT NSString * const XCSDKMainPageIndexKey; ///< 启动页/资源加载页不遮住底部Tabbar（仅TAB版有效） mainPage的索引【默认为2，仅iOS端使用】

FOUNDATION_EXPORT NSString * const XCSDKHidesBottomBarWhenPushedKey; ///< 0-NO，1-YES；仅Icon版有效，功能同hidesBottomBarWhenPushed

FOUNDATION_EXPORT NSString * const XCSDKUmAppKey; ///< 友盟AppKey
FOUNDATION_EXPORT NSString * const XCSDKUmChannel; ///< 友盟channel
FOUNDATION_EXPORT NSString * const XCSDKUseInnerUmAppKey; ///< YES/1-启用SDK内部友盟AppKey，no/0-不启用内部友盟，默认不启用

#pragma mark - SDK与App交互方法key
FOUNDATION_EXPORT NSString * const XCAppMethodDownloadProgress; ///< 下载资源进度(通过"progress"获取进度，isDownloadEnd获取是否下载完成)-仅TAB版有效
FOUNDATION_EXPORT NSString * const XCAppMethodLoadAssetsError; ///< 资源包下载异常-弹框
FOUNDATION_EXPORT NSString * const XCAppMethodRetryAlert; ///< 资源包下载失败-弹框操作(通过"index"获取弹框按钮索引)

FOUNDATION_EXPORT NSString * const XCAppMethodBalanceChanged; ///< 余额已变化(通过"value"key获取余额)
FOUNDATION_EXPORT NSString * const XCAppMethodCashOut; ///< 提现
FOUNDATION_EXPORT NSString * const XCAppMethodRecharge; ///< 充值
FOUNDATION_EXPORT NSString * const XCAppMethodTransfer; ///< 转账

FOUNDATION_EXPORT NSString * const XCAppMethodExitSDK; ///< 退出SDK-仅ICON版有效
FOUNDATION_EXPORT NSString * const XCAppMethodShowBottomBar; ///< 显示底部栏-仅TAB有效
FOUNDATION_EXPORT NSString * const XCAppMethodHideBottomBar; ///< 隐藏底部栏-仅TAB有效

FOUNDATION_EXPORT NSString * const XCAppMethodTokenTimeout; ///< token已失效(仅TAB版有效，ICON版为弹框告知用户)
FOUNDATION_EXPORT NSString * const XCAppMethodSystemRepair; ///< 系统维护-会回调多次(通过code/msg/whTime key获取相关信息)

FOUNDATION_EXPORT NSString * const XCAppMethodViewWillAppear; ///< 视图即将展示
FOUNDATION_EXPORT NSString * const XCAppMethodViewDidAppear; ///< 视图已展示
FOUNDATION_EXPORT NSString * const XCAppMethodViewWillDisappear; ///< 视图即将消失
FOUNDATION_EXPORT NSString * const XCAppMethodViewDidDisappear; ///< 视图已消失

FOUNDATION_EXPORT NSString * const XCAppMethodCanAutorotate; ///< 是否支持横竖屏转屏（通过autorotate获取相关信息）

FOUNDATION_EXPORT NSString * const XCAppMethodDidEnterSDK; ///< ICON版-已进入SDK

FOUNDATION_EXPORT NSString * const XCAppMethodNeedLogin; ///< 匿名登录-触发登录

FOUNDATION_EXPORT NSString * const XCAPPMethodLangChanged; /// <切换语言>

/* ------ ICON版 边缘侧滑 ------ */
/// 使能侧滑边沿返回【通过canEdgePopGesture获取是否是能边缘侧滑出SDK-仅ICON版iOS有效，安卓无效！！！】
FOUNDATION_EXPORT NSString * const XCAppMethodEdgePopGesture DEPRECATED_MSG_ATTRIBUTE("已废弃，回调中不再有此方法名的回调");

FOUNDATION_EXPORT NSString * const XCSDKEdgePopGestureNotification; ///< 使能侧滑边沿返回通知【仅ICON版的iOS有效，安卓无效！！！】

#define kLaunchTitleViewH   110

/// SDK启动标题(默认值)
#define kLaunchTitle        @"AI体育"
#define kLaunchTitleGbet    @"Gbet"
#define kLaunchTitleVM      @"虚拟体育"
#define kLaunchTitle365     @"Bet365"

/// SDK启动子标题列表(默认值)
//#define kLaunchSubTitles    @[\
    @"添加喜爱的比赛，不错过每一次的精彩！",\
    @"冰淇淋化了就回不来了，喜爱的比赛也是",\
    @"努力爬上排行榜，让大家见证你的荣光吧！",\
    @"独乐乐不如众乐乐，呼朋唤友一起来玩！",\
    @"给自己一个小目标，先赢他一个亿！",\
    @"比赛详情页右滑进入聊天室，大神陪你一起看球！",\
    @"你还记得儿时的梦想吗？",\
    @"适度游戏益脑，沉迷游戏伤身",\
    @"比赛详情页上下滑可以切换比赛"]
#define kLaunchSubTitles    @[\
    @"Add favorite games, don’t miss every excitement！",\
    @"Once the ice cream is melted, you can’t come back, and so are your favorite games",\
    @"Work hard to climb the rankings and let everyone witness your glory！",\
    @"To be happy alone is not as good as the others, to call friends and friends to play together！",\
    @"Give yourself a small goal, first win him 100 million！",\
    @"Swipe right on the game details page to enter the chat room, and the great god will watch the game with you！",\
    @"Do you remember your childhood dream？",\
    @"Moderate game benefits the brain, addicted to the game beverages",\
    @"Scroll up and down on the match details page to switch matches"]
/* ------ error code ------ */
typedef enum : NSInteger {
    XCErrorCode_naviVCError = -6001, ///< 根控制器为空或类型不对
    XCErrorCode_configError = -7001, ///< 配置信息不全
    XCErrorCode_orderError = -8001, ///< 顺序不对
} XCErrorCode;

/* ------ SDK回调宿主App ------ */
/// SDK回调宿主App block
/// @param method SDK回调宿主App对应方法key
/// @param params SDK回调给宿主App的参数
typedef void(^XCSDKHandler)(NSString * _Nonnull method, NSDictionary<NSString *, id> *_Nullable params);


@interface XCSDKManager : NSObject

#pragma mark - ICON版SDK
/// 启动SDK(配置商户信息、设置回调)-即将废弃
/// @param sdkConfig SDK相关配置
/// @param naviVC 宿主App导航控制器，做为SDK导航根控制器(SDK内部仅弱引用)
/// @param error 配置错误信息
/// @param handler SDK事件回调
+ (void)openSDKWithConfig:(NSDictionary<NSString *,  id> *_Nonnull)sdkConfig
                   naviVC:(UINavigationController *_Nonnull)naviVC
                    error:(NSError *__autoreleasing *)error
                  handler:(XCSDKHandler)handler __attribute__((deprecated("Use openIconSdk:naviVC:configError:handler: instead.")));

/// 启动SDK(配置商户信息、设置回调)
/// @param sdkConfig SDK相关配置
/// @param naviVC 宿主App导航控制器，SDK导航根控制器(SDK内部仅弱引用)
/// @param configError 配置错误信息
/// @param handler SDK事件回调
+ (void)openIconSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
             naviVC:(UINavigationController *_Nonnull)naviVC
        configError:(NSError *__autoreleasing *)configError
            handler:(XCSDKHandler)handler;


#pragma mark - TAB版SDK
/// 配置SDK信息(返回值：NO-配置失败，YES-配置成功)-即将废弃
/// @param sdkConfig SDK配置配置信息
/// @param tabbarVC 宿主App tabbarVC(SDK内部仅弱引用)
/// @param error 配置错误信息
/// @param handler  SDK回调
+ (BOOL)configSDK:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
         tabbarVC:(UITabBarController *_Nonnull)tabbarVC
            error:(NSError *__autoreleasing *)error
          handler:(XCSDKHandler)handler __attribute__((deprecated("Use configTabSdk:tabbarVC:configError:handler: instead.")));

/// 配置SDK信息(返回值：NO-配置失败，YES-配置成功)
/// @param sdkConfig SDK配置配置信息
/// @param tabbarVC 宿主App tabbarVC(SDK内部仅弱引用)
/// @param configError 配置错误信息
/// @param handler  SDK回调
+ (BOOL)configTabSdk:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
            tabbarVC:(UITabBarController *_Nonnull)tabbarVC
         configError:(NSError *__autoreleasing *)configError
             handler:(XCSDKHandler)handler;

/// TAB版-获取SDK主页面【在tabbar中默认索引为2，如不是请在配置通过XCSDKMainPageIndexKey设定】
+ (UIViewController *_Nullable)mainPage;

/// TAB版--获取SDK投注记录页面
+ (UIViewController * _Nullable)betPage;

/// TAB版-获取页面ID列表
+ (NSArray<NSString *> *_Nullable)pageIds;

/// TAB版-释放页面
/// @param pageIds nil-释放所有页面，非nil-释放指定页面如：@"mainPage"/@"memberBettingPage"
+ (void)destroyByPageIds:(NSArray<NSString *> *_Nullable)pageIds;

/// TAB版-更新Token
/// @param token 新token
+ (void)updateToken:(NSString *_Nonnull)token;

///  TAB版-选择底部栏索引-通知页面刷新
+ (void)selectBottomItemIndex:(NSInteger)selectIndex;

#pragma mark - 展示详情页
/// 展示详情页(传主播id展示主播直播)
/// @param sdkConfig SDK与主播配置信息
/// @param naviVC 宿主App导航控制器，做为SDK导航根控制器(SDK内部仅弱引用)
/// @param configError 配置错误信息
/// @param handler  SDK回调
+ (void)showDetailPage:(NSDictionary<NSString *, id> *_Nonnull)sdkConfig
                naviVC:(UINavigationController *_Nonnull)naviVC
           configError:(NSError *__autoreleasing *)configError
               handler:(XCSDKHandler)handler;

#pragma mark - 视频暂停/播放
/// 暂停视频
+ (void)pauseVideo;

/// 播放视频
+ (void)startVideo;

#pragma mark - 语言切换
+ (void)onLangChange:(NSString *_Nonnull)lang;
#pragma mark - Common
/// 查看SDK版本号
+ (NSString *_Nonnull)sdkVersion;
@end

NS_ASSUME_NONNULL_END
