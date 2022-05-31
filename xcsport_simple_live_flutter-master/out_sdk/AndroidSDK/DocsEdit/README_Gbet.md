# Gbet体育SDK Android接入文档


| 更改日期 | 版本 |更改人|版本说明|审核人|
|:------|:------:|:------:|:--------|:---:|
| 2019-11-01 | 1.0.0V1 | Sam | 创建，引入sdk体验版|-|
| 2019-11-15 | 1.1.0V1 | Sam | 1.1需求相关|-|
| 2019-11-22 | 1.1.1V1 | Sam | 修改接入方式、Bug fixed|-|
| 2019-12-06 | 1.1.2V1 | Sam | 新增配置信息、Bug fixed| abraham |
| 2019-12-13 | 1.1.3V1 | Sam | 优化接入流程、Bug fixed| abraham |
| 2019-12-20 | 1.2.0V1 | Sam | 1.2需求相关、Bug fixed| alice/tab/abraham |
| 2019-12-27 | 1.2.1V1 | Sam | 1.2需求相关、Bug fixed| abraham |
| 2020-01-03 | 1.3.0V1 | Sam | 新增1.3版本功能与相关配置<br>Bug fixed|isco|
| 2020-01-04 | 1.3.0V2 | Sam | 验收1.3 SDK版本|eruka|
| 2020-02-29 | 1.5.1 | Sam | 新增1.5.1需求|luton|
| 2020-07-29 | 3.1.0 | Sam | 新增3.1.0需求|Sam|
| 2020-08-20 | 3.2.0 | Sam | 新增支持tab方式,使用fragment|luton|
| 2020-09-23 | 3.2.1 | Sam | 新增启动页加载事件,启动页可自定义|bill|
| 2020-10-28 | 3.4.0 | Sam | 1.新增余额变化通知 </br>2.修复已知bug|luton|
| 2020-10-30 | 3.4.0 | Sam |新增接入注意事项| luton|
| 2020-10-31 | 3.4.0 | Sam |新增主界面使用ViewPage2接入demo演示| luton|
| 2020-11-13 | 3.5.0 | wilson |新增运维503通知 & Token失效通知及更新事件| luton|
| 2020-11-16 | 3.5.0 | wilson |新增视图控制器⽣命周期⽅法说明| luton|
| 2020-12-02 | 3.6.0 | wilson |增加系统维护处理、Token超时处理参数| luton|
| 2020-12-02 | 3.6.0 | wilson |动画播放对环境要求| luton|
| 2021-01-05 | 3.7.0 | wilson |增加开屏广告标题参数| luton|
| 2021-01-11 | 3.7.0 | wilson |1.新增提前结算功能<br>2.优化比赛详情页性能<br>3.优化赔率点水交互效果<br>4.优化列表盘口开关盘及时性<br>5.修复已知bug<br>| luton|
| 2021-01-20 | 3.7.0 | wilson |网络性能指标采集| luton|
| 2021-02-05 | 3.8.0 | wilson |1.Tab版新增配置<br>2.修复已知bug，增强系统稳定性<br> |luton |
| 2021-03-12 | 3.8.5V1 | wilson |1.优化提前结算功能，提升结算成功率。<br>2.修复系统维护时，页面显示错误问题。<br>3.修复已知问题<br> |luton |
| 2021-03-31 | 3.8.5V2 | wilson |1.增加调起sdk入参sdkType说明    |luton |
| 2021-04-06 | 3.9.0 | wilson |1.增加调起sdk入参renderMode,ui渲染模式设置及说明    |luton |
| 2021-04-25 | 3.10.0 | wilson | 3.10.0需求 |luton |
| 2021-05-27 | 3.10.2 | wilson | 3.10.2需求 |luton |
| 2021-06-09 | 3.12.0 | wilson | 3.12.0需求 |luton |
| 2021-06-10 | 3.12.1 | wilson | 3.12.1需求 |luton |
| 2021-06-12 | 3.12.2 | wilson | 3.12.2需求 |luton |
| 2021-06-13 | 3.12.3 | wilson | 3.12.3需求 |luton |
| 2021-06-23 | 3.12.4 | wilson | 3.12.4需求 |luton |
| 2021-08-18 | 3.13.0 | wilson | 3.13.0需求 |luton |
| 2021-09-07 | 3.13.1 | wilson | 3.13.1需求 |luton |
| 2021-10-18 | 3.14.6 | wilson | 3.14.6需求 |luton |
| 2021-11-29 | 3.16.0 | Sam |1.添加匿名登陆  |luton |


