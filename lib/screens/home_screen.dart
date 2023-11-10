import 'package:flutter/material.dart';
import 'package:todos_app/constants/colors.dart';
import 'package:todos_app/widgets/todo_item.dart';

import '../models/todo.dart';


class HomeScreen extends StatefulWidget{
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = ToDo.todoList();
  final _todoController  = TextEditingController();
  List<ToDo> _foundToDo=[];

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin:  const EdgeInsets.only(top: 25,bottom: 20),
                      child: const Text("To-Do",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300,
                      color: Colors.white70),),
                    ),

                    for (ToDo todo in _foundToDo)
                      ToDoItem(todo: todo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),
              )
            ],
          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF504373),
                    boxShadow: const [BoxShadow(
                      color: Colors.black12,offset: Offset(0.0,0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0
                    ),],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,


                    decoration:  const InputDecoration(
                      hintText: "Add a new todo item",
                      hintStyle: TextStyle(color: Colors.white70),

                      border: InputBorder.none,


                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 10
                  ),


                  child: ElevatedButton(
                    onPressed: (){
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      backgroundColor: tdBlue,
                      elevation: 10,
                      minimumSize: Size(60,60),

                    ),
                    child: const Text("+",style: TextStyle(fontSize: 30,color: Colors.white)),

                  ),
                )
              ],
            ),
          )
        ],

      )
    );
  }

   void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
   }

   void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);

    });

   }

   void _addToDoItem(String toDo){
    setState(() {
      todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
   }

   void _runFilter(String enteredKeyword){
    List<ToDo> results = [];

    if(enteredKeyword.isEmpty){
      results=todoList;
    }
    else{
      results = todoList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = results;
    });
   }

   Widget searchBox(){
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 5),
       child: Column(
         children: [
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             decoration: BoxDecoration(
                 color: Color(0xFF38304D),
                 borderRadius: BorderRadius.circular(20)
             ),
             child:  TextField(
               onChanged: (value)=>_runFilter(value),
               decoration: const InputDecoration(
                   contentPadding: EdgeInsets.all(0),
                   prefixIcon: Icon(Icons.search,color: Colors.grey,size: 20,
                   ),
                   prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                   border: InputBorder.none,
                   hintText: "Search",
                   hintStyle: TextStyle(color: Colors.grey)
               ),

             ),
           )
         ],
       ),
     );
   }

   AppBar _buildAppBar(){
     return AppBar(
       backgroundColor: tdBGColor,
       elevation: 0,
       title: const Text("TaskSnap",style: TextStyle(
         fontSize: 24,
         fontWeight: FontWeight.w400,
         color: Colors.white
       ),),
       centerTitle: true,
     );
   }
}



