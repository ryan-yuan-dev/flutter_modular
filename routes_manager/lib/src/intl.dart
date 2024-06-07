import 'package:get/get.dart';

const lGoToPageA = "go_to_page_a";
const lReturn = "Return";
const lSwitchLanguage = "switch_language";

/// 资源国际化
class Intl extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          lGoToPageA: "Go to Page A",
          lReturn: "Return",
          lSwitchLanguage: "Switch Language",
        },
        "zh_CN": {
          lGoToPageA: "前往页面 A",
          lReturn: "返回",
          lSwitchLanguage: "切换语言",
        }
      };
}
