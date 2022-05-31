/*
*********************************************************************
 * web的js 和 flutter 的交互工具类
 * date:2019-12-11
 * 当前版本：1.0.0
 * 修改记录：
 * 版本    |   修改人  | 修改内容
 * 1.0.0       sam    提供具有与flutter交互基础能力.
 **********************************************************************
 */


const  _xcjsRequests =  new Map();

class XCJSRequestParam{
    constructor(action='', method='', params, callback){
        this.action= action;
        this.method= method;
        this.requestId = createRequestId(action, method);
        this.callback = callback;
        this.params = params;
        this.execute=function(data){
            console.log("execute >> reuqestId"+this.requestId);
            if(null != this.callback){
                this.callback(data);
            }
        }
    }
}

class XCFlutterJSSDK{
    request(_param){
        var requestId = _param.requestId;
        console.log(">>>requestId:"+requestId);
        _xcjsRequests.set(requestId, _param);
        var sendData = packageParam(_param);
        console.log("packageParam>>"+sendData);
        try{
            xcjsmanager.postMessage(sendData);
        }catch(e){
            
        }
        return _param;
    }
}


function createRequestId(_action, _method){
    return "xc_requestId_$"+_action+"_$"+_method+"_$"+new Date().getTime();
}

function packageParam(_param){

    var json = {
        'action':_param.action,
        'method':_param.method,
        'requestId':_param.requestId,
        'params':_param.params,
    }
    return JSON.stringify(json);
}


const xcflutterSDK = new XCFlutterJSSDK();

function xcFlutterJSSDKCallback(_data){
    console.log(_data);
    try{
        var  json  = JSON.parse(_data);
        var  action = json['action'];
        var  method  =json['method'];
        var  requestId  =json['requestId'];
        console.log("action:"+action);
        console.log("method:"+method);
        console.log("requestId:"+requestId);
        console.log("_xcjsRequestSize:"+_xcjsRequests.size);
        var requestParam = _xcjsRequests.get(requestId);
        console.log("requestParam:"+requestParam);
        if(null != requestParam){
            _xcjsRequests.delete(requestParam);
            requestParam.execute(json['data']);
        }
    }catch(e){
        console.log(e);
    }
  
}

function testLocation(){
    window.location = "http://www.baidu.com";
}

