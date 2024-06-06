library flutter_modular;

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'base_route.dart';
import 'types.dart';
import 'dart:developer' as developer;
part 'base_route_extension.dart';

/// 模块接口
///
/// [ModuleInterface] 将模块抽象化，由子模块去实现具体的业务，按需加载子模块。
/// > [ModuleInterface] 解决了以下问题：
/// > 1. 抽象化；
/// > 2. 模块分离；
/// > 3. 按需加载或者移除子模块；
/// > 4. 移除子模块时，不影响 宿主 APP 的路由，不会编译错误；
abstract class ModuleInterface {
  /// 该模块是否已加载，如果未加载，跳转到这个 Module 中的路由都会被阶段，返回 null;
  final bool isLoaded;

  /// 模块名称
  final String name;

  /// 路由必须由子模块提供
  @protected
  List<RouteName> get supportedRoutes;

  const ModuleInterface({
    required this.name,
    required this.isLoaded,
  });

  /// 加载模块中的路由，
  List<GetPage> loadPages([OnCreateGetPageParams? createPageParams]) {
    if (isLoaded) {
      final create = createPageParams ??= (route) => CreateGetPageParams();
      return supportedRoutes.map((route) {
        return _generatePage(route, create(route));
      }).toList();
    }
    return [];
  }

  /// 子模块根据 [route] 和 宿主 APP 提供的 [params] 生成 [GetPage]。
  /// > 生成路由需要宿主 APP 和 子模块共同参与，宿主 APP 提供生成 [GetPage] 的参数，子模块提供页面需要展示的 [Widget]。
  GetPage _generatePage(RouteName route, CreateGetPageParams params) {
    return GetPage(
      name: route.prefixSlash,
      page: () => generatePageWidget(route, params),
      popGesture: params.popGesture,
      parameters: params.parameters,
      title: params.title,
      transition: params.transition,
      curve: params.curve,
      participatesInRootNavigator: params.participatesInRootNavigator,
      alignment: params.alignment,
      maintainState: params.maintainState,
      opaque: params.opaque,
      binding: params.binding,
      bindings: params.bindings,
      customTransition: params.customTransition,
      transitionDuration: params.transitionDuration,
      fullscreenDialog: params.fullscreenDialog,
      preventDuplicates: params.preventDuplicates,
      arguments: params.arguments,
      children: params.children,
      middlewares: params.middlewares,
      unknownRoute: params.unknownRoute,
      showCupertinoParallax: params.showCupertinoParallax,
    );
  }

  /// 由子模块负责页面组件的创建
  @protected
  Widget generatePageWidget(
    RouteName route,
    CreateGetPageParams params,
  );

  /// 检测该模块是否支持 [route] 路由
  bool supportRoute(BaseRoute route) =>
      isLoaded ? supportedRoutes.contains(route.name) : false;

  /// 检测该模块是否不支持 [route] 路由
  bool notSupportRoute(BaseRoute route) => !supportRoute(route);

  /// 路由跳转，参考 [Get.toNamed]，如果 [isLoaded] 为 true，则跳转，否则返回会被截断
  Future<R?>? toNamed<R>(
    BaseRoute<R> route, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    if (notSupportRoute(route)) {
      final errorMsg = '$this 不支持 $route 路由';
      developer.log(errorMsg, error: errorMsg);
      return null;
    }
    final r = await route._toNamed(
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
    return r;
  }
}
