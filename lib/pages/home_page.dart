import 'package:flutter/material.dart';
import 'package:to_do/utilities/database.dart';
import 'package:to_do/utilities/dialog_box.dart';
import 'package:to_do/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    super.initState();
    if (db.toDoList.isEmpty) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void checkBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value ?? false; // Ensure value is a boolean
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]); // New tasks are always incomplete
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text(
            'TO DO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow[600],
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1] is bool
                  ? db.toDoList[index][1]
                  : db.toDoList[index][1] == 'true', // Ensure taskCompleted is a boolean
              onChanged: (value) => checkBox(value, index),
              onDelete: () => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}