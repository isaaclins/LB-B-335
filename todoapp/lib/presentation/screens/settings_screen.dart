import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../application/services/task_service.dart';
import '../../application/services/settings_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Consumer2<SettingsService, TaskService>(
          builder: (context, settingsService, taskService, child) {
            return ListView(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dark Mode',
                        style: TextStyle(fontSize: 16),
                      ),
                      CupertinoSwitch(
                        value: settingsService.isDarkMode,
                        onChanged: (value) {
                          settingsService.toggleDarkMode();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: CupertinoColors.systemGrey4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                CupertinoListTile(
                  title: const Text('Delete All Tasks'),
                  trailing: const Icon(CupertinoIcons.delete),
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Delete All Tasks'),
                        content: const Text(
                            'Are you sure you want to delete all tasks? This action cannot be undone.'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            child: const Text('Delete'),
                            onPressed: () {
                              taskService.deleteAllTasks();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: 1,
                  color: CupertinoColors.systemGrey4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'This app demonstrates a layered architecture where:\n\n'
                    '- Domain layer: Contains business entities and repository interfaces\n'
                    '- Application layer: Contains business logic and services\n'
                    '- Infrastructure layer: Contains repository implementations\n'
                    '- Presentation layer: Contains UI without business logic',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
