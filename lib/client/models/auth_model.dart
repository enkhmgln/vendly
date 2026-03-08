import 'user_model.dart';

class SignupModel {
  const SignupModel({required this.email});
  final String email;
  factory SignupModel.fromJson(dynamic json) =>
      SignupModel(email: json as String);
}

class VerifyOtpModel {
  const VerifyOtpModel({
    required this.accessToken,
    required this.expiresIn,
    required this.user,
  });
  final String accessToken;
  final int expiresIn;
  final UserModel user;
  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
