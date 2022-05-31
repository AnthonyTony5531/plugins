
# FAST_AI

## 配置开发环境
    配置详细教程：https://flutterchina.club/setup-macos/
    执行flutter doctor 无误为准
## 开发工具
    Visual Sdudio Code
    安装插件Flutter

## 目录结构
    android     android平台相关代码
    assets      资源文件存放，字体，图片，数据库文件
    docs        文档存放
    ios         ios平台相关代码
    test        用于存放测试代码
    lib         flutter相关代码，开发者代码主要存放地方
        ｜-- api                后端api请求处理类
        ｜-- event              消息总线
        ｜-- model              model类      
        ｜-- utils              公共处理类
        ｜-- pages              页面
        ｜-- widgets            公共组件
        ｜-- main.dart          主入口
        ｜-- routers.dart       路由类
## 工具网站
    仓库：https://pub.dev/packages/


## 命名规范 
    1.类名 首字母大写 
    2.类文件名 大写字母改为_分隔，全小写 
    3.方法及属性 驼峰式 
    4.协议类及命名 
        协议类都存放于protocols目录及子目录下面，一个protocol类对应接口的一个数据结构,例赛数据接口的协议,api/xx/match?gametype=FT接口的协议类: 
        xx/match目录: 
            xx_match_req_protocol.dart      :class XXMatchReqProtocol 
            xx_match_rsp_protocol.dart      :class XXMatchRspProtocol 
            ... 
    5.显示组件 
        使用MVC组织结构至少由MV组成，即Model,View,Controller 一个组件一个目录,层级在View下建子目前，
        例如一个RunningMatch组件由以下部分组成: 
        running_match目录: 
            running_match.dart              :class RunningMatch 必选:RunningMatch的View类 
            running_match_model.dart        :class RunningMatchModel RunningMatch的Model类，用于存储RunningMatch的数据及数据处理 
            running_match_controller.dart   :class RunningMatchController 可选:RunningMatch的Controller类，用于存储RunningMatch的事件及响应处理 
            running_match_style.dart        :calss RunningMatchStyle 必选:放View的样式属性,用于布局

    6.组件的通用属性 
        组件参数使用Model类作为传入参数 
        必须实现set model属性，该属性作为组件的数据源的设定,例： 
        必须实现set style属性，该属性作为组件的样式的设定,例： 
        class RunningMatch{ 
            RunningMatchModel _model; 
            RunningMatchModel get model{ return _model; } 
            set model(RunningMatchModel value){ 
                _model = value; 
                ... 
                setState(...); 
            } 
            RunningMatchStyle _style; 
            RunningMatchStyle get style{ return _style; } 
            set model(RunningMatchStyle value){ 
                _style = value; 
                ... 
                setState(...); 
            }
        }

    7.Model与Protocol的数据转换规范 
        只能在Model中添加对应的Protocol类解析方法，方法名的格式为fromXXXProtocol与toXXXProtocol如例： 
        class MatchRspProtocol{ ... } 
        class MatchReqProtocol{ ... } 
        class RunningMatchModel{ 
            MatchProtocol match; 
            String name; 
            //动态链式实现 
            RunningMatchModel fromMatchRspProtocol(MatchRspProtocol match){ 
                this.match = match; 
                this.name = match.name; 
                ... 
                return this; 
            } 
            //动态实现 
            MatchReqProtocol toMatchReqProtocol(){ 
                var ret = MatchReqProtocol(); 
                ret.name = this.name; 
                ... 
                return this; 
            }
        }


## 中文乱码
    在setting.json中添加 code-runner.runInTerminal : true

## 敏感词切换
    Api.dart文件： 
    static const IS_OPEN_KEYWORD = false; //是否开启新关键词


