import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final IconData icon;
  final String retryText;

  const ErrorView({
    super.key,
    required this.message,
    required this.onRetry,
    this.icon = Iconsax.warning_2,
    this.retryText = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppFonts.bodyLarge.copyWith(
                color: AppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Iconsax.refresh),
              label: Text(
                retryText,
                style: AppFonts.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
