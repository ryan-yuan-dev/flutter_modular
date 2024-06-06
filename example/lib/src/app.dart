import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes_manager/routes_manager.dart';

import 'modules.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final moduleAPages = moduleA.loadPages((route) {
      if (route == routeNameA) {
        return CreateGetPageParams<String>(transition: Transition.fadeIn);
      }
      return CreateGetPageParams<dynamic>(transition: Transition.rightToLeft);
    });

    final moduleBPages = moduleB.loadPages();

    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const MyPage()),
        ...moduleAPages,
        ...moduleBPages,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                moduleA.toNamed(RouteA(), arguments: "");
              },
              child: const Text('Go to module A'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyPage extends GetView<MyController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPage')),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(onPressed: onPressed, child: const Text("跳")),
      )),
    );
  }

  void onPressed() async {
    final s = await moduleA.toNamed<String>(RouteA(), arguments: "我是参数");
  }
}

class MyController {}