## 目录
> #### [一、接入准备](#start)
>> ##### [1、环境与兼容性](#start1)
>> ##### [2、SDK引入](#start2)
>> ##### [3、工程配置](#start3)
>> ##### [4、获取AppID/App Key/商户ID](#start4)
>>> ###### [4.1、获取AppID/App Key/商户ID] (#start4.1)
>>> ###### [4.2、接入文档/SDK/Demo] (#start4.2)

> #### [二、 SDK接口说明](#info)
>>> ##### [2.1 获取FastAiManagerProxy实例 ] (#init)
>>> ##### [2.2 拉起SDK APP ] (#launchApp)
>>> ##### [2.3 订阅SDK事件以及取消 ] (#addListener)
>>> ##### [2.4 事件说明 ] (#event)
>>>> ###### [2.4.1.SDK关闭通知 ] (#event_4)
>>>> ###### [2.4.2.隐藏底底部栏目通知 ] (#event_6)
>>>> ###### [2.4.3.显示底部栏目通知 ] (#event_7)
>>>> ###### [2.4.4.运维503通知 ] (#event_9)
>>>> ###### [2.4.5.Token失效通知 ] (#event_10)
>>>> ###### [2.4.6.向SDK更新Token事件 ] (#event_11)
>>>> ###### [2.4.7.需要登陆通知 ] (#event_12)
>>> ##### [2.5 生命周期说明 ] (#life_cycle)
>>>> ###### [2.5.1.视图即将展示 ] (#life_cycle_1)
>>>> ###### [2.5.2.视图已经展示 ] (#life_cycle_2)
>>>> ###### [2.5.3.视图即将消失 ] (#life_cycle_3)
>>>> ###### [2.5.4.视图已经消失 ] (#life_cycle_4)
>>> ##### [2.7 Tab版新特性 ] (#tab_sdk_new_feature)
>>>> ###### [2.7.1.Tab SDK启动是否展示底部TabBar ] (#tab_sdk_new_feature_show_tab_bar_on_load)

> #### [三、查看SDK版本](#version)
> #### [四、支持tab方式接入,使用Fragment](#fragment)
>>> ###### [4.1、创建赛事主页面Fragment] (#mainPage)
>>> ###### [4.2、创建投注记录Fragment] (#betlist)
>>> ###### [4.3、返回键管理] (#fragmentBack)

> #### [五、接入TabSdk启动底部导航栏的隐藏和显示容器](#laucher_nav)
>>> ###### [5.1、接入TabSdk加载启动页] (#sdk_launcher)
>>> ###### [5.2、接入底部导航栏的隐藏和显示容器] (#sdk_nav)


> #### [六、主界面使用ViewPager2接入说明](#viewpage2)

> #### [接入注意事项](#notice)

> #### [七、动画播放对环境要求](#AnimationPlayEnv)

> #### [八、网络性能指标采集](#NetworkIndex)

> #### [九、Release Apk包闪退](#apkAbort)

>

### 一、<span id="start" >接入准备步骤</span>
> #### <span id="start1" >1、环境与兼容性</span>
>>###### 开发工具：Android Studio 3.4, Android Studio 3.5(推荐)
>>>###### 兼容性：1.1. Android SDK最小仅支持17以上
```gradle
android{
    //...
    defaultConfig {
        minSdkVersion 17
        //...
    }
}
```
>>>###### 1.2.CPU架构只支持armeabi-v7a，armeabi-v8a，也就是说，不支持普通的x86模拟器
```gradle
android{
    //...
    defaultConfig {
        ndk{
            abiFilters "armeabi-v7a","arm64-v8a"
        }
        //...
    }
}
```



>#### <span id="start2" >2、SDK引入(module方式引入) </span>

>> 2.1、将fastailib文件夹复制到与工程文件夹同一级下

>> 2.2、在app目录下的build.gradle中，将它添加依赖到项目

