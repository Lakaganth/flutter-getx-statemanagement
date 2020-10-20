import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_proj/controllers/todo_controller.dart';
import 'package:intro_proj/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Intro'),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemCount: todoController.todos.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                todoController.todos[index].text,
                style: (todoController.todos[index].done
                    ? TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      )
                    : TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )),
              ),
              onTap: () {
                Get.to(TodoScreen(
                  index: index,
                ));
              },
              trailing: Icon(Icons.chevron_right),
              leading: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (value) {
                  var changed = todoController.todos[index];
                  changed.done = value;
                  todoController.todos[index] = changed;
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
    );
  }
}
