import 'package:bloc_vexena/service/photo_service.dart';
import 'package:bloc_vexena/view/photo_view.dart';
import 'package:bloc_vexena/viewmodel/photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubit & Vexena',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoView(),
    );
  }
}
