/// @author king
/// @date 2021/5/29
abstract class  FreshStatus{
  static const None = 0x01;//默认状态
  static const Refreshing = None  << 1;//刷新
  static const Success = None << 2;//成功
  static const Empty = None << 3;
  static const Error = None << 4;
}
