import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:systen_filtro_pdf_text/screens/opcao.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
  }

  TextEditingController controlador_id = TextEditingController();
  TextEditingController controlador_senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); //sem barra notificacao
    SystemChrome.setPreferredOrientations([
      //posiçao da tela
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    final email = TextField(
      maxLength: 8,
      controller: controlador_id,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextField(
      maxLength: 8,
      controller: controlador_senha,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Container(
      width: sizeW * 0.2,
      child: ElevatedButton(
        onPressed: () {
          int temId = 0;
          print('aqui');

          for (var i = id_usuarios.length - 1; i >= 0; i--) {
            print('teste $i');
            if (controlador_id.text.toString() == id_usuarios[i]) {
              print(id_usuarios[i]);
              temId = 1;
              if (controlador_senha.text.toString() == senha_usuarios[i]) {
                nome_logado = nome_usuarios[i];
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TelaFiltro()),
                );
                controleExcel = i;
                print(senha_usuarios[i]);
              } else {
                setState(() {
                  erro = 'Senha errada!';
                });
              }
            } else {}
          }

          if (temId == 0) {
            setState(() {
              erro = 'ID errado!';
            });
          } else {}
        },
        child: Text('Entrar',
            style: TextStyle(
                fontSize: sizeW * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

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
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.top),
          child: Stack(
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
                alignment: Alignment.center,
                width: sizeW,
                height: sizeH,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(sizeW * 0.15),
                      bottomLeft: Radius.circular(sizeW * 0.15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: sizeW,
                  height: sizeH * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: sizeW,
                        height: sizeH * 0.10,
                        child: Text(
                          'ACESSAR',
                          style: GoogleFonts.roboto(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: sizeW * 0.15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: sizeW,
                        height: sizeH * 0.23,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            email,
                            SizedBox(
                              height: sizeH * 0.03,
                            ),
                            password,
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.transparent),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        width: sizeW * 0.8,
                        height: sizeH * 0.08,
                        child: loginButton,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.transparent),
                        width: sizeW,
                        height: sizeH * 0.05,
                        child: Text(
                          erro,
                          style: TextStyle(
                              color: Color(0xFFFF0000), fontSize: sizeW * 0.08),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: sizeW,
                height: sizeH,
                child: DraggableScrollableSheet(
                  maxChildSize: 0.4,
                  initialChildSize: 0.1,
                  minChildSize: 0.1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
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
                                      color: Colors.white,
                                      fontSize: sizeW * 0.07),
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
        ),
      ),
    );
  }
}

int controleExcel = 0;

String erro = '';

String nome_logado = '';

var id_usuarios = [
  '18ad75ia',
  'techss',
];

var senha_usuarios = [
  '2a8f31a2',
  'techss12',
];

var nome_usuarios = [
  'Demonstração',
  'Administrador STS',
];
