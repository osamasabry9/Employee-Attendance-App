import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/leave.dart';
import '../cubit/leave_cubit.dart';
import '../cubit/leave_state.dart';

class ApplyLeaveDialog extends StatefulWidget {
  const ApplyLeaveDialog({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveDialog> createState() => _ApplyLeaveDialogState();
}

class _ApplyLeaveDialogState extends State<ApplyLeaveDialog> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _startDate;
  late DateTime _endDate;
  late LeaveType _leaveType;
  final _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = _startDate.add(const Duration(days: 1));
    _leaveType = LeaveType.annual;
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaveCubit, LeaveState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_) {
            Navigator.pop(context);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      child: AlertDialog(
        title: const Text('Apply Leave'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<LeaveType>(
                  value: _leaveType,
                  decoration: const InputDecoration(
                    labelText: 'Leave Type',
                  ),
                  items: LeaveType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _leaveType = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text('Start Date: ${_formatDate(_startDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() {
                        _startDate = date;
                        if (_endDate.isBefore(_startDate)) {
                          _endDate = _startDate.add(const Duration(days: 1));
                        }
                      });
                    }
                  },
                ),
                ListTile(
                  title: Text('End Date: ${_formatDate(_endDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _endDate,
                      firstDate: _startDate,
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() => _endDate = date);
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Reason',
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a reason';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          BlocBuilder<LeaveCubit, LeaveState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LeaveCubit>().applyLeaveEmit(
                                Leave(
                                  id: DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  userId: '1',
                                  type: _leaveType,
                                  startDate: _startDate,
                                  endDate: _endDate,
                                  reason: _reasonController.text,
                                  status: LeaveStatus.pending,
                                  appliedAt: DateTime.now(),
                                ),
                              );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Apply'),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
