import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_proj/controllers/todo_controller.dart';
import 'package:intro_proj/models/todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final int index;
  TodoScreen({this.index});
  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!this.index.isNull) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Input your todo',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                  color: Colors.red,
                ),
                RaisedButton(
                  onPressed: () {
                    if (this.index.isNull) {
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }
                    Get.back();
                  },
                  child: Text(!this.index.isNull ? 'Edit' : 'Add'),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
