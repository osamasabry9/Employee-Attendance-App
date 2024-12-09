import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';

class DatePickerRow extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerRow({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  List<DateTime> _getDates() {
    final dates = <DateTime>[];
    final now = DateTime.now();
    // Show today and future dates
    for (var i = 0; i <= 15; i++) {
      dates.add(now.add(Duration(days: i)));
    }
    return dates;
  }

  Color _getDateColor(DateTime date, bool isSelected) {
    if (isSelected) return Colors.white;
    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      return AppColors.error;
    }
    return AppColors.textSecondary;
  }

  Color _getBackgroundColor(DateTime date, bool isSelected) {
    if (isSelected) {
      return date.weekday == DateTime.saturday ||
              date.weekday == DateTime.sunday
          ? AppColors.error
          : AppColors.primary;
    }
    if (DateUtils.isSameDay(date, DateTime.now())) {
      return date.weekday == DateTime.saturday ||
              date.weekday == DateTime.sunday
          ? AppColors.error.withOpacity(0.1)
          : AppColors.primary.withOpacity(0.1);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final dates = _getDates();

    return Container(
      height: 90.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = DateUtils.isSameDay(date, selectedDate);
          final isToday = DateUtils.isSameDay(date, DateTime.now());
          final isFriday = date.weekday == DateTime.friday;

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: _getBackgroundColor(date, isSelected),
                borderRadius: BorderRadius.circular(12.r),
                border: isToday && !isSelected
                    ? Border.all(
                        color: isFriday ? AppColors.error : AppColors.primary,
                        width: 1.5,
                      )
                    : null,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color:
                              (isFriday ? AppColors.error : AppColors.primary)
                                  .withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date),
                    style: AppFonts.bodySmall.copyWith(
                      color: _getDateColor(date, isSelected),
                      fontWeight:
                          isFriday || isSelected ? FontWeight.bold : null,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    DateFormat('dd').format(date),
                    style: (isSelected || isToday
                            ? AppFonts.bodyLarge
                            : AppFonts.bodyMedium)
                        .copyWith(
                      color: _getDateColor(date, isSelected),
                      fontWeight:
                          isFriday || isSelected ? FontWeight.bold : null,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  if (isToday)
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : (isFriday ? AppColors.error : AppColors.primary),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
