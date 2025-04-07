import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../application/services/task_service.dart';
import '../widgets/countdown_timer.dart';
import 'edit_task_screen.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Done'),
        trailing: Builder(
          builder: (context) {
            final taskService = Provider.of<TaskService>(context);
            final doneTasks = taskService.doneTasks;

            if (doneTasks.isEmpty) {
              return const SizedBox.shrink();
            }

            return CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('Clear All'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Clear All Done Tasks'),
                    content: const Text(
                        'Are you sure you want to delete all done tasks?'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text('Delete'),
                        onPressed: () {
                          taskService.deleteDoneTasks();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      child: Consumer<TaskService>(
        builder: (context, taskService, child) {
          final tasks = taskService.doneTasks;

          if (tasks.isEmpty) {
            return const Center(
              child: Text('No completed tasks yet'),
            );
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return CupertinoListTile(
                backgroundColor:
                    CupertinoTheme.of(context).scaffoldBackgroundColor,
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    taskService.toggleTaskStatus(task.id);
                  },
                  child: const Icon(CupertinoIcons.checkmark_circle_fill),
                ),
                title: Text(
                  task.title,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (task.description != null)
                      Text(
                        task.description!,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    if (task.dueDate != null)
                      Text(
                        'Due: ${_formatDateTime(task.dueDate!)}',
                        style: const TextStyle(
                          color: CupertinoColors.systemGrey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      EditTaskScreen(task: task),
                                ),
                              );
                            },
                            child: const Text('Edit Task'),
                          ),
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                              showCupertinoDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('Delete Task'),
                                  content: const Text(
                                      'Are you sure you want to delete this task?'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text('Cancel'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        taskService.deleteTask(task.id);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Delete Task'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                    );
                  },
                  child: const Icon(CupertinoIcons.ellipsis_circle),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => EditTaskScreen(task: task),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final date = dateTime.toLocal().toString().split(' ')[0];
    final time = dateTime.toLocal().toString().split(' ')[1].substring(0, 5);
    return '$date at $time';
  }
}