```gradle
android{
   //....
   repositories {
        flatDir {
            dirs 'libs','../fastailib/libs'
        }
    }
}

dependencies {
   implementation project(':fastailib')
}
```
在项目的build.gradle文件中配置

```gradle
allprojects {
    repositories {
        //....
        flatDir {
            dirs './fastailib/libs'
        }
    }
}
```

```
文件结构如下：

├───你的开发工程
│   ├── fastailib
│   ├── app
│   ├── gradle
│   ├── build.gradle
│   │   └── ...
│   └── ...
└── ...
```

>#### <span id="start3" >3、工程配置</span>

>> 3.1.需要支持java8，必须要配置
```gradle
android{
    //...
    compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
    }
    //...
}
```
>> 3.2.如果你的SDK开发版本是27以上，需要在AndroidManifest.xml,配置android:usesCleartextTraffic="true"
如：

```xml
<application android:usesCleartextTraffic="true">

</application>
```
>> 否则， 加载网页时候，加载失败

>> 3.3.需要支持混编kotlin,需要在项目中配置声明，最好是 **1.3.50**以上

>> 3.4.如果**gradle.properties**文件没配置如下，需要确保配置androidx, R8:

```gradle
android.enableR8=true
android.useAndroidX=true
android.enableJetifier=true
```
>> 3.5.需要配置支持多个dex的打包,在你的项目的app目录的build.gradle，配置

```gradle
android{
    //...
    defaultConfig {
        //...
        multiDexEnabled true
    }
    //...
}
```

>> 3.6.如果没有满足其中任何一个项，将编译失败

### <span id="info" >二、SDK接口说明</span>

##### 对于sdk全部的交互，都由FastAiManagerProxy这个管理类托管代理实现。以下是它的API全部说明.
#### <span id="init" >2.1 获取FastAiManagerProxy实例</span>
in kotlin

```kotlin
  val instance = FastAiManagerProxy.get()
```

in java

```java
  FastAiManagerProxy instance =  FastAiManagerProxy.Companion.get();
```


#### fun init( context:Context)

> 初始化sdk，在自己的Application上.onCreate方法上初始化，使用FastAiManagerProxy的init方法，示例如

in kotlin

```kotlin
class MyApplication : Application(){
    override fun onCreate() {
        super.onCreate()
        FastAiManagerProxy.get().init(this);
    }
}
```
in java

```java
public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        FastAiManagerProxy.Companion.get().init(this);
    }
}
```


#### <span id="launchApp" >2.2 拉起SDK APP</span>


##### fun launchApp(bundle:Bundle)

> 启动sdk.通过使用这个方法来启动整个sdk.启动sdk前，需要设置相关的参数进行初始化
> 


参数名 | 参数类型 | 是否必传 | 参数说明
---|---|---|---
<font color="red">merchantAppPushPath</font> | String |<font color="red">是</font>|登录接口的merchantAppPushPath
<font color="red">webHomePagePath</font> | String |<font color="red">是</font>|登录接口的webHomePagePath
<font color="red">merchantAppImgPath</font> | String|<font color="red">是</font>| 登录接口的webHomePagePath
<font color="red">token</font> | String|<font color="red">否</font>|登录接口的token，不传为匿名登陆。
<font color="red">sdkType</font> | String|<font color="red">是</font>|sdk类型 <br><font color="red">icon-sdk版：sdk_default<br>tab-sdk版：sdk_Inline</font>
<font color="red">appType</font> | String|<font color="red">是</font>|请传Gbet
launchTitle | String | 是 | 开屏广告主标题
launchSubTitles | String[] | 否 | 开屏广告副标题
renderMode | String | 否 | ui渲染模式<br>渲染模式值：["surface","texture"]<br>默认(使用surface模式渲染)不需要设置，如果设置为texture则使用texture模式渲染

> 注：<br>

> 1.什么时候需要设置renderMode，渲染模式值surface与texture的区别：<br>
>> 通过renderMode设置可以选择使用SurfaceView或者TextureView来渲染其内容。默认配置的SurfaceView在性能上明显好于TextureView。然而，SurfaceView无法插入到Android的View层级之中。SurfaceView在视图层级中必须是最底层的View或者最顶层的View。此外，在Android N之前，SurfaceView无法用于制作动画，因为它们的布局和渲染无法和视图层级中的其它View同步。 如果上述这些用例之一在您的应用需求之中，您需要使用TextureView替换SurfaceView。要选择使用TextureView进行ui渲染，可以在启动sdk时设置renderMode为texture。


