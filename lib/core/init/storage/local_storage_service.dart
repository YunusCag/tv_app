import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static LocalStorageService instance = LocalStorageService._();

  late Box userBox;
  bool isStorageInitialized = false;

  LocalStorageService._();

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    userBox = await Hive.openBox(_LocalStorageKeys.USER_BOX_NAME);
    this.isStorageInitialized = true;
  }

  bool _isUserFistTime = true;

  bool get isUserFirstTime =>
      userBox.get(_LocalStorageKeys.USER_FIRST_TIME, defaultValue: true);

  void set isUserFirstTime(bool value) =>
      userBox.put(_LocalStorageKeys.USER_FIRST_TIME, value);

  bool _isDarkMode = true;

  bool get isDarkMode =>
      userBox.get(_LocalStorageKeys.USER_THEME_MODE, defaultValue: true);

  void set isDarkMode(bool value) =>
      userBox.put(_LocalStorageKeys.USER_THEME_MODE, value);
}

class _LocalStorageKeys {
  _LocalStorageKeys._();

  //user box
  static const String USER_BOX_NAME = "user_box";
  static const String USER_FIRST_TIME = "first_time";
  static const String USER_THEME_MODE = "theme_mode";
}
