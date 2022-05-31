# AI体育SDK iOS接入文档

## 此文档引导宿主App Android端如何接入SDK 

| 更改日期 | 版本 |更改人|版本说明|审核人|
|:------|:------:|:------:|:--------|:---:|
| 2019-12-26 | 1.0.0V1 | sam | 创建||


## 接入流程：
1. 如果**gradle.properties**文件没配置如下，需要确保配置androidx, R8:
```gradle
android.enableR8=true
android.useAndroidX=true
android.enableJetifier=true
```
2. 如果没配置kotlin,需要进行配置，最好是 **1.3.50**以上
3. 项目的minSdkVersion版本，需要17以上，如

```
  android{
 	 //...
    defaultConfig {
        minSdkVersion 17
		//...
    }
  }
```
4.CPU架构只支持armeabi-v7a，armeabi-v8a，也就是说，不支持普通的x86模拟器cpu架构
```
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
5.如果没配java8,需要支持java8
```
 android{
	//...
     compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
    }
		//...

 }

```

6.如果你的SDK版本是27以上，需要在AndroidManifest.xml,配置android:usesCleartextTraffic="true"，如

```xml
 <application
  android:usesCleartextTraffic="true"
    
  >

```
否则， 加载网页时候，加载失败.

7.满足以上条件，导入开发包，进行使用即可。



## Api使用介绍、

1.初始化，在自己的Application上.onCreate方法上初始化，使用FastAiManagerProxy的init方法，如
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

2.启动Sdk.使用FastAiManagerProxy的launchApp方法，如

in kotlin
```kotlin

  class Test{
   fun call(){
      FastAiManagerProxy.get().launchApp()
   }
  }

```
in java
```java

class Test{
     void call(){
        FastAiManagerProxy.Companion.get().launchApp();
     }
}

```








