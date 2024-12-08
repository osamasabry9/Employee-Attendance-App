import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/leave.dart';
import '../../domain/usecases/update_leave_status.dart';
import '../cubit/leave_cubit.dart';

class LeaveActionButtons extends StatelessWidget {
  final Leave leave;

  const LeaveActionButtons({
    Key? key,
    required this.leave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leave.status != LeaveStatus.pending) {
      return const SizedBox();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () =>
                    _updateLeaveStatus(context, LeaveStatus.rejected),
                child: const Text('Reject'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: () =>
                    _updateLeaveStatus(context, LeaveStatus.approved),
                child: const Text('Approve'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateLeaveStatus(BuildContext context, LeaveStatus status) {
    context.read<LeaveCubit>().updateLeaveStatusEmit(
          UpdateLeaveStatusParams(
            id: leave.id,
            status: status,
          ),
        );
  }
}
