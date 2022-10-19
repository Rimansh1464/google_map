import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DataBase extends StatefulWidget {
  const DataBase({Key? key}) : super(key: key);

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
    );
  }
}
