import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

// 路由之所以不定义在子模块中，是为了避免，子模块移除后，出现编译错误
const RouteName routeNameA = 'a';
const RouteName routeNameB = 'b';

/// 定义 [RouteA] 仅有一个作用, 指明 [GetPage.arguments] 和 页面返回数据的类型
class RouteA extends BaseRoute<dynamic, dynamic> {
  @override
  String get name => routeNameA;
}

@immutable
class RouteBArgument {
  final String id;
  final int size;
  const RouteBArgument({required this.id, required this.size});
}

@immutable
class RouteBResult {
  final List<String> names;
  const RouteBResult({required this.names});
}

class RouteB extends BaseRoute<RouteBArgument, RouteBResult> {
  @override
  String get name => routeNameB;
}
