import '/client/api_client.dart';
import '/client/api_result.dart';
import '/client/models/auth_model.dart';
import '/client/response_sender.dart';

class AuthApi {
  AuthApi._();

  static final _sender = ResponseSender(ApiClient());

  static Future<ApiResult<SignupModel>> signup({
    required String email,
    required String password,
  }) async {
    return _sender.post<SignupModel>(
      '/api/auth/otp',
      data: {'email': email, 'password': password, 'purpose': 0},
      fromJson: (d) => SignupModel.fromJson(d),
    );
  }

  static Future<ApiResult<AuthSessionModel>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return _sender.post<AuthSessionModel>(
      '/api/auth/otp/verify',
      data: {'email': email, 'otp': otp, 'purpose': 0},
      fromJson: (d) => AuthSessionModel.fromJson(d as Map<String, dynamic>),
    );
  }

  static Future<ApiResult<AuthSessionModel>> login({
    required String email,
    required String password,
  }) async {
    return _sender.post<AuthSessionModel>(
      '/api/auth/login',
      data: {'email': email, 'password': password},
      fromJson: (d) => AuthSessionModel.fromJson(d as Map<String, dynamic>),
    );
  }
}
