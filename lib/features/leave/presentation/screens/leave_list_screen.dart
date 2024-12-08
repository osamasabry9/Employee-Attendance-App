import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../domain/entities/leave.dart';
import '../cubit/leave_cubit.dart';
import '../cubit/leave_state.dart';
import '../widgets/apply_leave_dialog.dart';
import '../widgets/leave_status_badge.dart';

class LeaveListScreen extends StatelessWidget {
  const LeaveListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LeaveCubit>()..fetchLeaves(),
      child: const LeaveListView(),
    );
  }
}

class LeaveListView extends StatelessWidget {
  const LeaveListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Requests'),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add),
            onPressed: () => _showApplyLeaveDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<LeaveCubit, LeaveState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const LoadingView(),
            error: (message) => ErrorView(
              message: message,
              onRetry: () {},
            ),
            loaded: (leaves) => _LeaveList(leaves: leaves),
            leaveById: (_) => const SizedBox(), // Not used in list view
          );
        },
      ),
    );
  }

  void _showApplyLeaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<LeaveCubit>(),
        child: const ApplyLeaveDialog(),
      ),
    );
  }
}

class _LeaveList extends StatelessWidget {
  final List<Leave> leaves;

  const _LeaveList({required this.leaves});

  @override
  Widget build(BuildContext context) {
    if (leaves.isEmpty) {
      return const Center(
        child: Text('No leave requests found'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: leaves.length,
      itemBuilder: (context, index) {
        final leave = leaves[index];
        return _LeaveListItem(leave: leave);
      },
    );
  }
}

class _LeaveListItem extends StatelessWidget {
  final Leave leave;

  const _LeaveListItem({required this.leave});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          context.go('/leave/${leave.id}');
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
                  LeaveStatusBadge(status: leave.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${_formatDate(leave.startDate)} - ${_formatDate(leave.endDate)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                leave.reason,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
