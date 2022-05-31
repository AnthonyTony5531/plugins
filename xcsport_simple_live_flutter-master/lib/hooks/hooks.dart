class HookResult {
  //是否执行下一个hook
  bool isNext = true;
  //是否取消操作
  bool isCancel = true;
  //参数
  dynamic parmas;
  HookResult(this.isCancel, this.parmas);
}

typedef HookNextProc = HookResult Function(dynamic params);

class HookProcNode {
  HookNextProc proc;
  HookProcNode next;
  HookProcNode tail;
  HookProcNode(this.proc);
}

//钩子服务
class Hooks {
  static Hooks ins = new Hooks();

  //钩子数据
  Map<String, HookProcNode> _hooks = new Map<String, HookProcNode>();

  //在最后面添加Hook函数
  void hookTail(String hookName, HookNextProc proc) {
    var head = _hooks[hookName];
    if (head == null) {
      head = HookProcNode(proc);
      head.tail = head;
      _hooks[hookName] = head;
    } else {
      var tail = head.tail;
      var node = HookProcNode(proc);
      tail.next = node;
    }
  }

  //在最前面添加Hook函数
  void hookPre(String hookName, HookNextProc proc) {
    var head = _hooks[hookName];
    if (head == null) {
      head = HookProcNode(proc);
      head.tail = head;
      _hooks[hookName] = head;
    } else {
      var tail = head.tail;
      var node = HookProcNode(proc);
      node.next = head;
      node.tail = tail;
      _hooks[hookName] = node;
    }
  }

  //计算取Hook的结果
  HookResult callHook(String hookName, dynamic parmas) {
    HookProcNode node = _hooks[hookName];
    HookResult ret = new HookResult(false, parmas);
    while (node != null) {
      try {
        ret.parmas['hookName'] = hookName;
        ret = node.proc(ret.parmas);
        if (ret.isCancel) {
          return ret;
        }
        if (!ret.isNext) {
          break;
        }
      } catch (e) {
        print({"level": "error", "msg": "hook proc error", "err": e});
        ret.isCancel = true;
        return ret;
      }
      node = node.next;
    }
    return ret;
  }

  bool isBlocked(String hookName, dynamic parmas) {
    var hookResult = Hooks.ins.callHook(hookName, parmas);
    if (hookResult.isCancel)
      return true;
    else
      return false;
  }
}
