import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppFonts {
  static const String fontFamily = 'Poppins';

  // Headings
  static TextStyle get h1 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get h2 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get h3 => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Labels and Buttons
  static TextStyle get labelLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Special Cases
  static TextStyle get timeDisplay => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get dateDisplay => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get statusText => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Helper methods for color variants
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}

// Keeping AppTypography for backward compatibility
// but marking it as deprecated
@Deprecated('Use AppFonts instead')
class AppTypography {
  static TextStyle get headline => AppFonts.h1;
  static TextStyle get title => AppFonts.h2;
  static TextStyle get subtitle => AppFonts.h3;
  static TextStyle get body1 => AppFonts.bodyLarge;
  static TextStyle get body2 => AppFonts.bodyMedium;
  static TextStyle get button => AppFonts.labelLarge;
  static TextStyle get caption => AppFonts.bodySmall;
  static TextStyle get dateText => AppFonts.dateDisplay;
  static TextStyle get dayText => AppFonts.labelMedium;
  static TextStyle get timeText => AppFonts.timeDisplay;
  static TextStyle get statusText => AppFonts.statusText;
}
