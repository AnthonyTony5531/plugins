/*
 * @Author: King 
 * @Date: 2021-07-28 21:13:46 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-28 21:15:37
 */


import '../http_request.dart';
import 'dio_http_request.dart';

//提供代理实现类
HttpRequest create()=>DioHttpRequest();