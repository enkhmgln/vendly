import 'package:flutter/material.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'GIP';

  // ----- Heading 1 (28)
  static const TextStyle heading1Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle heading1Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.2,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle heading1Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.2,
    fontWeight: FontWeight.w400,
  );

  // ----- Heading 2 (24)
  static const TextStyle heading2Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle heading2Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle heading2Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  // ----- Heading 3 (20)
  static const TextStyle heading3Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle heading3Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );

  // ----- Display / hero (56)
  static const TextStyle displayBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 56,
    height: 1.25,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  );

  // ----- Title large (18)
  static const TextStyle titleLargeBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle titleLargeMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleLargeRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.3,
    fontWeight: FontWeight.w400,
  );

  // ----- Title medium (17)
  static const TextStyle titleMediumBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle titleMediumMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleMediumRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 1.3,
    fontWeight: FontWeight.w400,
  );

  // ----- Body large (16)
  static const TextStyle bodyLargeBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bodyLargeMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  // ----- Body medium (15)
  static const TextStyle bodyMediumBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bodyMediumMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  // ----- Body small (14)
  static const TextStyle bodySmallBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bodySmallMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w400,
  );

  // ----- Caption (13)
  static const TextStyle captionBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  // ----- Label (12)
  static const TextStyle labelBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w400,
  );

  /// TextTheme for ThemeData so theme.textTheme.* uses these styles.
  static TextTheme get textTheme => TextTheme(
    displayLarge: displayBold,
    headlineLarge: heading1Bold,
    headlineMedium: heading1Bold,
    headlineSmall: heading2Bold,
    titleLarge: titleLargeBold,
    titleMedium: titleMediumBold,
    titleSmall: titleMediumMedium,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: bodyMedium,
    labelMedium: bodySmall,
    labelSmall: label,
  );
}
