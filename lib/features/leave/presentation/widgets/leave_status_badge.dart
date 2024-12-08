import 'package:flutter/material.dart';
import '../../domain/entities/leave.dart';

class LeaveStatusBadge extends StatelessWidget {
  final LeaveStatus status;

  const LeaveStatusBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case LeaveStatus.approved:
        return Colors.green;
      case LeaveStatus.pending:
        return Colors.orange;
      case LeaveStatus.rejected:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
