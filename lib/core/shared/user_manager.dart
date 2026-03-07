import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/client/models/user_model.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';

class UserManager {
  UserManager._();

  static bool get isOnboardingCompleted =>
      DeviceStoreManager.shared.data<bool>(kOnboardingCompleted) ?? false;

  static bool get isLogged => UserStoreManager.shared.hasData(kToken);

  static String get fcmToken =>
      DeviceStoreManager.shared.data<String>(kFcmToken) ?? '';

  static String get token => UserStoreManager.shared.data<String>(kToken) ?? '';

  static UserModel? get user {
    final json = UserStoreManager.shared.jsonData(kUser);
    return json != null ? UserModel.fromJson(json) : null;
  }

  static UserModel? get profileInfo {
    final json = UserStoreManager.shared.jsonData(kProfileUser);
    return json != null ? UserModel.fromJson(json) : null;
  }

  static String get os => switch (defaultTargetPlatform) {
    TargetPlatform.android => 'android',
    TargetPlatform.iOS => 'ios',
    _ => '',
  };

  static Future<String> get deviceModel async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => (await deviceInfoPlugin.androidInfo).model,
      TargetPlatform.iOS => (await deviceInfoPlugin.iosInfo).model,
      _ => '',
    };
  }

  static Future<String> get deviceId async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => (await deviceInfoPlugin.androidInfo).id,
      TargetPlatform.iOS =>
        (await deviceInfoPlugin.iosInfo).identifierForVendor ?? 'EMPTYID',
      _ => '',
    };
  }

  static Future<String> get version async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> get appVersion async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version}-${packageInfo.buildNumber}';
  }
}
