<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
## Introduction
Built with get pub, flutter_modular empowers modular Flutter development. It simplifies app creation by enabling you to decompose screens into reusable modules that can be effortlessly combined to build entirely new applications.

## Reasons for Creating flutter_modular

The motivation behind developing flutter_modular stems from the following challenges faced during app development:

1. **Inefficient Debugging with Platform-Specific Plugins:**

   - Dart-based features are efficiently debuggable on the web. However, introducing plugins exclusive to Android/iOS necessitates testing on mobile devices, a time-consuming process.

   - Removing these plugins leads to compilation errors due to missing libraries, forcing developers to comment out relevant code.

   - Restoring the code is required for debugging plugin-related features, causing a tedious back-and-forth cycle.

   - **Solution:** A mechanism to seamlessly add/remove Android/iOS plugins without affecting project code.

2. **Efficient Code Reuse Across Projects:**

   - Simultaneous development of multiple projects demands efficient reuse of existing pages.

   - **Solution:** A robust system for reusing and sharing common pages across projects.

3. **Rapid App Development with Modular Reuse:**

   - The ability to quickly assemble new apps by leveraging existing modules.

   - **Solution:** A framework for effortless module composition and rapid app creation.

flutter_modular addresses these challenges by providing a modular architecture that streamlines development and enhances code reusability. 

## Features

- Decompose screens into reusable modules with ease.
- Easily combine modules to build new applications.
- Seamlessly add or remove modules without impacting your host app's codebase, no compilation errors.

## Codebase structure

- The root directory contains the core `flutter_modular` library code.
- The `example` directory showcases a sample project demonstrating how to use flutter_modular.
- The `example` directory includes submodules named `module_a`, `module_b`, and `routes_manager`.

## How does it work?

Thanks to [get](https://pub.dev/packages/get). It allows the total decoupling of the View, presentation logic, business logic, dependency injection, and navigation. 

Basing on [get](https://pub.dev/packages/get), [flutter_modular](https://github.com/ryan-yuan-dev/flutter_modular) can decouple presentation logic, business logic and navigation into modules.

`flutter_modular` has two core components:
- `ModuleInterface` exports the following methods:
    - `loadModule` gives each module a chance to provide routes they support. But the screen widget should be provided by the modules.
    - `toNamed` is a method that allows the host app to navigate to a screen in loaded modules. If a module is not loaded, navigating to the screen in the module will fail.
- `BaseModule` is a base class that implements `ModuleInterface`. It provides a default implementation of `loadModule`, but provides no routes. It also provides a default implementation of `toNamed`. But won't navigate to anywhere. 

The main idea is host app can denpends any modules and can be moved at any time. When a module is absent we use a 'BaseModule' to replace it and prevent compilation errors and prevent navigate to the route in it.

That's it!

You can refer to the example project. It helps you understand more about how to use flutter_modular.

## Explanation of example project

The example dendends the following modules:
- `routes_manager`, which is the module that manages all the routes names, route arguments and result types. We can treat it as a package for models. Models should be shared in any projects. So we make it a standalone module.
- `module_a` and `module_b`, which are the modules that will be loaded. Both of them implements `ModuleInterface` and depends `routes_manager`.
- `module_interface`, which is the module that provides the `ModuleInterface` and `BaseModule`.

Here is the key trick to know whearther a module is loaded or not.

## Getting started
Follow below steps to get started:
1. Let the example project run:
    ```shell
    flutter pub add module_a module_b routes_manager flutter_modular
    ```
    to add the modules to the project.

2. Wirte a script to read modules from the `pubspec.yaml` file. In the example, `modules_reader.dart` reads `pubspec.yaml` to find out each module is loaded or not. If a module is loaded create it Module instance, like `ModuleA` instance. If not, create a `BaseModule` instance. The write the objects into `lib/src/modules.dart` file.
3. In example app, we use modules in `lib/src/modules.dart` to load their routes.
4. Try to remove add add modules to see how it works.

## Usage
1. Add `flutter_modular` to your `pubspec.yaml`.
2. Make a module defines all the routes all modules will provide. No matter a module will be loaded or not.
3. Add modules to `pubspec.yaml`.
4. Write a script to read modules from host app `pubspec.yaml` file. The script generates module instance when loaded and `BaseModule` when not loaded.
5. In host app, use modules in `lib/src/modules.dart` to load their routes.

## Contributing
Any feedback and suggestions are appreciated. 

I'm looking forward a part time job, please contact me if you are interested. 

If this repo is useful, please give it a star. Buy me a coffee if you like.

Thank you.

## Additional information

MIT License
