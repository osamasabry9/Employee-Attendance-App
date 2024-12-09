import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';

import '../../../leave/presentation/screens/leave_list_screen.dart';

import '../cubit/attendance_cubit.dart';
import '../cubit/attendance_state.dart';
import '../widgets/dashboard/dashboard_view.dart';
import 'activity_history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;
  final List<Widget> _pages = [
    const DashboardView(),
    const ActivityHistoryScreen(),
    const SizedBox(),
    const LeaveListScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<AttendanceCubit>().getAttendances();
    _tabController = TabController(length: 5, vsync: this);
  }

  onTapChange(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController!.index = _selectedIndex;
    });
  }

  void _handleAttendanceAction() async {
    try {
      final state = context.read<AttendanceCubit>().state;

      state.maybeWhen(
        loaded: (attendances, isCheckedIn, lastCheckIn, lastCheckOut) async {
          final cubit = context.read<AttendanceCubit>();

          // Find today's attendance record
          final todayAttendance = attendances
              .where((a) => DateUtils.isSameDay(a.date, DateTime.now()))
              .firstOrNull;

          if (isCheckedIn && todayAttendance != null) {
            // Check out
            await cubit.checkOut(
              id: todayAttendance.id,
              location: 'Office',
            );
          } else if (!isCheckedIn && todayAttendance == null) {
            // Check in
            await cubit.checkIn(
              userId: 'current_user',
              location: 'Office',
            );
          }
        },
        orElse: () {},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16.w),
        ),
      );
    }
  }

  void _handleStateChanges(BuildContext context, AttendanceState state) {
    state.maybeWhen(
      error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'An error occurred'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.w),
          ),
        );
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceCubit, AttendanceState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: _pages[_selectedIndex],
          floatingActionButton: state.maybeWhen(
            loaded: (attendances, isCheckedIn, lastCheckIn, lastCheckOut) {
              final bool isWeekend =
                  DateTime.now().weekday == DateTime.saturday ||
                      DateTime.now().weekday == DateTime.sunday;

              // Find today's attendance record
              final todayAttendance = attendances
                  .where((a) => DateUtils.isSameDay(a.date, DateTime.now()))
                  .firstOrNull;

              final bool hasCompletedToday =
                  todayAttendance != null && todayAttendance.checkOut != null;

              if (isWeekend || hasCompletedToday) {
                return FloatingActionButton(
                  onPressed: null,
                  backgroundColor: AppColors.success,
                  child: Icon(
                    Iconsax.tick_circle,
                    color: AppColors.textPrimary,
                    size: 24.sp,
                  ),
                );
              }

              return FloatingActionButton(
                onPressed: _handleAttendanceAction,
                backgroundColor:
                    isCheckedIn ? AppColors.error : AppColors.primary,
                child: Icon(
                  isCheckedIn ? Iconsax.login_1 : Iconsax.logout,
                  color: Colors.white,
                  size: 24.sp,
                ),
              );
            },
            orElse: () => FloatingActionButton(
              onPressed: _handleAttendanceAction,
              backgroundColor: AppColors.primary,
              child: Icon(
                Iconsax.login,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onTapChange,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.iconInactive,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home, size: 24.sp),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.calendar, size: 24.sp),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(null, size: 5.sp),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_2user, size: 24.sp),
                label: 'Leave',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting, size: 24.sp),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
