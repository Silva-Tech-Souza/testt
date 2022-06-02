import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class TelaFiltro extends StatefulWidget {
  TelaFiltro({Key key}) : super(key: key);

  @override
  _TelaFiltroState createState() => _TelaFiltroState();
}

class _TelaFiltroState extends State<TelaFiltro> {
  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    var whatsapp = "https://api.whatsapp.com/send?phone=5512997185788&text=";

    void _launchURL() async => await canLaunch(whatsapp)
        ? await launch(whatsapp)
        : throw 'Not found $whatsapp';

    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'stechs.contato@gmail.com',
        queryParameters: {'subject': ''});

    final suporteWhatsapp = Container(
      width: sizeW * 0.2,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () async {
          FlutterOpenWhatsapp.sendSingleMessage("5512997185788",
              "Olá! Sou usuário do STS Filtro e preciso de suporte!");
        },
        child: Text(
          'Whatsapp',
          style: TextStyle(
              fontSize: sizeW * 0.08,
              color: Color(0xFF0088C7),
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    final suporteEmail = Container(
      width: sizeW * 0.2,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          launch(_emailLaunchUri.toString());
        },
        child: Text('Email',
            style: TextStyle(
                fontSize: sizeW * 0.08,
                color: Color(0xFF0088C7),
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            width: sizeW,
            height: sizeH,
            child: Image.asset(
              'imagens/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
            ),
            width: sizeW,
            height: sizeH,
            child: null,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: sizeW,
                height: sizeH * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'BEM VINDO!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: sizeW * 0.08,
                      ),
                    ),
                    Text(
                      'Usuario: $nome_logado',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: sizeW * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey),
                width: sizeW,
                height: sizeH * 0.005,
              ),
              Container(
                margin: EdgeInsets.all(sizeW * 0.05),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Color(0xFF009DE6),
                    borderRadius: BorderRadius.circular(18)),
                width: sizeW,
                height: sizeH * 0.15,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.white.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.white.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Escanear Documento',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeW * 0.08,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: sizeW,
            height: sizeH,
            child: DraggableScrollableSheet(
              maxChildSize: 0.4,
              initialChildSize: 0.1,
              minChildSize: 0.1,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF00AEFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            Text(
                              'PRECISA DE AJUDA?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: sizeW * 0.07),
                            ),
                            Text(
                              'arraste para cima',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: sizeW * 0.06),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        width: sizeW * 0.9,
                        height: sizeH * 0.1,
                        child: suporteWhatsapp,
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        width: sizeW * 0.9,
                        height: sizeH * 0.1,
                        child: suporteEmail,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

bool pdf_txt_tipo = true;
