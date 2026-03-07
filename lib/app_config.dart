// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

// import '/core/notification/fcm_registration_manager.dart';
import '/core/shared/store_manager.dart';

abstract class AppConfig {
  AppConfig._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await UserStoreManager.shared.init();
    await DeviceStoreManager.shared.init();
    // await FcmRegistrationManager.shared.init();
  }
}
