import 'package:decorated_icon/decorated_icon.dart';
import 'package:filtro_ia/main.dart';
import 'package:filtro_ia/screens/telaFiltro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

int controleExcel = 0;

class MyIntentAvancar extends Intent {}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    String erro = '';

    String nome_logado = '';

    var _id_usuarios = [
      'day/123',
      'techss',
    ];

    var _senha_usuarios = [
      '123/day',
      'techss12',
    ];

    var _nome_usuarios = [
      'Demonstração',
      'Administrador STS',
    ];
    final _controlador_id = TextEditingController();
    final _controlador_senha = TextEditingController();
    verificarIdSenha() {
      //assim pode ter diversos acessos com menos codigo de validação
      int temId = 0;

      for (var i = _id_usuarios.length - 1; i >= 0; i--) {
        print('teste $i');
        if (_controlador_id.text.toString() == _id_usuarios[i]) {
          print(_id_usuarios[i]);
          temId = 1;
          if (_controlador_senha.text.toString() == _senha_usuarios[i]) {
            nome_logado = _nome_usuarios[i];
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TelaFiltro()),
            );
            controleExcel = i;
            print(_senha_usuarios[i]);
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: 'ID ou SENHA errados!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  webBgColor: 'linear-gradient(to right, #1F4CA0, #336EDB)',
                  webPosition: 'center',
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 150);
            });
          }
        } else {}
      }

      if (temId == 0) {
        setState(() {
          erro = 'ID errado!';
          Fluttertoast.showToast(
              msg: 'ID ou SENHA errados!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              webBgColor: 'linear-gradient(to right, #1F4CA0, #336EDB)',
              webPosition: 'center',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 150);
        });
      } else {}
    }

    final email = TextField(
      maxLength: 8,
      controller: _controlador_id,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextField(
      maxLength: 8,
      controller: _controlador_senha,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      onPressed: () {
        verificarIdSenha();
      },
      child: Text(
        'Entrar',
        style: TextStyle(
            fontSize: sizeW * 0.02,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(100),
            width: sizeW,
            height: sizeH,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(232, 18, 41, 92),
                      Color.fromARGB(218, 4, 120, 202)
                    ])),
            child: null,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: sizeW * 0.3,
            height: sizeH * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: sizeW * 0.28,
                  height: sizeH * 0.05,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: IconButton(
                        iconSize: sizeW * 0.045,
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Color(0xFF0980F0),
                            title: const SelectableText(
                              'Meios de Suporte',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            content: const SelectableText(
                              'Email: comercial@silvatechsouza.com.br\nWhatsapp: (12) 99718-5788',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'FECHAR'),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: DecoratedIcon(
                          Icons.person_pin,
                          color: Color(0xffffffff),
                          size: sizeW * 0.035,
                          shadows: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 3.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF365775),
                      shape: CircleBorder(),
                      minimumSize: Size.fromWidth(50),
                    ),
                  ),
                ),
                Container(
                  width: sizeW * 0.3,
                  height: sizeH * 0.1,
                  child: Image.asset(
                    'imagens/FiA.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.fromLTRB(sizeW * 0.04, 0, sizeW * 0.04, 0),
                  width: sizeW * 0.3,
                  height: sizeH * 0.1,
                  child: email,
                ),
                Container(
                  padding:
                      EdgeInsets.fromLTRB(sizeW * 0.04, 0, sizeW * 0.04, 0),
                  width: sizeW * 0.3,
                  height: sizeH * 0.1,
                  child: password,
                ),
                Container(
                  width: sizeW * 0.3,
                  height: sizeH * 0.05,
                  child: null,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:
                      EdgeInsets.fromLTRB(sizeW * 0.04, 0, sizeW * 0.04, 0),
                  width: sizeW * 0.2,
                  height: sizeH * 0.05,
                  child: loginButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
