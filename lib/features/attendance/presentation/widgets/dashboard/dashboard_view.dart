import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/error_view.dart';
import '../../../../../core/widgets/loading_view.dart';
import '../../cubit/attendance_cubit.dart';
import '../../cubit/attendance_state.dart';
import 'dashboard_content.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<AttendanceCubit>().getAttendances();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AttendanceCubit, AttendanceState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message ?? 'An error occurred'),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingView(
              message: 'Loading attendance data...',
            ),
            loading: () => const LoadingView(
              message: 'Updating attendance...',
            ),
            error: (error) => ErrorView(
              message: error.message ?? 'Failed to load attendance data',
              onRetry: () => context.read<AttendanceCubit>().getAttendances(),
              icon: Iconsax.warning_2,
              retryText: 'Refresh',
            ),
            loaded: (attendances, isCheckedIn, lastCheckIn, lastCheckOut) {
              return DashboardContent(
                attendances: attendances,
                isCheckedIn: isCheckedIn,
                lastCheckIn: lastCheckIn,
                lastCheckOut: lastCheckOut,
                selectedDate: selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
