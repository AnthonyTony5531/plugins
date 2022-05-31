/// @author king
/// @date 2021/5/31


class NumberUtil{

  //大数量数字展示，超过1万用w显示
  static String bigNumberString(num value ){
    value??=0;
    if(value>=10000){
      return "${removeZeroSuffix((value /10000.0)
          .toStringAsFixed(2))}w";
    }
    return "${removeZeroSuffix(value.toStringAsFixed(2))}";
  }

  //移除0后缀的小数
  static  String removeZeroSuffix(String value ){
    value ??='0';
    if(value.endsWith('.')){
      return value.substring(0, value.length-1);
    }
    if(value.contains('.') && value.endsWith('0')){
      return removeZeroSuffix(value.substring(0, value.length-1));
    }
    return value;
  }
}
