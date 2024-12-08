import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../domain/entities/leave.dart';
import '../cubit/leave_cubit.dart';
import '../cubit/leave_state.dart';
import '../widgets/leave_status_badge.dart';
import '../widgets/leave_action_buttons.dart';
import '../widgets/leave_info_card.dart';

class LeaveDetailScreen extends StatelessWidget {
  final String leaveId;

  const LeaveDetailScreen({
    Key? key,
    required this.leaveId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeaveCubit>()..fetchLeaveById(leaveId),
      child: const LeaveDetailView(),
    );
  }
}

class LeaveDetailView extends StatelessWidget {
  const LeaveDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Leave Details'),
      ),
      body: BlocBuilder<LeaveCubit, LeaveState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox(),
            loading: () => const LoadingView(),
            error: (message) => ErrorView(
              message: message,
              onRetry: () => context.read<LeaveCubit>().fetchLeaves(),
            ),
            leaveById: (leave) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeaveInfoCard(leave: leave),
                  const SizedBox(height: 16),
                  LeaveStatusBadge(status: leave.status),
                  const SizedBox(height: 16),
                  if (leave.status == LeaveStatus.pending)
                    LeaveActionButtons(leave: leave),
                ],
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
