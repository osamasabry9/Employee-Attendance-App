import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';


import '../../domain/entities/attendance_record_status.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardView(),
          ActivityHistoryScreen(),
          SizedBox(),
          SizedBox(),
          SettingsScreen(),
        ],
      ),
      floatingActionButton: BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (attendances, isCheckedIn, lastCheckIn, lastCheckOut) {
              return FloatingActionButton(
                onPressed: () async {
                  try {
                    final cubit = context.read<AttendanceCubit>();

                    if (isCheckedIn) {
                      // For check-out, find today's active check-in
                      final todayAttendance = attendances.lastWhere(
                        (a) =>
                            a.status == AttendanceRecordStatus.checkedIn &&
                            a.checkOut == null &&
                            DateUtils.isSameDay(a.date, DateTime.now()),
                        orElse: () =>
                            throw Exception('No active check-in found'),
                      );

                      await cubit.checkOut(
                        id: todayAttendance.id,
                        location: 'Office',
                      );
                    } else {
                      // Check if there's already a completed attendance for today
                      final hasTodayAttendance = attendances.any((a) =>
                          DateUtils.isSameDay(a.date, DateTime.now()) &&
                          a.checkOut != null);

                      if (hasTodayAttendance) {
                        throw Exception(
                            'Already completed attendance for today');
                      }

                      await cubit.checkIn(
                        userId: 'current_user',
                        location: 'Office',
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                },
                elevation: 8,
                backgroundColor: Colors.transparent,
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        isCheckedIn ? AppColors.error : AppColors.primary,
                        isCheckedIn
                            ? AppColors.error.withOpacity(0.8)
                            : AppColors.primary.withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (isCheckedIn ? AppColors.error : AppColors.success)
                                .withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    isCheckedIn ? Iconsax.logout : Iconsax.login,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            activeIcon: Icon(Iconsax.home_15, size: 24.sp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar, size: 24.sp),
            activeIcon: Icon(Iconsax.calendar5, size: 24.sp),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(null, size: 5.sp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_2user, size: 24.sp),
            activeIcon: Icon(Iconsax.profile_2user5, size: 24.sp),
            label: 'Leave',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting, size: 24.sp),
            activeIcon: Icon(Iconsax.setting5, size: 24.sp),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}


/*
 CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ActivityHistoryScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: getIt<LeaveCubit>(),
                    child: const LeaveListScreen(),
                  ),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              break;
          }
        },
      ),
*/
