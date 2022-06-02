import 'package:flutter/material.dart';

import 'package:systen_filtro_pdf_text/screens/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silva Tech Souza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Color.fromRGBO(32, 176, 128, 1),
        primaryColor: Color.fromRGBO(32, 176, 128, 1),
      ),
      home: Login(),
    );
  }
}
