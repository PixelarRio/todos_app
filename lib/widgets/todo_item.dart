import 'package:flutter/material.dart';
import 'package:todos_app/constants/colors.dart';

import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

   ToDoItem({Key?key, required this.todo, this.onToDoChanged, this.onDeleteItem}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Color(0xFF38304D),
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              decoration: todo.isDone? TextDecoration.lineThrough:null,
          decorationColor: Colors.white),
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
          child: IconButton(onPressed: (){
            onDeleteItem(todo.id);
          },
              icon: const Icon(Icons.delete),
              color: Colors.white,
              iconSize: 18,
          ),

        ),
      ),
    );
  }
}
