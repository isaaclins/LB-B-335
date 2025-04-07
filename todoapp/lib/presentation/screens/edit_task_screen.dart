import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../application/services/task_service.dart';
import '../../domain/models/task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime? _dueDate;
  final CupertinoDatePickerMode _datePickerMode =
      CupertinoDatePickerMode.dateAndTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description ?? '');
    _dueDate = widget.task.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_titleController.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Title cannot be empty'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    final updatedTask = widget.task.copyWith(
      title: _titleController.text,
      description: _descriptionController.text.isNotEmpty
          ? _descriptionController.text
          : null,
      dueDate: _dueDate,
    );

    // Using the task service to update the task
    Provider.of<TaskService>(context, listen: false).updateTask(updatedTask);
    Navigator.pop(context);
  }

  String _formatDateTime(DateTime dateTime) {
    final date = dateTime.toLocal().toString().split(' ')[0];
    final time = dateTime.toLocal().toString().split(' ')[1].substring(0, 5);
    return 'Due: $date at $time';
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Edit Task'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('Save'),
          onPressed: _saveTask,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CupertinoTextField(
              controller: _titleController,
              placeholder: 'Task Title',
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: _descriptionController,
              placeholder: 'Description (optional)',
              padding: const EdgeInsets.all(12),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    height: 300, // Increased height for date and time picker
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoButton(
                              child: const Text('Done'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        Expanded(
                          child: CupertinoDatePicker(
                            mode: _datePickerMode,
                            initialDateTime: _adjustInitialDateTime(
                                _dueDate ?? DateTime.now()),
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                _dueDate = newDate;
                              });
                            },
                            use24hFormat: true,
                            minuteInterval: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dueDate == null
                          ? 'Due Date and Time (optional)'
                          : _formatDateTime(_dueDate!),
                      style: TextStyle(
                        color: _dueDate == null
                            ? CupertinoColors.systemGrey
                            : CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .color,
                      ),
                    ),
                    const Icon(CupertinoIcons.calendar, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Ensure initial minute value is divisible by the minute interval to avoid the assertion error
  DateTime _adjustInitialDateTime(DateTime dateTime) {
    final int minute = dateTime.minute;
    final int roundedMinute =
        (minute ~/ 5) * 5; // Round down to nearest multiple of 5
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      roundedMinute,
      0, // zero out seconds
    );
  }
}
