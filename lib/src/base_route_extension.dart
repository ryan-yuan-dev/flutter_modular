part of 'module_interface.dart';

extension BaseRouteX<R> on BaseRoute<R> {
  String get namePath => name.startsWith("/") ? name : "/$name";

// 跳转路由自身对应的页面
  // > 设置为私有的，是因为希望调用者只能通过 [IModule.toNamed] 调用
  Future<R?>? _toNamed({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    // TODO: Get.toNamed<dynamic> 为什么不能写成 Get.toNamed<R>
    final r = await Get.toNamed<dynamic>(
      namePath,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
    return r as R?;
  }
}
