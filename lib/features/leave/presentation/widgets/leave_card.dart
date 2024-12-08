import 'package:flutter/material.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/entities/leave.dart';
import '../screens/leave_detail_screen.dart';
import 'leave_status_chip.dart';

class LeaveCard extends StatelessWidget {
  final Leave leave;

  const LeaveCard({
    super.key,
    required this.leave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LeaveDetailScreen(leaveId: leave.id),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    leave.type.name.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  LeaveStatusChip(status: leave.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${AppDateUtils.formatDate(leave.startDate)} - ${AppDateUtils.formatDate(leave.endDate)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                '${AppDateUtils.calculateWorkingDays(leave.startDate, leave.endDate)} working days',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (leave.reason.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  leave.reason,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }


}
