import 'package:employee_attendance/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_fonts.dart';

enum AppButtonType { primary, secondary, outline }
enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _getIconSize()),
          SizedBox(width: 8.w),
          Text(text, style: _getTextStyle()),
        ],
      );
    }

    return Text(text, style: _getTextStyle());
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return 32.h;
      case AppButtonSize.medium:
        return 40.h;
      case AppButtonSize.large:
        return 48.h;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16.sp;
      case AppButtonSize.medium:
        return 20.sp;
      case AppButtonSize.large:
        return 24.sp;
    }
  }

  TextStyle _getTextStyle() {
    return AppFonts.labelLarge.copyWith(
      color: _getTextColor(),
      fontSize: _getTextSize(),
    );
  }

  double _getTextSize() {
    switch (size) {
      case AppButtonSize.small:
        return 12.sp;
      case AppButtonSize.medium:
        return 14.sp;
      case AppButtonSize.large:
        return 16.sp;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case AppButtonType.primary:
        return AppColors.textPrimary;
      case AppButtonType.secondary:
        return AppColors.primary;
      case AppButtonType.outline:
        return AppColors.primary;
    }
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getTextColor(),
      elevation: _getElevation(),
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: _getBorderSide(),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case AppButtonType.primary:
        return AppColors.primary;
      case AppButtonType.secondary:
        return AppColors.primary.withOpacity(0.1);
      case AppButtonType.outline:
        return Colors.transparent;
    }
  }

  double _getElevation() {
    switch (type) {
      case AppButtonType.primary:
        return 2;
      case AppButtonType.secondary:
      case AppButtonType.outline:
        return 0;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w);
      case AppButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16.w);
      case AppButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 24.w);
    }
  }

  BorderSide _getBorderSide() {
    switch (type) {
      case AppButtonType.outline:
        return const BorderSide(color: AppColors.primary);
      default:
        return BorderSide.none;
    }
  }
}
