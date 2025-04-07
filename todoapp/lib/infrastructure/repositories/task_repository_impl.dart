import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  static const String _tasksKey = 'tasks';

  @override
  Future<List<Task>> getAllTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_tasksKey);
    if (tasksJson == null) return [];

    final List<dynamic> tasksList = jsonDecode(tasksJson);
    return tasksList
        .map((task) => Task(
              id: task['id'],
              title: task['title'],
              description: task['description'],
              dueDate: task['dueDate'] != null
                  ? DateTime.parse(task['dueDate'])
                  : null,
              isDone: task['isDone'],
            ))
        .toList();
  }

  @override
  Future<void> saveTask(Task task) async {
    final tasks = await getAllTasks();
    tasks.add(task);
    await _saveTasks(tasks);
  }

  @override
  Future<void> updateTask(Task updatedTask) async {
    final tasks = await getAllTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await _saveTasks(tasks);
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    final tasks = await getAllTasks();
    tasks.removeWhere((task) => task.id == taskId);
    await _saveTasks(tasks);
  }

  @override
  Future<void> deleteAllTasks() async {
    await _saveTasks([]);
  }

  @override
  Future<void> deleteDoneTasks() async {
    final tasks = await getAllTasks();
    tasks.removeWhere((task) => task.isDone);
    await _saveTasks(tasks);
  }

  Future<void> _saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks
        .map((task) => {
              'id': task.id,
              'title': task.title,
              'description': task.description,
              'dueDate': task.dueDate?.toIso8601String(),
              'isDone': task.isDone,
            })
        .toList();
    await prefs.setString(_tasksKey, jsonEncode(tasksJson));
  }
}
