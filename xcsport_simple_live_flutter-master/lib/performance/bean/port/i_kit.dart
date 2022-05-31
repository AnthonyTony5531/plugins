import 'package:fast_ai/performance/bean/port/i_action.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/widget/resident_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

abstract class IKit implements IAction{
  IKit() {
    _storage = createStorage();
    assert(_storage != null, 'storage should not be null');
  }

  IStorage _storage;

  void init();

  void dispose();

  IStorage createStorage();

  Widget createDisplayPage();

  String getKitName();

  String getIcon();

  String getRouter();

  bool save(IData data) {
    // _storage.contains(data);
    return data != null && storage != null && storage.save(data);
  }

  IStorage get storage => _storage ??= createStorage();

  @override
  void tabAction() {
    // final tag = ResidentPage.tag;
    // if (tag.contains(getRouter())) return;
    // ignore: invalid_use_of_protected_member
    ResidentPage.residentKey.currentState?.setState(() {
      ResidentPage.tag += '/${getRouter()}';
    });
  }

  @override
  void quitAction() {
    if (ResidentPage.tag == '/') return;
    final int index = ResidentPage.tag.lastIndexOf('/');
    if (index == -1 && index == 0) return;
    // ignore: invalid_use_of_protected_member
    ResidentPage.residentKey.currentState?.setState(() {
      ResidentPage.tag = ResidentPage.tag.substring(0, index);
    });
  }
}
