import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

// 路由之所以不定义在子模块中，是为了避免，子模块移除后，出现编译错误
const RouteName routeNameC = 'c';
const RouteName routeNameD = 'd';

/// 定义 [RouteC] 仅有一个作用, 指明 [GetPage.arguments] 和 页面返回数据的类型
class RouteC extends BaseRoute<String, String> {
  @override
  String get name => routeNameC;
}

@immutable
class RouteDArgument {
  final String id;
  final int size;
  const RouteDArgument({required this.id, required this.size});
}

@immutable
class RouteDResult {
  final List<String> names;
  const RouteDResult({required this.names});
}

class RouteD extends BaseRoute<RouteDArgument, RouteDResult> {
  @override
  String get name => routeNameD;
}
