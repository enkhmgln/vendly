import '/client/api_client.dart';
import '/client/api_result.dart';
import '/client/response_sender.dart';
import '/client/models/user_model.dart';

class UserApi {
  final ResponseSender _sender = ResponseSender(ApiClient());

  Future<ApiResult<UserModel>> getMe() async {
    return _sender.get('/api/users/me', fromJson: (d) => UserModel.fromJson(d));
  }
}