in kotlin

```kotlin
var bundle = Bundle().apply {
    putString("merchantAppPushPath","" )
    putString("webHomePagePath","" )
    putString("merchantAppImgPath","" )
    putString("merchantId","" )
    putString("token", "")
    putString("sdkType", "sdk_default" )//接入sdk类型 icon-sdk版：sdk_default  tab-sdk版：sdk_Inline
    putString("appType", "Gbet" )
    putString("launchTitle", "Gbet")//开屏广告主标题
    //putString("renderMode", "texture")//ui渲染模式，默认(使用surfaceView模式渲染)不需要设置，如果设置为texture则使用texture模式渲染
    var list : Array<String> = arrayOf("经典Gbet体验，极速畅玩",
            "生活也要多姿多彩，主题色随你切换",
            "更多好玩尽在独立版APP体验",
            "没有什么能够阻挡你追逐梦想",
            "给自己一个小目标，先赢他一个亿！",
            "你还记得儿时的梦想吗？",
            "适度游戏益脑，沉迷游戏伤身")
    putStringArray("launchSubTitles", list)//开屏广告副标题
}
FastAiManagerProxy.get().launchApp(bundle)
```
in java

```java
Bundle params = new Bundle();
params.putString("merchantAppPushPath","");
params.putString("webHomePagePath","");
params.putString("merchantAppImgPath","" );
params.putString("token", "");
params.putString("sdkType", "sdk_default");//接入sdk类型 icon-sdk版：sdk_default  tab-sdk版：sdk_Inline
params.putString("appType", "Gbet");
params.putString("launchTitle", "Gbet");
//params.putString("renderMode", "texture")//ui渲染模式，默认(使用surfaceView模式渲染)不需要设置，如果设置为texture则使用texture模式渲染
ArrayList<String> list = new ArrayList<String>();
list.add("经典Gbet体验，极速畅玩");
list.add("生活也要多姿多彩，主题色随你切换");
list.add("更多好玩尽在独立版APP体验");
list.add("没有什么能够阻挡你追逐梦想");
list.add("适度游戏益脑，沉迷游戏伤身");
params.putStringArray("launchSubTitles", list);

FastAiManagerProxy.Companion.get().launchApp(params);
```

#### <span id="addListener" >2.3 订阅SDK事件以及取消</span>

##### fun addOnEventListener(onEventListener: OnEventListener)
>订阅SDK消息事件（支持多处订阅）,这个方法将会收到所有来自SDK的执行事件，比如当用户点击转账，提现，登录失效等.示例：

in kotlin

```kotlin
//监听sdk执行的动作
var listener = object : OnEventListener {
    override fun onEvent(event: AiEvent) {
        when(event.method){
            "recharge"->{
                //响应充值
                FastAiManagerProxy.get().back(event.id, event.method)
            }
            "cash_out"->{
                //响应提现
                FastAiManagerProxy.get().back(event.id, event.method)
            }
            "exit_sdk"->{
                //响应关闭
                               }
            "transfer"->{
                //响应转账
                FastAiManagerProxy.get().back(event.id, event.method)
            }
        }
        FastAiManagerProxy.get().back(event.id, event.method)
    }
}
FastAiManagerProxy.get().addOnEventListener(listener)
```

in java

```java
OnEventListener onEventListener  = new OnEventListener(){
    @Override
    public void onEvent(@NotNull AiEvent event) {

         switch (event.getMethod()){
             case  "recharge":{
              //充值
                 break;
             }
             case  "cash_out":{
             //提现
                 break;
             }
             case  "exit_sdk":{
             //关闭
                 break;
             }
             case  "transfer":{
              //转账
                 break;
             }
         }
        FastAiManagerProxy.Companion.get().back(event.getId(), event.getMethod());
    }
};

FastAiManagerProxy.Companion.get().addOnEventListener(onEventListener);
```


##### fun removeOnEventListener(onEventListener: OnEventListener)

> 移除订阅事件。如果你当前的地方不再想接受SDK的消息，那么通过这个Api去移除取消订阅

in kotlin

```kotlin
  FastAiManagerProxy.get().removeOnEventListener(onEventListener)
```

