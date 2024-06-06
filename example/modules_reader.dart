import 'dart:io';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'dart:developer' as developer;
class ModulesReader {
  /// 读取当前目录下的 pubspec.yaml 中所有的依赖库
  static Future<String> readPubspecYaml() async {
    final pubspecFile = File('pubspec.yaml');
    final content = await pubspecFile.readAsString();
    final pubspec = Pubspec.parse(content);
    final dependencies = pubspec.dependencies.keys.toList();
    final importsCode = StringBuffer();
    final codeGenerator = StringBuffer();
    importsCode.writeln("import 'package:flutter_modular/flutter_modular.dart';");
    if (dependencies.contains("module_a")) {
      importsCode.writeln("import 'package:module_a/module_a.dart';");
      codeGenerator.writeln("const moduleA = ModuleA(isLoaded: true);");
    } else {
      codeGenerator.writeln("const moduleA = BaseModule(name: '');");
    }
    if (dependencies.contains("module_b")) {
      importsCode.writeln("import 'package:module_b/module_b.dart';");
      codeGenerator.writeln("const moduleB = ModuleB(isLoaded: true);");
    } else {
      codeGenerator.writeln("const moduleB = BaseModule(name: '');");
    }
    final dependenciesFile = File('lib/src/modules.dart');
    if (!(await dependenciesFile.exists())) {
      dependenciesFile.create(recursive: true);
    }
    final imports = importsCode.toString();
    final code = codeGenerator.toString();
    final outputCode = "$imports\n$code";
    await dependenciesFile.writeAsString(outputCode);
    return outputCode;
  }
}

void main(List<String> args) {
  ModulesReader.readPubspecYaml().then((value) {
    developer.log(value);
  });
}
