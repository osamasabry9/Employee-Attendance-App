import 'package:employee_attendance/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: ListView(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 50.r,
            ),
            SizedBox(height: AppSpacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Ossama", style: AppFonts.h3),
                SizedBox(height: AppSpacing.xs),
                Text(
                  "Manager",
                  style: AppFonts.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
            SizedBox(height: AppSpacing.md),
            ListTile(
              leading: const Icon(Iconsax.user),
              trailing: const Icon(Iconsax.arrow_right_3),
              title: const Text('Profile'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Iconsax.notification),
              trailing: const Icon(Iconsax.arrow_right_3),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Iconsax.security),
              trailing: const Icon(Iconsax.arrow_right_3),
              title: const Text('Privacy & Security'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Iconsax.info_circle),
              trailing: const Icon(Iconsax.arrow_right_3),
              title: const Text('About'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Iconsax.logout,
                  color: Colors
                      .red), // Assuming AppColors.error is replaced with Colors.red
              title: const Text('Logout'),
              textColor: Colors
                  .red, // Assuming AppColors.error is replaced with Colors.red
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