in java

```java
  FastAiManagerProxy.Companion.get(). removeOnEventListener(onEventListener);
```



#### fun back(id: String, method: String)

> 响应SDK。SDK每次发出一个功能消息，都会在等待你的处理，直到你响应才会进行下一步。比如，用户登录失效，
需要你处理完毕你的相关信息，最后响应SDK,它才会关闭页面。

in kotlin

```kotlin
FastAiManagerProxy.get().back(event.id, event.method)
```

in java

```java
FastAiManagerProxy.Companion.get().back(event.getId(), event.getMethod());
```



#### fun sendEvent(id: String, event: String, params: Map<String, Any>?)

> 向SDK发送事件。比如，SDK token失效，重新登录获取token信息后向SDK传递新的token

in kotlin

```kotlin
FastAiManagerProxy.get().sendEvent(EventChannelId.XcSdkApiEventId, event, params)
```

in java

```java
FastAiManagerProxy.Companion.get().sendEvent(EventChannelId.XcSdkApiEventId, event, params);
```

#### <span id="event" >2.4 事件说明</span>


#### AiEvent
> SDK的通知消息事件载体。里面包含业务功能中的相关参数。以下是目前支持的业务功能


##### <span id="event_4" >2.4.1.SDK关闭通知</span>

参数 | 参数类型 | 参数说明
---|---|---
method| String |  exit_sdk
id | String | 响应结束ID（非持久化,SDK初始化后分配）
params|Map | 无

##### <span id="event_6" >2.4.2.隐藏底部栏通知</span>

参数 | 参数类型 | 参数说明
---|---|---
method| String |  hideBottomBar
id | String | 响应结束ID（非持久化,SDK初始化后分配）
params|Map | 无

##### <span id="event_7" >2.4.3.展示底部栏通知</span>

参数 | 参数类型 | 参数说明
---|---|---
method| String |  showBottomBar
id | String | 响应结束ID（非持久化,SDK初始化后分配）
params|Map | 无


##### <span id="event_9" >2.4.4.运维503通知</span>

参数 | 参数类型 | 参数说明
---|---|---
method| String |  operation_maintenance_503
id | String | 响应结束ID（非持久化,SDK初始化后分配）
params|Map | 无


##### <span id="event_10" >2.4.5.Token失效通知</span>

参数 | 参数类型 | 参数说明
---|---|---
method| String |  tokenTimeout
id | String | 响应结束ID（非持久化,SDK初始化后分配）
params|Map | 无


##### <span id="event_11" >2.4.6.向SDK更新Token事件</span>

参数 | 参数类型 | 参数说明
---|---|---
event| String |  updateSDKToken
id | String | EventChannelId.XcSdkApiEventId
params|Map | 如：{token="KDLFDKLKJFLKFLD..."}

##### <span id="event_12" >2.4.7.需要登陆通知</span>

参数 | 参数类型 | 参数说明
---|---|---
event| String |  needLogin
id | String | EventChannelId.XcSdkApiEventId
params|Map | 如：{isAnonymous=false}, isAnonymous 为true时候，当前是匿名登陆访问sdk



#### <span id="life_cycle" >2.5 生命周期说明</span>

> 重写Activity或Fragment的生命周期即可

##### <span id="life_cycle_1" >2.5.1.视图即将展示</span>

```kotlin
//重写onStart
override fun onStart() {
    super.onStart()
}
```

##### <span id="life_cycle_2" >2.5.2.视图已经展示</span>

```kotlin
//重写onResume
override fun onResume() {
    super.onResume()
}
```


##### <span id="life_cycle_3" >2.5.3.视图即将消失</span>

```kotlin
//重写onPause
override fun onPause() {
    super.onPause()
}
```
##### <span id="life_cycle_4" >2.5.4.视图已经消失</span>

```kotlin
//重写onDestroy
override fun onDestroy() {
    super.onDestroy()
}
```


