import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/attendance_cubit.dart';
import '../cubit/attendance_state.dart';
import '../widgets/activity_list/activity_list_item.dart';
import '../widgets/date_picker_row.dart';

class ActivityHistoryScreen extends StatefulWidget {
  const ActivityHistoryScreen({super.key});

  @override
  State<ActivityHistoryScreen> createState() => _ActivityHistoryScreenState();
}

class _ActivityHistoryScreenState extends State<ActivityHistoryScreen> {
  DateTime _selectedDate = DateTime.now();
  late final AttendanceCubit _attendanceCubit;

  @override
  void initState() {
    super.initState();
    _attendanceCubit = getIt<AttendanceCubit>()..getAttendances();
  }

  @override
  void dispose() {
    _attendanceCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _attendanceCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Activity History',
            style: AppFonts.h2,
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
        body: BlocBuilder<AttendanceCubit, AttendanceState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: Text(error.message ?? 'Something went wrong'),
              ),
              loaded: (attendances, isCheckedIn, lastCheckIn, lastCheckOut) {
                final filteredAttendances = attendances
                    .where((attendance) =>
                        _selectedDate.year == attendance.date.year &&
                        _selectedDate.month == attendance.date.month)
                    .toList();

                return Column(
                  children: [
                    DatePickerRow(
                      selectedDate: _selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Activities',
                            style: AppFonts.h3,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              filteredAttendances.length.toString(),
                              style: AppFonts.bodyLarge.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: filteredAttendances.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.event_busy,
                                    size: 64.w,
                                    color: AppColors.textSecondary,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'No activities found',
                                    style: AppFonts.bodyLarge.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: filteredAttendances.length,
                              itemBuilder: (context, index) {
                                final attendance = filteredAttendances[index];
                                return ActivityListItem(
                                  attendance: attendance,
                                  onTap: () {
                                    // TODO: Show attendance details
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
