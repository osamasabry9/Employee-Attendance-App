import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.h, right: 20.w, left: 20.w),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Iconsax.user),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Iconsax.notification),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Iconsax.security),
              title: const Text('Privacy & Security'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Iconsax.info_circle),
              title: const Text('About'),
              onTap: () {},
            ),
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