参数名 | 参数类型 | 是否必传 | 参数说明
---|---|---|---
merchantAppPushPath | String |<font color="red">是</font>|登录接口的merchantAppPushPath
webHomePagePath | String |<font color="red">是</font>|登录接口的webHomePagePath
merchantAppImgPath | String|<font color="red">是</font>| 登录接口的webHomePagePath
token | String|<font color="red">否</font>|登录接口的token， 不传时候为匿名登陆
sdkType | String|<font color="red">是</font>|接入sdk类型 icon-sdk版：sdk_default(默认); tab-sdk版：sdk_Inline
<font color="red">appType</font> | String|<font color="red">是</font>|请传Gbet
launchTitle | String | 是 | 开屏主标题
launchSubTitles | String[] | 否 | 开屏副标题

in kotlin{}

```kotlin
var bundle = Bundle().apply {
  putString("merchantAppPushPath","" )
  putString("webHomePagePath","" )
  putString("merchantAppImgPath","" )
  putString("token", "")
  putString("sdkType", "sdk_default" )
  putString("appType", "Gbet" )
 
  putString("launchTitle", "Gbet")//开屏广告主标题
  var list : Array<String> = arrayOf("经典Gbet体验，极速畅玩",
            "生活也要多姿多彩，主题色随你切换",
            "更多好玩尽在独立版APP体验",
            "没有什么能够阻挡你追逐梦想",
            "给自己一个小目标，先赢他一个亿！",
            "你还记得儿时的梦想吗？","适度游戏益脑，沉迷游戏伤身")
  putStringArray("launchSubTitles", list)//开屏广告副标题     
}
FastAiManagerProxy.get().launchApp(bundle)
```
in java

```java
Bundle params = new Bundle();
params.putString("merchantAppPushPath","");
params.putString("webHomePagePath","");
params.putString("merchantAppImgPath","" );
params.putString("token", "");
params.putString("sdkType", "sdk_default");
params.putString("appType", "Gbet");
params.putString("launchTitle", "Gbet体育");
ArrayList<String> list = new ArrayList<String>();
list.add("经典Gbet体验，极速畅玩");
list.add("生活也要多姿多彩，主题色随你切换"");
list.add("更多好玩尽在独立版APP体验");
list.add("没有什么能够阻挡你追逐梦想");
params.putStringArray("launchSubTitles", list);
FastAiManagerProxy.Companion.get().launchApp(params);
```
#### <span id="tab_sdk_new_feature" >2.7 Tab版新特性</span>

##### <span id="tab_sdk_new_feature_show_tab_bar_on_load" >2.7.1.Tab SDK启动是否展示底部TabBar</span>


##### <span id="event_13" >2.4.12.Tab SDK启动是否展示底部TabBar</span>

参数名 | 参数类型 | 是否必传 | 参数说明
---|---|---|---
showTabbarOnLoading | boolean |否|Tab SDK启动是否展示底部TabBar

<font color='blue'>注意：仅Tab版有效，开启后仅支持只接入主页面</font>

配置：入参增加showTabbarOnLoading

in kotlin{}

```
fun createParams(token: String?): Bundle = Bundle().apply {
    putString("merchantAppPushPath", pushEt.text.toString())
    ...
    putBoolean("showTabbarOnLoading", true) //true显示，默认false不显示
    ...
    putString("launchTitle", "Gbet")
}
```

in java

```
Bundle params = new Bundle();
params.putString("merchantAppPushPath","");
...
params.putBoolean("showTabbarOnLoading",true); //true显示，默认false不显示
...
params.putString("launchTitle", "Gbet");
    
```

使用

```html
//fun setTabBarOnLoading(tabBarHeight: Float, showTabBarOnLoading: Boolean)
//设置Tab SDK初始启动加载时显示TabBar及TabBar高度
FastAiManagerProxy.get().setTabBarOnLoading(50f,true)

//初始化并拉起Tab SDK启动页
FastAiManagerProxy.get().pushTabSdkLauncherPage(this, url = intent.getStringExtra("url"),title = launchTitle, subTitle = launchSubTitles)

//切换Tab时控制显示启动页
//fun showPushTabSdkLauncherPage(activity: Activity)
FastAiManagerProxy.get().showPushTabSdkLauncherPage(this)

//切换Tab时控制隐藏启动页
//fun hidePushTabSdkLauncherPage(activity: Activity)
FastAiManagerProxy.get().hidePushTabSdkLauncherPage(this)
```


### <span id="version" >三、查看SDK版本</span>
##### 查看fastailib的 SdkInfo VERSION

如:版本号

