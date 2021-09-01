import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _tarefasController = TextEditingController();

  List _listaTarefas = [];


  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _listaTarefas = json.decode(data);
      });
    });
  }

  void _addTarefa() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa["title"] = _tarefasController.text;
      _tarefasController.text = "";
      novaTarefa["ok"] = false;
      _listaTarefas.add(novaTarefa);

      _saveData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                      controller: _tarefasController,
                      decoration: InputDecoration(
                          labelText: "Nova Tarefa",
                          labelStyle: TextStyle(color: Colors.black)
                      ),
                    )
                ),
                FloatingActionButton(
                  onPressed: _addTarefa,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.yellow,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: (context, index){
                  return CheckboxListTile(
                    title: Text(_listaTarefas[index]["title"]),
                    value: _listaTarefas[index]["ok"],
                    secondary: FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.delete),
                      backgroundColor: Colors.yellow,
                    ),
                    // secondary: CircleAvatar(
                    //   child: Icon(_listaTarefas[index]["ok"] ?
                    //   Icons.check : Icons.error),),
                      onChanged: (check) {
                        setState(() {
                          _listaTarefas[index]["ok"] = check;
                          _saveData();
                        });
                      },
                  );
                }),
          )
        ],
      ),
    );
  }

  // Função para pegar o arquivo
  Future<File> _getFile() async{
    final pasta = await getApplicationDocumentsDirectory();
    return File("${pasta.path}/tarefas.json");
  }

  // Função para salvar a tarefa no arquivo
  Future<File> _saveData() async {
    String tarefa= json.encode(_listaTarefas);

    final arquivo = await _getFile();
    return arquivo.writeAsString(tarefa);
  }

  // Função para ler os dados no arquivo
  Future<String> _readData() async {
    try {
      final arquivo = await _getFile();

      return arquivo.readAsString();
    } catch (e) {
      return 'Falha na leitura do arquivo.';
    }
  }

}
