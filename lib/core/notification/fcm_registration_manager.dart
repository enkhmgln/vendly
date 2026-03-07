import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';

class FcmRegistrationManager {
  FcmRegistrationManager._();

  static final FcmRegistrationManager shared = FcmRegistrationManager._();

  StreamSubscription<String>? _tokenRefreshSubscription;
  Future<String?> ensureToken() async {
    try {
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.denied ||
          settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        return null;
      }
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null && token.isNotEmpty) {
        await DeviceStoreManager.shared.write(kFcmToken, token);
        return token;
      }
    } catch (_) {}
    return null;
  }

  Future<void> init() async {
    await ensureToken();
    _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = FirebaseMessaging.instance.onTokenRefresh
        .listen((String newToken) async {
          if (newToken.isEmpty) return;
          await DeviceStoreManager.shared.write(kFcmToken, newToken);
        });
  }

  void dispose() {
    _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }
}
