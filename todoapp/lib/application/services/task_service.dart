import 'package:flutter/foundation.dart';
import '../../domain/models/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskService with ChangeNotifier {
  final TaskRepository _repository;
  List<Task> _tasks = [];

  TaskService(this._repository) {
    _loadTasks();
  }

  List<Task> get tasks => _tasks;
  List<Task> get todoTasks => _tasks.where((task) => !task.isDone).toList();
  List<Task> get doneTasks => _tasks.where((task) => task.isDone).toList();

  Future<void> _loadTasks() async {
    _tasks = await _repository.getAllTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _repository.saveTask(task);
    _tasks.add(task);
    notifyListeners();
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      await _repository.updateTask(updatedTask);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
    await _repository.deleteTask(taskId);
    notifyListeners();
  }

  Future<void> deleteAllTasks() async {
    _tasks.clear();
    await _repository.deleteAllTasks();
    notifyListeners();
  }

  Future<void> deleteDoneTasks() async {
    _tasks.removeWhere((task) => task.isDone);
    await _repository.deleteDoneTasks();
    notifyListeners();
  }

  Future<void> toggleTaskStatus(String taskId) async {
    final index = _tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final updatedTask = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
      _tasks[index] = updatedTask;
      await _repository.updateTask(updatedTask);
      notifyListeners();
    }
  }
}
