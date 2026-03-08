import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '/components/_.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';
import '/screens/_.dart';

class PermissionEntry {
  PermissionEntry({
    required this.title,
    required this.description,
    required this.permission,
    this.optional = false,
  });

  final String title;
  final String description;
  final Permission permission;
  final bool optional;
}

class PermissionsController extends AppBaseController {
  PermissionsController() {
    entries = [
      PermissionEntry(
        title: 'Push мэдэгдэл',
        description:
            '$appName-оос таны бүртгэл, захиалгатай холбоотой чухал мэдэгдэл хүлээн авна.',
        permission: Permission.notification,
      ),
      PermissionEntry(
        title: 'Байршил',
        description:
            'Төлбөр, хүргэлтийн үйлчилгээнд байршил шаардлагатай байж болно.',
        permission: Permission.location,
      ),
      PermissionEntry(
        title: 'Камер',
        description:
            '$appName камерыг бүтээгдэхүүн, төлбөрийн бар код, QR код уншихад ашиглана.',
        permission: Permission.camera,
        optional: true,
      ),
      PermissionEntry(
        title: 'Микрофон',
        description:
            'Төхөөрөмжийн аудио портоор холбогдсон карт уншигчтай ажиллана.',
        permission: Permission.microphone,
        optional: true,
      ),
      PermissionEntry(
        title: 'Bluetooth',
        description:
            '$appName карт уншигч, дагалдах хэрэгсэлтэй холбогдоход Bluetooth ашиглана.',
        permission: Permission.bluetooth,
        optional: true,
      ),
    ];
    requested.value = List.filled(entries.length, false);
    granted.value = List.filled(entries.length, false);
  }

  late final List<PermissionEntry> entries;

  /// True after user has tapped this row and we requested the permission.
  final requested = Rx<List<bool>>([]);

  /// True if permission was granted after request.
  final granted = Rx<List<bool>>([]);

  /// Required permission indices (Push, Location). Дараах enabled only when both are requested.
  static const requiredIndices = [0, 1];

  bool get canProceed {
    final r = requested.value;
    return requiredIndices.every((i) => i < r.length && r[i]);
  }

  Future<void> onPermissionTap(int index) async {
    if (index < 0 || index >= entries.length) return;
    final nextRequested = List<bool>.from(requested.value);
    if (index < nextRequested.length) {
      nextRequested[index] = true;
      requested.value = nextRequested;
    }
    final status = await entries[index].permission.request();
    final nextGranted = List<bool>.from(granted.value);
    if (index < nextGranted.length) {
      nextGranted[index] = status.isGranted;
      granted.value = nextGranted;
    }
    if (!status.isGranted) {
      final openSettings = await showWarning(
        text: 'Зөвшөөрөл татгалзсан. Тохиргооноос идэвхжүүлж болно.',
        titleText: 'Зөвшөөрөл',
        acceptText: 'Нээх',
        cancelText: 'Хаах',
      );
      if (openSettings == true) {
        await openAppSettings();
      }
    }
  }

  Future<void> onNext() async {
    await DeviceStoreManager.shared.write(kPermissionsCompleted, true);
    Get.offAllNamed(TabBarScreen.routeName);
  }
}
