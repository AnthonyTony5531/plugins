import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/common_storage.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/tool/vm/vm_helper.dart';
import 'package:fast_ai/performance/tool/vm/vm_service_wrapper.dart';
import 'package:fast_ai/performance/widget/memory_kit_page.dart';
import 'package:flutter/material.dart';
import 'package:vm_service/vm_service.dart';

/// @author grey
/// Function :

class MemoryKit extends IKit {

  static final List<String> selClassNames = [];

  @override
  Widget createDisplayPage() => MemoryKitPage();

  @override
  IStorage createStorage() => CommonStorage(maxCount: 128);

  @override
  void dispose() => VMServiceWrapper.instance.disConnect();

  @override
  String getIcon() => KitIcon.KIT_MEMORY;

  @override
  String getKitName() => KitName.KIT_MEMORY;

  @override
  String getRouter() => KitRouter.KIT_MEMORY;

  @override
  void init() {
    VMServiceWrapper.instance.connect();
    VmHelper vmHelper = VmHelper.instance;
    VMServiceWrapper.instance.connect().then((value) => vmHelper.resolveVMInfo());
  }

  void update() {
    VmHelper.instance.updateAllocationProfile();
    VmHelper.instance.updateFlutterVersion();
    VmHelper.instance.updateMemoryUsage();
  }

  void gc(){
    VMServiceWrapper.instance.gc();
  }

  AllocationProfile getAllocationProfile() {
    return VmHelper.instance.allocationProfile;
  }
}
