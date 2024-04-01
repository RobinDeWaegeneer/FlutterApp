import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeletedItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeletedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Tapped');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone != null && todo.isDone != false ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue),
        title: Text(
          todo.todoText!, 
          style: TextStyle(
            fontSize: 16, 
            color: tdBlack, 
            decoration: todo.isDone != null && todo.isDone! ? TextDecoration.lineThrough : null,
          )
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            color: Colors.white,
            alignment: Alignment.center,
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: () {
              // print('Deleted');
              onDeletedItem(todo.id);
            },
          ),
        ),
      ),
      );
  }
}