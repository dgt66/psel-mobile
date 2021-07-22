import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/back_arrow_icon.png'))),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != '') {
                                DatabaseHelper _dbHelper = DatabaseHelper();

                                Task _newTask = Task(title: value);

                                await _dbHelper.insertTask(_newTask);

                                print('New task has been created');
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Entre com o título da tarefa...',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Entre com a descrição da tarefa...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )),
                  ),
                  TodoWidget(
                    text: 'Create your first text',
                  ),
                  TodoWidget(
                    text: 'Create your first todo as well',
                  ),
                  TodoWidget(
                    checked: true,
                  ),
                  //TodoWidget(),
                ],
              ),
              Positioned(
                bottom: 10.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Taskpage()),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF0000),
                        borderRadius: BorderRadiusDirectional.circular(100)),
                    child: Image(
                        image: AssetImage(
                      'assets/images/delete_icon.png',
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
