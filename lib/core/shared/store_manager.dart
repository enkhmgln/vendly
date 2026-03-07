import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '/core/constants/config.dart';

class StoreManager {
  late GetStorage store;
  late String path;

  Future<void> initStore(String storeName) async {
    path = await dataBasePath;
    await GetStorage(storeName, path).initStorage;
    store = GetStorage(storeName, path);
    debugPrint(path);
  }

  Future<String> get dataBasePath async {
    final tempDir = await getApplicationDocumentsDirectory();
    return '${tempDir.path}/dataHiveStore';
  }

  Map<String, dynamic>? mapData(String key) {
    final value = store.read(key);
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return null;
  }

  Map<String, dynamic>? jsonData(String key) => mapData(key);

  List<Map<String, dynamic>> listMapData(String key) {
    final list = store.read<List<dynamic>>(key);
    if (list == null) return [];
    return list
        .map(
          (e) => e is Map<String, dynamic>
              ? e
              : e is Map
              ? Map<String, dynamic>.from(e)
              : <String, dynamic>{},
        )
        .toList();
  }

  T? data<T>(String key) => store.read<T>(key);

  bool hasData(String key) => store.hasData(key);

  Future<void> write(String key, dynamic value) async {
    await store.write(key, value);
  }

  Future<void> deleteKey(String key) async {
    await store.remove(key);
  }

  Future<void> deleteStore() async {
    await store.erase();
  }
}

class UserStoreManager extends StoreManager {
  UserStoreManager._();
  static final UserStoreManager shared = UserStoreManager._();

  Future<void> init() async {
    return super.initStore(kStoreUser);
  }
}

class DeviceStoreManager extends StoreManager {
  DeviceStoreManager._();
  static final DeviceStoreManager shared = DeviceStoreManager._();

  Future<void> init() async {
    return super.initStore(kStoreDevice);
  }
}

/// Clear every persisted store used by the app.
Future<void> clearAllStores() async {
  await Future.wait([
    UserStoreManager.shared.deleteStore(),
    DeviceStoreManager.shared.deleteStore(),
  ]);
}

/// Clear only user-related store (tokens, profile, flags) but keep device store
/// intact (e.g., walkthrough flag, FCM token).
Future<void> clearUserStore() async {
  await UserStoreManager.shared.deleteStore();
}
