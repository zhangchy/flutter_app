import 'package:flutter_a9vg/utils/local_storage.dart' show LocalStorage;
import 'package:package_info/package_info.dart' show PackageInfo;
import 'package:flutter/foundation.dart' show ChangeNotifier;

class ConfigInfo {
  String version = '1.0';
  String theme = 'red';
  String appVersion = '-';
}

class ConfigStore extends ConfigInfo with ChangeNotifier {
  Future $getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    notifyListeners();
  }

  Future $getTheme() async {
    String _theme = await LocalStorage.get('theme');
    print('config get Theme ${_theme}');
    if (_theme != null) {
      $setTheme(_theme);
    }
  }

  Future $setTheme(payload) async {
    theme = payload;
    LocalStorage.set('theme', payload);
    notifyListeners();
  }

}
