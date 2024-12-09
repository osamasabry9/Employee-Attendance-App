import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../domain/entities/leave.dart';
import '../cubit/leave_cubit.dart';
import '../cubit/leave_state.dart';
import '../widgets/leave_list_view.dart';
import '../widgets/leave_stats_section.dart';
import 'apply_leave_screen.dart';

class LeaveListScreen extends StatefulWidget {
  const LeaveListScreen({super.key});

  @override
  State<LeaveListScreen> createState() => _LeaveListScreenState();
}

class _LeaveListScreenState extends State<LeaveListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<LeaveCubit>().getLeaves();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaveCubit, LeaveState>(
      listener: _handleStateChanges,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, LeaveState state) {
    state.maybeWhen(
      leaveUpdated: () {
        _showSnackBar(
          'Leave status updated successfully',
          backgroundColor: AppColors.success,
        );
      },
      error: (message) {
        _showSnackBar(
          message,
          backgroundColor: Colors.red,
        );
      },
      orElse: () {},
    );
  }

  void _showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? AppColors.primary,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(
        'All Leaves',
        style: AppFonts.h3,
      ),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.add),
          onPressed: () => _navigateToApplyLeave(),
        ),
        IconButton(
          icon: const Icon(Iconsax.setting_2),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LeaveCubit, LeaveState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingView(),
          initial: () => const LoadingView(),
          loading: () => const LoadingView(),
          error: (message) => ErrorView(
            message: message,
            onRetry: () => context.read<LeaveCubit>().getLeaves(),
          ),
          loaded: _buildLoadedContent,
        );
      },
    );
  }

  Widget _buildLoadedContent(
    List<Leave> leaves,
    LeaveStats stats,
    List<Leave> upcomingLeaves,
    List<Leave> pastLeaves,
    List<Leave> teamLeaves,
  ) {
    return Column(
      children: [
        LeaveStatsSection(stats: stats),
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
            Tab(text: 'Team'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              LeaveListView(leaves: upcomingLeaves),
              LeaveListView(leaves: pastLeaves),
              LeaveListView(
                leaves: teamLeaves,
                isTeamLeave: true,
                onUpdateStatus: _updateLeaveStatus,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToApplyLeave() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ApplyLeaveScreen(),
      ),
    );
  }

  void _updateLeaveStatus(String leaveId, LeaveStatus status) {
    try {
      context.read<LeaveCubit>().updateLeaveStatus(
        leaveId: leaveId,
        status: status,
      );
    } catch (e) {
      _showSnackBar(
        'Failed to update leave status: $e',
        backgroundColor: Colors.red,
      );
    }
  }
}
