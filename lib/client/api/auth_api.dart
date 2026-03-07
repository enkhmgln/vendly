import '/client/api_client.dart';
import '/client/api_result.dart';
import '/client/models/auth_model.dart';
import '/client/response_sender.dart';

class AuthApi {
  AuthApi();

  final ResponseSender _sender = ResponseSender(ApiClient());

  Future<ApiResult<SignupModel>> signup({
    required String email,
    required String password,
  }) async {
    return _sender.post<SignupModel>(
      '/api/auth/signup',
      data: {'email': email, 'password': password},
      fromJson: (d) => SignupModel.fromJson(d),
    );
  }

  Future<ApiResult<VerifyOtpModel>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return _sender.post<VerifyOtpModel>(
      '/api/auth/verify-otp',
      data: {'email': email, 'otp': otp},
      fromJson: (d) => VerifyOtpModel.fromJson(d),
    );
  }
}
