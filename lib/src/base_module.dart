import 'package:flutter/widgets.dart';

import 'module_interface.dart';
import 'types.dart';

/// 默认提供未提供任何路由，因此不会创建 GetPage，只有子模块才能创建
///
/// 当未加载子模块时，该模块会充当一个子模块的默认实现，只是免除编译错误，没有具体的功能逻辑；
class BaseModule extends ModuleInterface {
  const BaseModule({required super.name, super.isLoaded = false});

  /// 不提供路由，需要自摸块提供
  @override
  List<RouteName> get supportedRoutes => [];

  /// 如果未加载子模块， [supportedRoutes] 为空，所以不会被调用，实际不会排除异常。代码中排除异常，只是免除编译错误
  @override
  Widget generatePageWidget(RouteName route, CreateGetPageParams params) {
    throw UnimplementedError('必须由子模块实现...');
  }
}
