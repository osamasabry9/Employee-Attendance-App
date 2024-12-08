import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/constants/app_theme.dart';

class UserProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String? imageUrl;
  final VoidCallback onNotificationTap;

  const UserProfileHeader({
    Key? key,
    required this.name,
    required this.role,
    this.imageUrl,
    required this.onNotificationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl!)
                : const AssetImage('assets/images/profile.jpg')
                    as ImageProvider,
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppFonts.h3),
                SizedBox(height: AppSpacing.xs),
                Text(
                  role,
                  style: AppFonts.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            style:
                IconButton.styleFrom(backgroundColor: AppColors.cardBackground),
            onPressed: onNotificationTap,
            icon: const Icon(Iconsax.notification),
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }
}
