import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes_manager/routes_manager.dart';
import 'dart:developer' as developer;
import 'modules.dart';

class MyPage extends GetView<MyController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPage')),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text("跳"),
          ),
        ),
      ),
    );
  }

  void onPressed() async {
    final s = await moduleA.toNamed<String>(RouteA(), arguments: "我是参数");
    developer.log('$s 路由返回结果：$s');
  }
}

class MyController {}
