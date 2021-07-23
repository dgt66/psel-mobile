import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'package:todo/models/task.dart';

class Taskpage extends StatefulWidget {
  final Task task;
  Taskpage({@required this.task});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  int _taskId = 0;
  String _taskTitle = '';

  @override
  void initState() {
    if (widget.task != null) {
      _taskTitle = widget.task.title;
      _taskId = widget.task.id;
    }

    super.initState();
  }

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
                      ],
                    ),
                  ),
                  // Texto da tarefa
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      // Verificar se o TextField não está vazio
                      onSubmitted: (value) async {
                        if (value != '') {
                          // Verificar se a task é null
                          if (widget.task == null) {
                            Task _newTask = Task(title: value);
                            await _dbHelper.insertTask(_newTask);
                          } else {
                            print('atualizar a tarefa');
                          }
                        }
                      },
                      controller: TextEditingController()..text = _taskTitle,
                      decoration: InputDecoration(
                        hintText: 'Toque para digitar sua tarefa...',
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
