import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;

  TaskCardWidget({this.title = 'Tarefa sem título'});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
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
        ],
      ),
    );
  }
}

class CheckBoxModel {
  CheckBoxModel({this.checked = false});

  bool checked;
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key key, this.item}) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.item.checked,
      onChanged: (bool value) {
        setState(() {
          widget.item.checked = value;
        });
      },
    );
  }
}
