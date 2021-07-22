import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;

  TaskCardWidget({this.title = 'Tarefa sem título', this.desc = 'Nenhuma descrição adicionada'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFFF868290),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool checked;

  TodoWidget({this.text = 'Todo sem título', this.checked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 6.0,
      ),
      child: Row(
        children: [
          Container(
            width: 22.0,
            height: 22.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
              color: checked ? Color(0xFFFFD700) : Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: checked ? null : Border.all(
                color: Color(0xFF86829D),
                width: 1.5,
                ),
            ),
            child: Image(image: AssetImage('assets/images/check_icon.png')),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: checked ? Colors.black87 : Color(0xFF86829D),
            ),
          ),
        ],
      ),
    );
  }
}
