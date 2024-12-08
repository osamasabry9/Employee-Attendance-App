import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/app_theme.dart';
import '../../../domain/entities/attendance.dart';
import 'activity_list_item.dart';

class ActivitySection extends StatelessWidget {
  final List<Attendance> attendances;
  final VoidCallback onViewAll;

  const ActivitySection({
    super.key,
    required this.attendances,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Activity', style: AppFonts.h3),
            TextButton(
              onPressed: onViewAll,
              child: Text(
                'View All',
                style: AppFonts.bodyMedium.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.md),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: attendances.length,
          itemBuilder: (context, index) {
            final attendance = attendances.reversed.toList()[index];
            return ActivityListItem(attendance: attendance);
          },
        ),
      ],
    );
  }
}
