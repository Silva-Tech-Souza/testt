import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:systen_filtro_pdf_text/screens/filtro.dart';
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

    final btnPDF = Container(
      width: sizeW * 0.25,
      height: sizeH * 0.15,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            pdf_txt_tipo = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text(
          'FILTRAR PDF',
          style: TextStyle(
              fontSize: sizeW * 0.03,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    final btnTXT = Container(
      width: sizeW * 0.25,
      height: sizeH * 0.15,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            pdf_txt_tipo = true;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text(
          'FILTRAR TXT',
          style: TextStyle(
              fontSize: sizeW * 0.03,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
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
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: sizeW,
                height: sizeH * 0.9,
                child: Container(
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
                  alignment: Alignment.center,
                  width: sizeW * 0.6,
                  height: sizeH * 0.7,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: sizeW * 0.6,
                        height: sizeH * 0.1,
                        child: Text(
                          'BEM-VINDO',
                          style: GoogleFonts.comfortaa(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontSize: sizeW * 0.05,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: sizeW * 0.6,
                        height: sizeH * 0.1,
                        child: Text(
                          nome_logado,
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: sizeW * 0.03,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: sizeW * 0.6,
                        height: sizeH * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            btnPDF,
                            btnTXT,
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: sizeW * 0.6,
                        height: sizeH * 0.1,
                        child: Text(
                          'Está com dificuldades para usar? Entre em contato com o suporte!',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: sizeW * 0.015,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      width: sizeW * 0.5,
                      height: sizeH * 0.1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        width: sizeW,
                        height: sizeH * 0.1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF00AEFF),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(150),
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          width: sizeW * 0.15,
                          height: sizeH * 0.1,
                          child: Text(
                            'SAIR',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.roboto(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: sizeW * 0.03,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: sizeW * 0.5,
                    height: sizeH * 0.1,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      width: sizeW,
                      height: sizeH * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF00AEFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        width: sizeW * 0.15,
                        height: sizeH * 0.1,
                        child: Text(
                          'Precisa de ajuda?\nWhatsApp: (11) 99522-5772\nEmail: leopondi10@gmail.com',
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

bool pdf_txt_tipo = true;
