
class VerityUtil {
  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  static bool verityPhone(String str) {
    String regexPhoneNumber = "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return new RegExp(regexPhoneNumber).hasMatch(str);
  }

}