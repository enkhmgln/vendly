import 'user_model.dart';

class SignupModel {
  const SignupModel({required this.email});
  final String email;
  factory SignupModel.fromJson(String json) => SignupModel(email: json);
}

class AuthSessionModel {
  const AuthSessionModel({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshExpiresIn,
    required this.user,
  });
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final int refreshExpiresIn;
  final UserModel user;
  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      refreshToken: json['refresh_token'] as String,
      refreshExpiresIn: json['refresh_expires_in'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
