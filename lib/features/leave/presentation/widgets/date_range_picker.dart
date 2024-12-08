import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatelessWidget {
  final DateTimeRange? initialDateRange;
  final void Function(DateTimeRange) onDateRangeSelected;

  const DateRangePicker({
    super.key,
    this.initialDateRange,
    required this.onDateRangeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final dateRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialDateRange: initialDateRange,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: Theme.of(context).colorScheme.primary,
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      surface: Theme.of(context).colorScheme.surface,
                      onSurface: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              child: child!,
            );
          },
        );

        if (dateRange != null) {
          onDateRangeSelected(dateRange);
        }
      },
      icon: const Icon(Iconsax.calendar),
      label: Text(
        initialDateRange != null
            ? '${formatDate(initialDateRange!.start)} - ${formatDate(initialDateRange!.end)}'
            : 'Select Dates',
      ),
    );
  }


    // Format the DateTime to a readable string
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');  // You can adjust the format
    return formatter.format(date);
  }
}
