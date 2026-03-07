import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '/app/routes/app_pages.dart';
import '/components/main/app_base_controller.dart';

class WelcomeController extends AppBaseController {
  static const String _videoAsset = 'assets/background-video.mp4';

  late final VideoPlayerController videoController;
  final isVideoInitialized = false.obs;
  final isPlaying = true.obs;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.asset(_videoAsset)
      ..initialize().then((_) {
        if (!isClosed) {
          isVideoInitialized.value = true;
          videoController.setLooping(true);
          videoController.setVolume(0);
          videoController.play();
        }
      });
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }

  void togglePlayPause() {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }

  void goToCreateAccount() => AppPages.goToCreateAccount();

  void goToLogin() => AppPages.goToLogin();
}
