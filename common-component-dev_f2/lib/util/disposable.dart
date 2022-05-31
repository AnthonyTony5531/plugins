/// @author king
/// @date 2021/5/27


///非托管资源都必须实现这个接口
abstract class IDisposable{
  //非托管资源在这释放资源
  void dispose();
}
