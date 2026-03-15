abstract class AccountStatus {
  AccountStatus._();

  static const int active = 0;
  static const int suspended = 1;
  static const int banned = 2;
  static const int pending = 3; // Registered but OTP not verified yet
}

abstract class UserRole {
  UserRole._();

  static const int user = 0;
  static const int merchant = 1;
}

abstract class OtpPurpose {
  OtpPurpose._();

  static const int register = 0;
  static const int resetPassword = 1;
}
