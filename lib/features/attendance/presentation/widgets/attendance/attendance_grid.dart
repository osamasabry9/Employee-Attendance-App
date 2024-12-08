import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_theme.dart';
import 'attendance_stats_card.dart';

class AttendanceGrid extends StatelessWidget {
  final DateTime? lastCheckIn;
  final DateTime? lastCheckOut;
  final bool isCheckedIn;

  const AttendanceGrid({
    super.key,
    required this.lastCheckIn,
    required this.lastCheckOut,
    required this.isCheckedIn,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.4,
      children: [
        AttendanceStatsCard(
          icon: Iconsax.login,
          title: 'Check In',
          time: lastCheckIn != null
              ? TimeOfDay.fromDateTime(lastCheckIn!).format(context)
              : '--:--',
          subtitle: isCheckedIn ? 'Checked In' : 'Not Checked In',
        ),
        AttendanceStatsCard(
          icon: Iconsax.logout,
          title: 'Check Out',
          time: lastCheckOut != null
              ? TimeOfDay.fromDateTime(lastCheckOut!).format(context)
              : '--:--',
          subtitle: lastCheckOut != null ? 'Checked Out' : 'Not Checked Out',
        ),
        const AttendanceStatsCard(
          icon: Iconsax.coffee,
          title: 'Break Time',
          time: '00:30',
          subtitle: 'Avg Time 30 min',
        ),
        const AttendanceStatsCard(
          icon: Iconsax.calendar,
          title: 'Total Days',
          time: '28',
          subtitle: 'Working Days',
        ),
      ],
    );
  }
}
