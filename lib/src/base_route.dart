import 'package:get/get.dart';

/// 路由抽象类，[A] 表示路由的入参类型，[R] 表示路由的返回值类型。
abstract class BaseRoute<R> {
  String get name;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BaseRoute && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

/// 路由列表扩展
extension RouteListX on List<BaseRoute> {
  /// 通过路由名称获取路由
  BaseRoute? getRouteByName(String name) {
    return firstWhereOrNull((route) => route.name == name);
  }
}
