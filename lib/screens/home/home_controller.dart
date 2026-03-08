import '/client/models/user_model.dart';
import '/components/main/app_base_controller.dart';
import '/core/shared/user_manager.dart';

class HomeController extends AppBaseController {
  HomeController();

  /// Current user from storage (set after verify OTP).
  UserModel? get user => UserManager.user;
}
