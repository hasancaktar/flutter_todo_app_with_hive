import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/screen/screen.dart';
import 'models/gorev.dart';


const GOREV_BOX = 'gorev';

void main() async {


  //Hive başlatma
  await Hive.initFlutter();

  //Adapter'in kaydedilmesi
  Hive.registerAdapter(GorevAdapter());

  //box oluşturma
  await Hive.openBox(GOREV_BOX);



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Görev Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Görev Uygulaması'),
    );
  }
}

