/*
 * @Author: King 
 * @Date: 2021-07-28 16:51:52 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-28 16:53:06
 */


//http 头部Key
abstract class HttpHeader{
  static const Accept = 'accept';
  static const Rang = 'range';
  static const ContentEncoding = 'content-encoding';
  static const ContentLength = 'content-length';
  static const ContentType= 'content-type';
  static const CwwAuthenticate = 'www-authenticate';
  static const JsonContentType = 'application/json; charset=utf-8';
  static const FormUrlEncodedContentType = 'application/x-www-form-urlencoded';
}