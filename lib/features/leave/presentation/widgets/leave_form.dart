import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../cubit/leave_cubit.dart';
import 'form_fields/leave_date_field.dart';
import 'form_fields/leave_text_field.dart';
import 'form_fields/leave_type_dropdown.dart';

class LeaveForm extends StatefulWidget {
  const LeaveForm({super.key});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _reasonController = TextEditingController();
  final _contactController = TextEditingController();
  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  DateTime _endDate = DateTime.now().add(const Duration(days: 2));
  String _selectedLeaveType = 'Medical Leave';

  final _leaveTypes = [
    'Medical Leave',
    'Vacation Leave',
    'Personal Leave',
    'Other',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _reasonController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeaveTextField(
              label: 'Title',
              controller: _titleController,
              hint: 'Sick Leave',
            ),
            const SizedBox(height: 16),
            LeaveTypeDropdown(
              value: _selectedLeaveType,
              items: _leaveTypes,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedLeaveType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            LeaveTextField(
              label: 'Contact Number',
              controller: _contactController,
              hint: '(603) 555-0123',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            LeaveDateField(
              label: 'Start Date',
              value: _startDate,
              onTap: () => _selectDate(context, true),
            ),
            const SizedBox(height: 16),
            LeaveDateField(
              label: 'End Date',
              value: _endDate,
              onTap: () => _selectDate(context, false),
            ),
            const SizedBox(height: 16),
            LeaveTextField(
              label: 'Reason for Leave',
              controller: _reasonController,
              hint: 'I need to take a medical leave.',
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Apply Leave',
                  style: AppFonts.bodyLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: isStartDate ? _startDate : _endDate,
        firstDate: isStartDate
            ? DateTime.now().add(const Duration(days: 1))
            : _startDate.add(const Duration(days: 1)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                surface: AppColors.surface,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: AppColors.background,
            ),
            child: child ?? const SizedBox(),
          );
        },
      );

      if (picked != null && mounted) {
        setState(() {
          if (isStartDate) {
            _startDate = DateTime(
              picked.year,
              picked.month,
              picked.day,
              DateTime.now().hour,
              DateTime.now().minute,
            );
            if (_endDate.isBefore(_startDate)) {
              _endDate = _startDate.add(const Duration(days: 1));
            }
          } else {
            _endDate = DateTime(
              picked.year,
              picked.month,
              picked.day,
              23,
              59,
            );
          }
        });
      }
    } catch (e) {
      debugPrint('Error selecting date: $e');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_endDate.isBefore(_startDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('End date cannot be before start date'),
            backgroundColor: Colors.red,
          ),
        );
        
      } else {
        context.read<LeaveCubit>().applyLeave(
              type: _selectedLeaveType,
              startDate: _startDate,
              endDate: _endDate,
              reason: _reasonController.text.trim(),
            );
      }
    }
  }
}
