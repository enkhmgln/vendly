import '/client/api_client.dart';
import '/client/api_result.dart' show ApiResult;
import '/client/models/profile_update_model.dart';
import '/client/response_sender.dart';

class UserApi {
  final ResponseSender _sender = ResponseSender(ApiClient());

  Future<ApiResult<Map<String, dynamic>>> updateProfile(
    ProfileUpdatePayload payload,
  ) async {
    final body = payload.toJson();
    return _sender.patch<Map<String, dynamic>>(
      '/api/users/profile',
      data: body,
      fromJson: (d) => Map<String, dynamic>.from(d as Map),
    );
  }
}
