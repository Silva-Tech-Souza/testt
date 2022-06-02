import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:systen_filtro_pdf_text/screens/opcao.dart';

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

  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    final controlador_id = TextEditingController();
    final controlador_senha = TextEditingController();

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
                fontSize: sizeW * 0.02,
                color: Colors.white,
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
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: sizeW * 0.8,
                height: sizeH,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  width: sizeW * 0.4,
                  height: sizeH * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: sizeW * 0.4,
                        height: sizeH * 0.15,
                        child: Text(
                          'ACESSAR',
                          style: GoogleFonts.roboto(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: sizeW * 0.05,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: sizeW * 0.4,
                        height: sizeH * 0.3,
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
                        margin: EdgeInsets.fromLTRB(
                            0, sizeH * 0.05, 0, sizeH * 0.05),
                        width: sizeW * 0.2,
                        height: sizeH * 0.1,
                        child: loginButton,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.transparent),
                        width: sizeW * 0.3,
                        height: sizeH * 0.04,
                        child: Text(
                          erro,
                          style: TextStyle(
                              color: Color(0xFFFF0000), fontSize: sizeW * 0.02),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00AEFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                  ),
                ),
                width: sizeW * 0.2,
                height: sizeH,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(sizeW * 0.03),
                      width: sizeW * 0.2,
                      height: sizeH * 0.3,
                      child: null,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: sizeW * 0.15,
                      height: sizeH * 0.3,
                      child: Image.asset(
                        'imagens/logo_2.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      alignment: Alignment.topCenter,
                      width: sizeW * 0.2,
                      height: sizeH * 0.15,
                      child: Text(
                        'FILTRO DE DADOS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: sizeW * 0.017,
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(sizeW * 0.03),
                      width: sizeW * 0.2,
                      height: sizeH * 0.15,
                      child: null,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, sizeW * 0.005, 0),
                      alignment: Alignment.centerRight,
                      width: sizeW * 0.2,
                      height: sizeH * 0.1,
                      child: Text(
                        'Precisa de ajuda?\nWhatsApp: (12) 99718-5788\nEmail: stechs.contato@gmail.com',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: sizeW * 0.01,
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

int controleExcel = 0;

String erro = '';

String nome_logado = '';

var id_usuarios = [
  'day/123',
  'techss',
];

var senha_usuarios = [
  '123/day',
  'techss12',
];

var nome_usuarios = [
  'Demonstração',
  'Administrador STS',
];