```
internal  class SdkInfo{
    companion object{
        val VERSION = "2.2.1";
    }
}   
```

### <span id="fragment" >四、支持tab方式接入,使用Fragment</span>

##### <span id="mainPage" >1.创建赛事主页面Fragment</span>

如:

```kotlin
FastAiManagerProxy.get().createMainPageFragment(Bundle().also {
   it.putString("merchantAppPushPath", "")
   it.putString("webHomePagePath", "")
   it.putString("merchantAppImgPath", "")
   it.putString("token", "")
   it.putString("sdkType", "sdk_Inline")
   it.putString("appType", "Gbet")
})	
```
##### <span id="betlist" >2.创建投注记录</span>
```kotlin
FastAiManagerProxy.get().createMemberBettingPageFragment(Bundle().also {
   it.putString("merchantAppPushPath", "")
   it.putString("webHomePagePath", "")
   it.putString("merchantAppImgPath", "")
   it.putString("token", "")
   it.putString("sdkType", "sdk_Inline") 
   it.putString("appType", "Gbet")
})
```
### <span id="laucher_nav" >五、接入TabSdk加载启动页, 底部导航栏的隐藏和显示容器</span>

#### <span id="sdk_launcher" >5.1 接接入TabSdk加载启动页</span>
##### 使用FastAiManagerProxy的pushTabSdkLauncherPage可以显示TabSdk加载的时候展示的加载情况.反馈给用户.  使用时候,在setContentView之前调用.注意:需要把tabsdk 的fragment加载后,启动页才会有加载反馈动作.

```kotlin
//第一个参数是activity, 第二个是启动时候显示的图片url
fun pushTabSdkLauncherPage(activity:Activity , url:String?)
//例子:
   override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
   ///.....
    FastAiManagerProxy.get().pushTabSdkLauncherPage(this, url = intent.getStringExtra("url"))
    setContentView(R.layout.activity_maigpage)
   ///.....
}
```


#### <span id="sdk_nav" >5.2 接入底部导航栏的隐藏和显示容器</span>
##### 使用TabSdkBottomBarLayout来管理你的底部导航栏,你不需要关心他的实现.只需要将你的导航栏成为他的子节点以及将它绑定你的容器即可,如

```java
tabSdkBottomBarLayout.setUpContainer(mainContainer)
```

```xml
<?xml version="1.0" encoding="utf-8"?>

<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    >
        <FrameLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:id="@+id/mainContainer"
            android:orientation="horizontal"
            android:layout_marginBottom="50dp"
            />
        <com.xc.sdk.fastailib.TabSdkBottomBarLayout
            android:layout_width="match_parent"
            android:layout_height="50dp"
            android:id="@+id/tabSdkBottomBarLayout"
            android:layout_gravity="bottom"
            >
				<!-- 假设这是你的导航栏-->
            <include layout="@layout/bottombar_layout" />
        </com.xc.sdk.fastailib.TabSdkBottomBarLayout>
</FrameLayout>
```

#### <span id="viewpage2" >六、主界面使用ViewPager2接入说明</span>

如果你的项目主界面是使用ViewPage2接入TabSdk版的fragment的。那么可以将登陆跳转TabSdkDemoActivity改成TabSdkDemoViewPage2Activity预览，具体接入请参考TabSdkDemoViewPage2Activity代码。但tabsdk内部不对viewpage2滑动切换页面滑动时间进行干预，.自行解决viewpage2的滑动冲突。或用viewpage2.isUserInputEnabled=false
进行禁用viewpage2滑动，需要注意一点的是，将tabsdk fragment inflate时候，需要对parent进行requestFitSystemWindows.否则沉淀色无法适配。如

```kotlin
viewpager2.adapter = object : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {

        var layout:Int = 0
        var view:View? = null
        when(viewType){
           // .....
            2-> view = LayoutInflater.from(parent.context).inflate( R.layout.view_mainpage, parent,false)
           // .....
        }

        when(viewType){
            2-> {
                mainPageFragment = supportFragmentManager.findFragmentById(R.id.mainPageFragment) as MainPageFragment?
                parent?.requestFitSystemWindows()
            }
            // .....

        }
        return MyViewHolder(view!!)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 5
    }

    override fun getItemViewType(position: Int): Int {
        return position
    }

}
```

