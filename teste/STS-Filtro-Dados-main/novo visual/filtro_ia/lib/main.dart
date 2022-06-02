import 'package:filtro_ia/screens/telaFiltro.dart';
import 'package:filtro_ia/screens/telaLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF0065A0),
          selectionColor: Color(0x77FFFFFF),
        ),
      ),
      title: 'Filtro - STS',
      home: TelaLogin(),
    );
  }
}
