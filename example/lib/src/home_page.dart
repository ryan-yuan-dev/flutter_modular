import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes_manager/routes_manager.dart';
import 'dart:developer' as developer;
import 'modules.dart';

class HomePage extends GetView<MyController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text("Home Page"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text('go_to_page_a'.tr),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: _changeLocale,
                child: Text("switch_language".tr),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() async {
    final s = await moduleA.toNamed<String>(RouteA(), arguments: "我是参数");
    developer.log('$s 路由返回结果：$s');
  }

  void _changeLocale() {
    if (Get.locale?.languageCode == 'en') {
      Get.updateLocale(const Locale('zh', "CN"));
      return;
    }
    Get.updateLocale(const Locale('en', "US"));
  }
}

class MyController {}
