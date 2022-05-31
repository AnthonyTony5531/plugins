/* --------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明  用于sqllite中通用配置结构
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 * -------------------------------------------------------*/
// @reflector
class CommonConfigModel {
  //配置项键值
  String key;
  //配置项的内容，以文本的形式存，json格式
  String value;
  //配置的版本号
  num version;

  CommonConfigModel({this.key,this.value,this.version});
}

