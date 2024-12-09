import 'package:employee_attendance/features/leave/presentation/widgets/leave_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/leave_cubit.dart';
import '../cubit/leave_state.dart';

class ApplyLeaveScreen extends StatelessWidget {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeaveCubit>(),
      child: const ApplyLeaveView(),
    );
  }
}

class ApplyLeaveView extends StatelessWidget {
  const ApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaveCubit, LeaveState>(
      listener: (context, state) {
        state.maybeWhen(
          leaveApplied: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Leave application submitted successfully'),
                backgroundColor: AppColors.primary,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Apply Leave',
              style: AppFonts.h3,
            ),
          ),
          body: const LeaveForm()),
    );
  }
}
