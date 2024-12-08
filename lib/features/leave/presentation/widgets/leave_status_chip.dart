import 'package:flutter/material.dart';
import '../../domain/entities/leave.dart';

class LeaveStatusChip extends StatelessWidget {
  final LeaveStatus status;

  const LeaveStatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getStatusIcon(status),
            size: 16,
            color: _getStatusColor(status),
          ),
          const SizedBox(width: 4),
          Text(
            _getStatusText(status),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _getStatusColor(status),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return Colors.orange;
      case LeaveStatus.approved:
        return Colors.green;
      case LeaveStatus.rejected:
        return Colors.red;
      case LeaveStatus.cancelled:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return Icons.schedule;
      case LeaveStatus.approved:
        return Icons.check_circle;
      case LeaveStatus.rejected:
        return Icons.cancel;
      case LeaveStatus.cancelled:
        return Icons.block;
    }
  }

  String _getStatusText(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return 'Pending';
      case LeaveStatus.approved:
        return 'Approved';
      case LeaveStatus.rejected:
        return 'Rejected';
      case LeaveStatus.cancelled:
        return 'Cancelled';
    }
  }
}
