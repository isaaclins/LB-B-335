import '../models/task.dart';

/// Interface for task repository
abstract class TaskRepository {
  Future<List<Task>> getAllTasks();
  Future<void> saveTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
  Future<void> deleteAllTasks();
  Future<void> deleteDoneTasks();
}