> #### <span id="notice" >接入注意事项</span>

> ##### 1.如果编译时出现了安装失败问题,请到sample工程的目录的app/build.gradle下,观察applicationVariants.all有没有注释掉,有些的AS版本无法安装.请注释掉

```gradle
//    applicationVariants.all { variant ->
//        variant.outputs.all { output ->
//            def sdkVersion = "3.0.0"
//            def productName //渠道名字
//            variant.productFlavors.each { product ->
//                //获取渠道名字
//                if(product.name == "params"){
//                    productName = "参数版"
//                } else if(product.name == "yanshi"){
//                    productName = "演示版"
//                } else if(product.name == "international"){
//                    productName = "国际版"
//                } else if(product.name == "ultimate"){
//                    productName = "旗舰版"
//                } else if(product.name == "aisport"){
//                    productName = "Gbet"
//                } else {
//                    productName = product.name
//                }
//            }
//            def buildName = "SDK(" + productName+")"
//            def releaseApkName = buildName + sdkVersion + "-" + getTime() + '.apk'
//            outputFileName = releaseApkName
//            variant.packageApplication.outputDirectory = new File(project.rootDir.absolutePath+"/app/apk/"+variant.buildType.name)
//        }
//    }
```

> ##### 2.如果发现你的主页面的底部栏在进入tabssdk二级页面的时候,不会被隐藏.
>> (1).tabSdkBottomBarLayout是否绑定了主页面的容器.如


```java
tabSdkBottomBarLayout.setUpContainer(findViewById(R.id.mainPageContainer))
```

>> (2).主页面可能需要包裹一个LineanerLayout或FrameLayout,如

```xml
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">
        <FrameLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <FrameLayout
                android:layout_width="match_parent"
                android:layout_height="match_parent"
                android:id="@+id/mainPageContainer"
                android:layout_marginBottom="50dp"/>
        </FrameLayout>
        <com.xc.sdk.fastailib.TabSdkBottomBarLayout
            android:layout_width="match_parent"
            android:layout_height="50dp"
            android:id="@+id/tabSdkBottomBarLayout"
            android:layout_gravity="bottom">
            <include layout="@layout/bottombar_layout" />
        </com.xc.sdk.fastailib.TabSdkBottomBarLayout>
</FrameLayout>
```



> ##### 3.如果发现你的主页面的底部栏发现不见了.没法切换.需要实现TabSdkBottomBarLayout的拦截功能.不在tabsdk 页面需要拦截.如

```kotlin
tabSdkBottomBarLayout.hideBottomBarintercept = object:HideBottomBarintercept{
    override fun onHide(): Boolean {
        return mainPageFragment.isVisible ||  betlistFragment.isVisible
    }
}
```	
		
		

#### <span id="AnimationPlayEnv" >七、动画播放对环境要求</span>

>(1) Js
>
>(2) http 及 https
>
>(3) websocket
>
>(4) 当打开关闭遮罩通知功能时，WebView 需拦截 hybrid:协议的请求。否则会报错。
若没进行拦截，请勿填写参数 hybrid 或设 hybrid 为 0。
>
>(5) Iframe，当前没使用 iframe，但为了将来的扩展，建议在 webview 中支持该特
性。
>
>(6) 是部分 android 机型设置的字体过大会导致版面错乱的情况，android 客户端应设
置 webview 的默认字体大小为 100。实现代码： webView.getSettings().setTextZoom(100)


#### <span id="NetworkIndex" >八、网络性能指标采集</span>

> 应用工程配置，修改 app\build.gradle
>
> (1). compileSdkVersion 28   //不可高于28
>
> (2). targetSdkVersion 28
>
```gradle
android {

    compileSdkVersion 28
    buildToolsVersion "28.0.3"
    defaultConfig {
       
        minSdkVersion 17
        targetSdkVersion 28
        versionCode 1
        versionName "1.0"
        ...
    }
   
}
```

#### <span id="apkAbort" >九、Release Apk包闪退</span>

> (1).Release Apk包闪退出现：修复：打包输出的安装包出现java.lang.AbstractMethodError: abstract method "void com.google.android.exoplayer2.Player$EventListener"闪退
> 解决办法：在gradle.properties 中添加 android.enableDexingArtifactTransform=false


