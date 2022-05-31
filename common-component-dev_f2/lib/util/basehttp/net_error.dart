/*
 * @Author: King 
 * @Date: 2021-07-29 14:56:53 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-29 15:43:43
 */
//网络异常时候，类型
enum NetError {
  
  Unknown,//未知网络错误
  CONNECT_TIMEOUT,//连接服务器超时
  RECEIVE_TIMEOUT,//接收数据超时
  SEND_TIMEOUT,//上传数据超时
  CANCEL,//请求被取消
  RESPONSE,//连接上了服务器，但是不是200状态码。可能是404,503等等
}
