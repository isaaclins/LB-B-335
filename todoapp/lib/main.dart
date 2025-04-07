import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'application/services/task_service.dart';
import 'application/services/settings_service.dart';
import 'infrastructure/repositories/task_repository_impl.dart';
import 'infrastructure/repositories/settings_repository_impl.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize repositories
    final taskRepository = TaskRepositoryImpl();
    final settingsRepository = SettingsRepositoryImpl();

    return MultiProvider(
      providers: [
        // Provide services that depend on repositories
        ChangeNotifierProvider(
          create: (_) => TaskService(taskRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsService(settingsRepository),
        ),
      ],
      child: Consumer<SettingsService>(
        builder: (context, settings, child) {
          return CupertinoApp(
            title: 'Todo App',
            theme: CupertinoThemeData(
              primaryColor: CupertinoColors.systemBlue,
              brightness:
                  settings.isDarkMode ? Brightness.dark : Brightness.light,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
