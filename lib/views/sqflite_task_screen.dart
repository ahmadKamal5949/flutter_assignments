import 'package:flutter/material.dart';

import '../helper/database_helper.dart';
import '../model/task.dart';

class SQFliteTaskScreen extends StatefulWidget {
  const SQFliteTaskScreen({super.key});

  @override
  _SQFliteTaskScreenState createState() => _SQFliteTaskScreenState();
}

class _SQFliteTaskScreenState extends State<SQFliteTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  late DatabaseHelper _dbHelper;
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
    _loadTasks();
  }

  void _loadTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  void _addTask() async {
    if (_taskController.text.isNotEmpty) {
      final task = Task(description: _taskController.text, isCompleted: false);
      await _dbHelper.insertTask(task);
      _taskController.clear();
      _loadTasks();
    }
  }

  void _toggleTaskCompletion(Task task) async {
    final updatedTask = Task(
      id: task.id,
      description: task.description,
      isCompleted: !task.isCompleted,
    );
    await _dbHelper.updateTask(updatedTask);
    _loadTasks();
  }

  void _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFlite Tasks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task description',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (bool? value) {
                      _toggleTaskCompletion(task);
                    },
                  ),
                  title: Text(
                    task.description,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _deleteTask(task.id!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
