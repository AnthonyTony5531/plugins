import 'package:flutter/widgets.dart';

import '../mvvm/view/stateful_view.dart';
import '../mvvm/viewmodel/stateful_viewmodel.dart';
import '../theme/view_style.dart';

mixin AutomaticKeepAliveStatefulViewMixin<S extends ViewStyle,M extends StatefulViewModel<S>, V extends StatefulView< S, M>> on ViewState<S, M , V> {
  
  KeepAliveHandle _keepAliveHandle;

  void _ensureKeepAlive() {
    assert(_keepAliveHandle == null);
    _keepAliveHandle = KeepAliveHandle();
    KeepAliveNotification(_keepAliveHandle).dispatch(context);
  }

  void _releaseKeepAlive() {
    _keepAliveHandle.release();
    _keepAliveHandle = null;
  }

  @protected
  bool get wantKeepAlive;

  @protected
  void updateKeepAlive() {
    if (wantKeepAlive) {
      if (_keepAliveHandle == null)
        _ensureKeepAlive();
    } else {
      if (_keepAliveHandle != null)
        _releaseKeepAlive();
    }
  }

  @override
  void initState() {
    super.initState();
    if (wantKeepAlive)
      _ensureKeepAlive();
  }

  @override
  void deactivate() {
    if (_keepAliveHandle != null)
      _releaseKeepAlive();
    super.deactivate();
  }

  @mustCallSuper
  @override
  Widget render(BuildContext context) {
    if (wantKeepAlive && _keepAliveHandle == null)
      _ensureKeepAlive();
    return null;
  }
}
