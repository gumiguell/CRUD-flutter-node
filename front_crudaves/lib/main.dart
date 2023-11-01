import 'package:flutter/material.dart';
import 'package:front_crudaves/screen/put.dart';
import 'package:front_crudaves/screen/post.dart';
import 'package:front_crudaves/screen/get.dart';

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, title: "APP CRUD", home: MainApp()));

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const GET();
  }
}
