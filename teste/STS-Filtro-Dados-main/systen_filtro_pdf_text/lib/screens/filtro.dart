import 'dart:html';
import 'dart:io' as html;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:systen_filtro_pdf_text/controller/conexao.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:systen_filtro_pdf_text/controller/parametros.dart';
import 'package:systen_filtro_pdf_text/screens/login.dart';
import 'package:systen_filtro_pdf_text/screens/opcao.dart';
import 'package:styled_text/styled_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyHomePage> {
  String txt_filtrado = "Resultado aqui...";
  TextEditingController value_txt = TextEditingController();
  List<int> _selectedFile0,
      _selectedFile1,
      _selectedFile2,
      _selectedFile3,
      _selectedFile4,
      _selectedFile5,
      _selectedFile6,
      _selectedFile7,
      _selectedFile8,
      _selectedFile9;

  String txt_0, txt_1, txt_2;
  Uint8List _bytesData0,
      _bytesData1,
      _bytesData2,
      _bytesData3,
      _bytesData4,
      _bytesData5,
      _bytesData6,
      _bytesData7,
      _bytesData8,
      _bytesData9;
  int numeros_arq;
  String valor;

  String pdf_txt0 = "",
      pdf_txt1 = "",
      pdf_txt2 = "",
      pdf_txt3 = "",
      pdf_txt4 = "",
      pdf_txt5 = "",
      pdf_txt6 = "",
      pdf_txt7 = "",
      pdf_txt8 = "",
      pdf_txt9 = "";
  String txt_txt0 = "",
      txt_txt1 = "",
      txt_txt2 = "",
      txt_txt3 = "",
      txt_txt4 = "",
      txt_txt5 = "",
      txt_txt6 = "",
      txt_txt7 = "",
      txt_txt8 = "",
      txt_txt9 = "";
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();
  html.File file;

  startWebFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.accept = ".pdf";
    uploadInput.click();
    int aqv_num = 0;

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      numeros_arq = files.length;
      setState(() {
        value_txt.text = "";
        txt_filtrado = "";
      });

      while (aqv_num < numeros_arq) {
        final file = files[aqv_num];
        final reader = new FileReader();

        reader.onLoadEnd.listen((e) {
          _handleResult(reader.result, aqv_num);
          value_txt.text = txt_pdf_txt;
        });
        reader.readAsDataUrl(file);

        aqv_num++;
      }

      setState(() {});
    });
  }

  String txt_pdf_txt = "";
  List<String> nome_arq = [];
  startWebFilePickerTXT() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.accept = ".txt";
    uploadInput.click();
    int aqv_num = 0;
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      numeros_arq = files.length;
      setState(() {
        value_txt.text = "";
        txt_filtrado = "";
        txt_pdf_txt = "";
      });
      while (aqv_num < numeros_arq) {
        final file =
            files[aqv_num]; //pego o primeiro, mas a ideia é pegar todos
        final reader = new FileReader(); //crio o cara q vai rrenderizar

        reader.onLoadEnd.listen((e) {
          //aqui vai ser acionado assim que ele terminar de renderizrar
          _handleResultTXT(reader.result, aqv_num, file.name);
          setState(() {
            value_txt.text = txt_pdf_txt;
          });
        });
        reader.readAsText(file, 'ISO-8859-1');

        aqv_num++;
      }

      setState(() {});
    });
  }

  ArrumarPalavras(String result) {
    setState(() {
      result = result;
      result = result.toString().replaceAll("	", "\n");
      result = result.toString().replaceAll("CIDADE", "");
      result = "CIDADE " +
          result
              .toString()
              .toString()
              .replaceAll("Grau de ParenteSco:", "Grau de Parentesco:");
      result =
          result.toString().replaceAll("Data de iffixto:", "Data de óbito:");
      result = result.toString().replaceAll("Coma:alta:", "Contratante:");
      result = result.toString().replaceAll("SSPSP", "SSP-SP");

      result = result.toString().replaceAll("ssp", "SSP-SP");
      result = result
          .toString()
          .replaceAll("Grau de parentesco:", "Grau de Parentesco:");
      result = result.toString().replaceAll("NOme da Mãe:", "Nome da Mãe:");
      result = result.toString().replaceAll("V_?2", "");
      result = result.toString().replaceAll("-X", "SSP-SP");
      result = result.toString().replaceAll("Causa Morte:", "Causa da Morte:");
      result = result.toString().replaceAll("XSSP-SP", "SSP-SP");
      result = result.toString().replaceAll("55P5P", "SSP-SP");
      result = result.toString().replaceAll(" CPI::", "CPF:");
      result = result.toString().replaceAll("cep", "CEP");
      result = result.toString().replaceAll("ceP", "CEP");
      result = result.toString().replaceAll("CE-P", "CEP");
      result = result.toString().replaceAll("Cep", "CEP");
      result = result.toString().replaceAll("cel.:", "Cel.:");
      result = result.toString().replaceAll("cel:", "Cel.:");
      result = result.toString().replaceAll("CEL:", "Cel.:");
      result = result.toString().replaceAll("cel. ", "Cel.:");
      result = result.toString().replaceAll("cel ", "Cel.:");
      result = result.toString().replaceAll("CEL ", "Cel.:");
      result = result.toString().replaceAll(" CPI:", "CPF:");
      result = result.toString().replaceAll("RG1", "RG:");
      result = result.toString().replaceAll("RG2", "RG:");
      result = result.toString().replaceAll("RG3", "RG:");
      result = result.toString().replaceAll("RG4", "RG:");
      result = result.toString().replaceAll("RG5", "RG:");
      result = result.toString().replaceAll("RG6", "RG:");
      result = result.toString().replaceAll("RG7", "RG:");
      result = result.toString().replaceAll("RG8", "RG:");
      result = result.toString().replaceAll("RG9", "RG:");
      result = result.toString().replaceAll("Irmão(6) ", "Irmão(A)");
      result = result.toString().replaceAll("RG8", "RG:");
      result = result.toString().replaceAll("Cd.: ", "Cel.:");
      result = result.toString().replaceAll("RG9", "RG:");
      result = result.toString().replaceAll("AG1", "RG:");
      result = result.toString().replaceAll("AG2", "RG:");
      result = result.toString().replaceAll("AG3", "RG:");
      result = result.toString().replaceAll("AG4", "RG:");
      result = result.toString().replaceAll("AG5", "RG:");
      result = result.toString().replaceAll("AG6", "RG:");
      result = result.toString().replaceAll("AG7", "RG:");
      result = result.toString().replaceAll("AG8", "RG:");
      result = result.toString().replaceAll("AG9", "RG:");
      result = result.toString().replaceAll("AG:1", "RG:");
      result = result.toString().replaceAll("AG:2", "RG:");
      result = result.toString().replaceAll("AG:3", "RG:");
      result = result.toString().replaceAll("AG:4", "RG:");
      result = result.toString().replaceAll("AG:5", "RG:");
      result = result.toString().replaceAll("AG:6", "RG:");
      result = result.toString().replaceAll("AG:7", "RG:");
      result = result.toString().replaceAll("AG:8", "RG:");
      result = result.toString().replaceAll("AG:9", "RG:");
      result = result.toString().replaceAll("RC1", "RG:");
      result = result.toString().replaceAll("RC2", "RG:");
      result = result.toString().replaceAll("RC3", "RG:");
      result = result.toString().replaceAll("RC4", "RG:");
      result = result.toString().replaceAll("RC5", "RG:");
      result = result.toString().replaceAll("RC6", "RG:");
      result = result.toString().replaceAll("RC7", "RG:");
      result = result.toString().replaceAll("RC8", "RG:");
      result = result.toString().replaceAll("RC9", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RC:", "RG:");
      result = result.toString().replaceAll("RG;", "RG:");
      result = result.toString().replaceAll("Endereço:, • -", "");
      result = result.toString().replaceAll("Endereço:, - -", "");
      result = result.toString().replaceAll("Endereço:. - -", "");
      result = result.toString().replaceAll("Endereço:. • -", "");
      result = result.toString().replaceAll("Endereço: , • -", "");
      result = result.toString().replaceAll("Endereço: , - -", "");
      result = result.toString().replaceAll("Endereço: . - -", "");
      result = result.toString().replaceAll("Endereço: . • -", "");
      result = result.toString().replaceAll("endereço:", "Endereço:");
      result = result.toString().replaceAll("endereco:", "Endereço:");
      result = result.toString().replaceAll("Endereco:", "Endereço:");
      result = result.toString().replaceAll(" Endereco ", "Endereço:");
      result = result.toString().replaceAll("Mascuino", "Masculino");
      result = result.toString().replaceAll("RC8", "RG:");
      result = result.toString().replaceAll("RC9", "RG:");
      result = result.toString().replaceAll("CPP:", "CPF:");
      result = result.toString().replaceAll("CPP", "CPF:");
      result = result.toString().replaceAll("CFF", "CPF:");
      result = result.toString().replaceAll("cpf:", "CPF:");
      result = result.toString().replaceAll("rg:", "RG:");
      result =
          result.toString().replaceAll("causa da morte:", "Causa da Morte:");
      result = result.toString().replaceAll("nome da mãe", "Nome da Mãe");
      result = result
          .toString()
          .replaceAll("grau de parentesco:", "Grau de Parentesco:");
      result = result.toString().replaceAll("falecido:", "Falecido:");
      result = result.toString().replaceAll("contratante:", "Contratante:");
      result = result.toString().replaceAll("Fiho(a)", "Filho(a)");
      result = result.toString().replaceAll("Pilho(a)", "Filho(a)");
      result = result.toString().replaceAll("Filhota)", "Filho(a)");
      result = result.toString().replaceAll("Netoia)", "Neto");
      result = result.toString().replaceAll("Filrio(a)", "Filho(a)");
      result = result.toString().replaceAll("Fi r ota)", "Filho(a)");
      result = result.toString().replaceAll("CFF:", "CPF:");
      result = result
          .toString()
          .replaceAll("Grau de arentesco:", "Grau de Parentesco:");
      result = result.toString().replaceAll("CPI::", "CPF:");
      result = result.toString().replaceAll("SSP-SP/SP", "SSP-SP");
      result = result
          .toString()
          .replaceAll("Grau de Pa ntesco:", "Grau de Parentesco:");
      result = result.toString().replaceAll("R13•", "RG:");
      result = result.toString().replaceAll(" R13", "RG:");
      result = result.toString().replaceAll(" RG::", "RG:");
      result = result.toString().replaceAll("S5PS", "SSP-SP");
      result = result.toString().replaceAll("ial: do:", "Falecido:");
      result = result.toString().replaceAll("Faleome ciial: do:", "Falecido:");
      result = result.toString().replaceAll("-SSP", "SSP-SP");
      result = result
          .toString()
          .replaceAll("Local de Remoção:", "Local da Remoção:");
      result = result.toString().replaceAll("Local do Sepultamento:", "");

      result = result.toString().replaceAll("Cata de óbito:", "Data de óbito:");
      result = result.toString().replaceAll("Data de Óbito:", "Data de óbito:");
      result = result.toString().replaceAll("Dúvidasfinformaçoe", "");
      result =
          result.toString().replaceAll("NOTA DE CONTRATAÇÃO DE FUNERAL", "");
      result = result.toString().replaceAll("Dúvidasfinformaçoe", "");
      result = result.toString().replaceAll("Tipo de Contratação:", "");
      result = result.toString().replaceAll("Emissão:", "");
      result = result.toString().replaceAll("Agincia:", "");
      result = result.toString().replaceAll("Peso:", "");
      result = result
          .toString()
          .replaceAll("Grau de ParentescO:", "Grau de Parentesco:");
      result = result.toString().replaceAll("Irmàotà)", "Irmão(a)");
      result = result.toString().replaceAll("Co-npanhe ro", "Companheiro");
      result = result.toString().replaceAll("Cornpanneirote", "Companheiro");
      result = result.toString().replaceAll("Companhei ro", "Companheiro");
      result = result.toString().replaceAll("Idade:", "");
      result = result.toString().replaceAll("anos", "");
      result = result.toString().replaceAll("Altura:", "");
      result = result.toString().replaceAll("cidade", "CIDADE");
      result = result.toString().replaceAll("Cidade", "CIDADE");
      result = result.toString().replaceAll("CIDADI", "CIDADE");
      result = result.toString().replaceAll("CICADE", "CIDADE");
      result = result.toString().replaceAll("SSP-SP-SP", "SSP-SP");
      result = result.toString().replaceAll("SSP", "SSP-SP");
      result = result
          .toString()
          .replaceAll("Serviço Funerário do Município de São Paulo", "");
      result = result
          .toString()
          .replaceAll("Local de Remoção:", "Local da Remoção:");
      result = result
          .toString()
          .replaceAll("Local de Remoção ", "Local da Remoção:");
      result =
          result.toString().replaceAll("Local do Remoção", "Local da Remoção:");
    });
    return result;
  }

  _handleResultTXT(Object result, int tipo, String nome_txt) async {
    setState(() {
      if (tipo == 0) {
        txt_txt0 = result;

        txt_txt0 = txt_txt0.toString().replaceAll("	", "\n");
        txt_txt0 = txt_txt0.toString().replaceAll("CIDADE", "");
        txt_txt0 =
            "CIDADE " + nome_txt.toString() + "123abc " + txt_txt0.toString();
        txt_txt0 = ArrumarPalavras(txt_txt0);
        txt_pdf_txt = txt_txt0;
      } else {
        txt_txt1 = result;
        nome_arq[tipo] = nome_txt.toString();
        txt_txt1 = txt_txt1.toString().replaceAll("	", "\n");
        txt_txt1 = txt_txt1.toString().replaceAll("CIDADE", "");
        txt_txt1 =
            "CIDADE " + nome_txt.toString() + "123abc " + txt_txt1.toString();
        txt_txt1 = ArrumarPalavras(txt_txt1);
        txt_pdf_txt = txt_pdf_txt +
            "\n\n ---------------- Arquivo " +
            " ------------------ \n\n" +
            txt_txt1;
      }
    });
  }

  _handleResult(Object result, int tipo) async {
    if (tipo == 0) {
      _bytesData0 = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile0 = _bytesData0;
      PdfDocument document = PdfDocument(inputBytes: _selectedFile0);
      pdf_txt0 = PdfTextExtractor(document).extractText();
      txt_txt0 = ArrumarPalavras(txt_txt0);
      txt_pdf_txt = pdf_txt0;
      setState(() {});
      document.dispose();
    } else {
      _bytesData1 = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile1 = _bytesData1;
      PdfDocument document = PdfDocument(inputBytes: _selectedFile1);
      pdf_txt1 = PdfTextExtractor(document).extractText();
      txt_txt1 = ArrumarPalavras(txt_txt1);
      txt_pdf_txt = txt_pdf_txt +
          "\n\n -------- Arquivo " +
          tipo.toString() +
          " -------- \n\n" +
          pdf_txt1;
      setState(() {});
      document.dispose();
    }
  }

  Valores_resultado(String txt) {
    try {
      nome_arq = txt.toString().split("123abc");
    } catch (f) {
      nome_arq[0] = "Sem Nome";
    }
    if (nome_arq[0].length >= 65) {
      nome_arq[0] = "Sem Nome";
    }
    try {
      contratante = txt.toString().split("Contratante:");
      contratante = contratante[1].toString().split("Grau de Parentesco:");
      contratante[0] = contratante[0].toString().replaceAll("Nome Social:", "");
      if (contratante[0].length >= 75) {
        contratante = txt.toString().split("Contratante:");
        contratante = contratante[1].split("Nome Social:");
      }
      try {
        contratante = contratante[0].toString().split("CPF:");
      } catch (f) {
        contratante = txt.toString().split("Contratante:");
        contratante = contratante[1].toString().split("Grau de Parentesco:");
        contratante[0] =
            contratante[0].toString().replaceAll("Nome Social:", "");
        if (contratante[0].length >= 75) {
          contratante = txt.toString().split("Contratante:");
          contratante = contratante[1].split("Nome Social:");
        }
      }
    } catch (e) {
      contratante[0] = "<vermelho>erro</vermelho>";
    }
    try {
      try {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("Nome Social:");
        if (grau_parentesco[0].length > 20) {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco = grau_parentesco[1].toString().split("Falecido:");
        }
      } catch (e) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("BROMELIA ");
        if (grau_parentesco[0] == "") {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco[0] = grau_parentesco[1].toString().substring(0, 17);
        }
      }

      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("Cel.:");
        try {
          grau_parentesco = grau_parentesco[0].toString().split("CPF:");
        } catch (e) {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco = grau_parentesco[1].toString().split("Cel.:");
        }
      }
      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("1");
        grau_parentesco[0] = grau_parentesco[0].toString().replaceAll("ep", "");
      }
      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("(DOIS)");
      }
      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split(")");
        grau_parentesco[0] = grau_parentesco[0] + ")";
      }
      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco = grau_parentesco[1].toString().split("RG:");
        grau_parentesco[0] = grau_parentesco[0];
      }
      if (grau_parentesco[0].length > 21) {
        grau_parentesco = txt.toString().split("Grau de Parentesco:");
        grau_parentesco[0] = grau_parentesco[1].toString().substring(0, 17);
        grau_parentesco = txt.toString().split(" ");
      }
      if (grau_parentesco[0].toString() == "null") {
        try {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco = grau_parentesco[1].toString().split("ITENS");
        } catch (e) {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco[0] = grau_parentesco[1];
        }
      }
      if (grau_parentesco[0] == "") {
        try {
          grau_parentesco = txt.toString().split("Grau de Parentesco:");
          grau_parentesco = grau_parentesco[1].toString().split("BROMELIA ");
        } catch (e) {}
      }
      grau_parentesco[0] = grau_parentesco[0].toString().replaceAll("RG:", "");
    } catch (e) {
      grau_parentesco[0] = "<vermelho>erro</vermelho>";
    }
    try {
      cpf = txt.toString().split("CPF:");
      cpf = cpf[1].toString().split("RG:");
      cpf[0] = cpf[0].toString().replaceAll(".", "");
      cpf[0] = cpf[0].toString().replaceAll("-", "");
      cpf[0] = cpf[0].toString().replaceAll(" ", "");
      if (cpf[0].length >= 14) {
        cpf = txt.toString().split("CPF:");
        cpf = cpf[1].toString().split("Nome da Mãe:");
        cpf[0] = cpf[0].toString().replaceAll(".", "");
        cpf[0] = cpf[0].toString().replaceAll("-", "");
        cpf[0] = cpf[0].toString().replaceAll(" ", "");
      }
      if (cpf[0].length >= 19) {
        cpf = txt.toString().split("CPF:");
        cpf = cpf[1].toString().split("Grau de Parentesco:");
        cpf[0] = cpf[0].toString().replaceAll(".", "");
        cpf[0] = cpf[0].toString().replaceAll(".", "");
        cpf[0] = cpf[0].toString().replaceAll(" ", "");
      }
    } catch (e) {}

    try {
      rg = txt.toString().split("RG:");
      rg = rg[1].toString().split("SSP-SP");
      rg[0] = rg[0].toString().replaceAll(".", "");
      rg[0] = rg[0].toString().replaceAll("-", "");
      if (rg[0].length > 10) {
        rg = txt.toString().split("RG:");
        rg = rg[1].toString().split("Cel.:");
        rg[0] = rg[0].toString().replaceAll(".", "");
        rg[0] = rg[0].toString().replaceAll("-", "");
      }
      if (rg[0].length > 10) {
        rg = txt.toString().split("RG:");
        rg = rg[1].toString().split("Nome da Mãe:");
        rg[0] = rg[0].toString().replaceAll(".", "");
        rg[0] = rg[0].toString().replaceAll("-", "");
      }
      if (rg[0].length > 10) {
        rg = txt.toString().split("RG:");
        rg[0] = rg[1].toString().substring(0, 10);
        rg[0] = rg[0].toString().replaceAll(".", "");
        rg[0] = rg[0].toString().replaceAll("-", "");
      }
    } catch (e) {
      rg[0] = "<vermelho>erro</vermelho>";
    }
    try {
      try {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Nome da Mãe:");
        cel[0] = cel[0].toString().replaceAll("SP", "");
      } catch (e) {}
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Local da Remoção:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("SP");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Falecido:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Endereço:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Endereço:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Local da Remoção:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("SP");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Falecido:");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("SP");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Taxa");
      }
      if (cel[0].toString() == "null") {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("Contratante:");
      }
      if (cel[0].toString() == "null") {
        cel = txt.toString().split("Cel.:");
        cel = cel[1].toString().split("ITENS");
      }
      if (cel[0].toString() == "null") {
        cel = txt.toString().split("ep1.:43.)");
        cel = cel[1].toString().split("SFMSP");
      }
      if (cel[0].length > 17) {
        cel = txt.toString().split("Cel.:");
        cel[0] = cel[1].toString().substring(0, 17);
      }
    } catch (e) {}
    try {
      try {
        endereco = txt.toString().split("Endereço:");
        endereco = endereco[1].toString().split("CEP:");
        endereco[0] = endereco[0].toString() +
            "CEP: " +
            endereco[1].toString().substring(0, 10);

        if (endereco[0].length > 115) {
          endereco = endereco[1].toString().toString().split("Endereço:");
          endereco[0] = endereco[1].toString().substring(0, 120);
        }
      } catch (e) {
        endereco = txt.toString().split("Endereço:");
        endereco = endereco[1].toString().split("Data do Sepultamento:");
        if (endereco[0].length > 115) {
          endereco = endereco[1].toString().toString().split("Endereço:");
          endereco[0] = endereco[1].toString().substring(0, 120);
        }
      }
    } catch (e) {
      try {
        endereco = txt.toString().split("Endereço:");
        endereco = endereco[1].toString().split("Nome Social");
        if (endereco[0].length > 115) {
          endereco = endereco[1].toString().toString().split("Endereço:");
          endereco[0] = endereco[1].toString().substring(0, 120);
        }
      } catch (e) {
        try {
          endereco = txt.toString().split("Endereço:");
          endereco = endereco[1].toString().split("Falecido");
          if (endereco[0].length > 115) {
            endereco = endereco[1].toString().toString().split("Endereço:");
            endereco[0] = endereco[1].toString().substring(0, 120);
          }
        } catch (e) {
          endereco = endereco[1].toString().toString().split("Endereço:");
          endereco[0] = endereco[1].toString().substring(0, 120);
        }
      }
    }

    try {
      try {
        falecido = txt.toString().split("Falecido:");
        falecido = falecido[1].toString().split("Sexo:");
      } catch (e) {
        falecido = txt.toString().split("Falecido:");
        falecido = falecido[1].toString().split("N°");
      }

      if (falecido[0].length > 70) {
        falecido = txt.toString().split("Falecido:");
        falecido = falecido[1].toString().split("N°");
      }

      if (falecido[0] == null || falecido[0].toString() == "null") {
        try {
          falecido = txt.toString().split("Falecido:");
          falecido = falecido[1].toString().split("RG:");
        } catch (e) {
          falecido = txt.toString().split("Falecido:");
          falecido = falecido[1].toString().split("Contratante:");
        }
      }
      if (falecido[0].length > 70) {
        falecido = txt.toString().split("Falecido:");
        falecido[0] = falecido[1].toString().substring(0, 66);
      }
      try {
        falecido = falecido[0].toString().split("\n");
        falecido[0] = falecido[0].toString().replaceAll("Nome Social:", "");
        falecido[0] = falecido[0].toString().replaceAll("Data de óbito:", "");
      } catch (e) {}
    } catch (e) {
      if (falecido[0] == null || falecido[0].toString() == "null") {
        try {
          falecido = txt.toString().split("Falecido:");
          falecido = falecido[1].toString().split("RG:");
        } catch (e) {
          falecido = txt.toString().split("Falecido:");
          falecido = falecido[1].toString().split("Contratante:");
        }
      }
      if (falecido[0].length > 70) {
        falecido = txt.toString().split("Falecido:");
        falecido[0] = falecido[1].toString().substring(0, 66);
      }
    }
    try {
      try {
        data_obito = txt.toString().toString().split("Data de óbito:");
        data_obito = data_obito[1].split("Horário:");

        if (data_obito[0].length > 11) {
          data_obito = txt.toString().toString().split("Data de óbito:");
          data_obito[0] = data_obito[1].toString().substring(0, 12);
        }
        if (data_obito[0].length > 12) {
          data_obito = txt.toString().split("Data de óbito:");
          data_obito = data_obito[1].toString().split("N°");
        }
      } catch (e) {
        data_obito = txt.toString().toString().split("Data de óbito:");
        data_obito = data_obito[1].split("Horário:");

        if (data_obito[0].length > 11) {
          data_obito = txt.toString().toString().split("Data de óbito:");
          data_obito[0] = data_obito[1].toString().substring(0, 12);
        }
        if (data_obito[0].length > 12) {
          data_obito = txt.toString().split("Data de óbito:");
          data_obito = data_obito[1].toString().split("N°");
        }
      }
    } catch (e) {
      data_obito[0] = "<vermelho>erro</vermelho>";
    }
    data_obito[0] = data_obito[0].toString().replaceAll(" ", "");
    data_obito[0] = data_obito[0].toString().substring(0, 2) +
        "/" +
        data_obito[0].toString().substring(3, 5) +
        "/" +
        data_obito[0].toString().substring(6, 10);

    try {
      try {
        causa_morte = txt.toString().split("Causa da Morte:");
        causa_morte = causa_morte[1].toString().split("Local da Remoção:");
        if (causa_morte[0].length > 150) {
          causa_morte = txt.toString().split("Causa da Morte:");
          causa_morte[0] = causa_morte[1].toString().substring(0, 150);
        }
      } catch (e) {}
      causa_morte[0] = causa_morte[0].toString().replaceAll("\n", "");
    } catch (e) {
      causa_morte[0] = "<vermelho>erro</vermelho>";
    }

    if (rg[0] == null) {
      rg = txt.toString().split("RG:");
      rg[1] = rg[1].toString().replaceAll(" ", "");
      rg[0] = rg[1].toString().substring(0, 10);
    }
    if (nome_arq[0] == null) {
      nome_arq[0] = "Sem Nome";
    }
    if (cpf[0] == null) {
      cpf = txt.toString().split("CPF:");
      cpf[1] = cpf[1].toString().replaceAll(" ", "");
      cpf[0] = cpf[1].toString().substring(0, 15);
    }
    if (cel[0] == null) {
      cel = txt.toString().split("Cel.:");
      cel[1] = cel[1].toString().replaceAll(" ", "");
      cel[0] = cel[1].toString().substring(0, 17);
    }
    if (data_obito[0] == null) {
      data_obito = txt.toString().toString().split("Data de óbito:");
      data_obito[1] = data_obito[1].toString().replaceAll(" ", "");
      data_obito[0] = data_obito[1].toString().substring(0, 12);
    }
    if (grau_parentesco[0] == null) {
      grau_parentesco = txt.toString().split("Grau de Parentesco:");
      grau_parentesco[1] = grau_parentesco[1].toString().replaceAll(" ", "");
      grau_parentesco[0] = grau_parentesco[1].toString().substring(0, 17);
    }
    if (falecido[0] == null) {
      falecido = txt.toString().split("Falecido:");
      falecido[0] = falecido[1].toString().substring(0, 66);
    }
    if (contratante[0] == null) {
      contratante = txt.toString().split("Falecido:");
      contratante[0] = contratante[1].toString().substring(0, 70);
    }
    if (endereco[0] == null) {
      endereco = txt.toString().split("Endereço:");
      endereco[0] = endereco[1].toString().substring(0, 70);
    }
    /////
    if (rg[0].length > 10) {
      rg = txt.toString().split("RG:");
      rg[1] = rg[1].toString().replaceAll(" ", "");
      rg[1] = rg[1].toString().replaceAll("\n", "");
      rg[0] = rg[1].toString().substring(0, 10);
    }

    if (cpf[0].length > 19) {
      cpf = txt.toString().split("CPF:");
      cpf[1] = cpf[1].toString().replaceAll(" ", "");
      cpf[1] = cpf[1].toString().replaceAll("\n", "");
      cpf[0] = cpf[1].toString().substring(0, 15);
    }
    if (cel[0].length > 17) {
      cel = txt.toString().split("Cel.:");
      cel[1] = cel[1].toString().replaceAll(" ", "");
      cel[1] = cel[1].toString().replaceAll("\n", "");
      cel[0] = cel[1].toString().substring(0, 17);
    }
    if (data_obito[0].length > 11) {
      data_obito = txt.toString().toString().split("Data de óbito:");
      data_obito[1] = data_obito[1].toString().replaceAll(" ", "");
      data_obito[1] = data_obito[1].toString().replaceAll("\n", "");
      data_obito[0] = data_obito[1].toString().substring(0, 12);
    }
    if (grau_parentesco[0].length > 20) {
      grau_parentesco = txt.toString().split("Grau de Parentesco:");
      grau_parentesco[1] = grau_parentesco[1].toString().replaceAll(" ", "");
      grau_parentesco[1] = grau_parentesco[1].toString().replaceAll("\n", "");
      grau_parentesco[0] = grau_parentesco[1].toString().substring(0, 20);
    }
    if (falecido[0].length > 66) {
      falecido = txt.toString().split("Falecido:");
      falecido[1] = falecido[1].toString().replaceAll("\n", "");
      falecido[0] = falecido[1].toString().substring(0, 66);
    }
    if (endereco[0].length > 180) {
      endereco = txt.toString().split("Endereço:");
      endereco[1] = endereco[1].toString().replaceAll("\n", "");
      endereco[0] = endereco[1].toString().substring(0, 180);
    }
    if (contratante[0].length > 70) {
      contratante = txt.toString().split("Falecido:");
      contratante[1] = contratante[1].toString().replaceAll("\n", "");
      contratante[0] = contratante[1].toString().substring(0, 70);
    }
  }

  Widget child;
  String crtt,
      gl_prt,
      cpf_txt,
      rg_txt,
      cel_txt,
      endre_txt,
      fale_cido,
      data_txt,
      causa_mt;
  List<String> txt_lista, txt_lista2, txt_lista_simples;
  List<String> contratante,
      grau_parentesco,
      nome_social,
      cel,
      cpf,
      rg,
      endereco,
      falecido,
      data_obito,
      causa_morte;
  List<String> contratante_txt = [],
      graul_txtx = [],
      cpf_lista = [],
      rg_lista = [],
      cel_lista = [],
      end_lista = [],
      falecido_lista = [],
      data_ob = [],
      causa_mt_lista = [],
      nome_real = [];

  String resultado = "ainda não ";
  String test_nome;
  int numero_arquivos2 = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: Container(
              width: sizeW * 0.1,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TelaFiltro()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: sizeW * 0.025,
                    ),
                    Text(
                      ' Voltar',
                      style: TextStyle(
                          fontSize: sizeW * 0.02,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.blueAccent[400],
            actions: [
              Form(
                autovalidate: true,
                key: _formKey,
                child: Container(
                  width: sizeW * 0.2,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (pdf_txt_tipo) {
                        startWebFilePickerTXT();
                      } else {
                        startWebFilePicker();
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.archive,
                          size: sizeW * 0.025,
                        ),
                        Text(
                          ' Pegar Arquivo',
                          style: TextStyle(
                              fontSize: sizeW * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: sizeW * 0.2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      try {
                        txt_filtrado = "";
                        String um = "", arrume = "";
                        arrume = value_txt.text;
                        arrume = ArrumarPalavras(arrume);
                        value_txt.text = arrume;
                        txt_lista = value_txt.text.toString().split("CIDADE");
                        int numero_arquivos = txt_lista.length;
                        numero_arquivos2 = numero_arquivos;
                        int contagem = 0;
                        while (contagem < numero_arquivos) {
                          um = txt_lista[contagem].toString();
                          um = ArrumarPalavras(um);
                          Valores_resultado(um);
                          test_nome = nome_arq[0].toString();
                          nome_real[contagem] = test_nome;
                          crtt = contratante[0].toString();
                          contratante_txt[contagem] = crtt;
                          gl_prt = grau_parentesco[0].toString();
                          graul_txtx[contagem] = gl_prt;
                          cpf_txt = cpf[0].toString();
                          cpf_lista[contagem] = cpf_txt;
                          cel_txt = cel[0].toString();
                          cel_lista[contagem] = cel_txt;
                          rg_txt = rg[0].toString();
                          rg_lista[contagem] = rg_txt;
                          endre_txt = endereco[0].toString();
                          end_lista[contagem] = endre_txt;
                          fale_cido = falecido[0].toString();
                          falecido_lista[contagem] = fale_cido.toString();
                          data_txt = data_obito[0].toString();
                          data_ob[contagem] = data_txt.toString();
                          causa_mt = causa_morte[0].toString();
                          causa_mt_lista[contagem] = causa_mt;
                          um = "<bold>Nome do Arquivo:</bold> " +
                              nome_real[0] +
                              "\n\n" +
                              "\n<bold>Contratante:</bold> " +
                              contratante_txt[0] +
                              "\n<bold>Grau de Parentesco:</bold> " +
                              graul_txtx[0] +
                              "\n<bold>CPF:</bold> " +
                              cpf_lista[0] +
                              "\n<bold>Cel:</bold> " +
                              cel_lista[0] +
                              "\n<bold>RG:</bold> " +
                              rg_lista[0] +
                              "\n<bold>Endereço:</bold> " +
                              end_lista[0] +
                              "\n<bold>Falecido:</bold> " +
                              falecido_lista[0] +
                              "\n<bold>Data de Óbito:</bold> " +
                              data_ob[0] +
                              "\n<bold>Causa da Morte:</bold>" +
                              causa_mt_lista[0];
                          if (contagem < 0) {
                            txt_filtrado = um;
                          } else {
                            txt_filtrado = txt_filtrado +
                                "\n----------------------------------------------------------------" +
                                "----------------------------------------------------------------\n" +
                                um;
                          }
                          contagem++;
                        }

                        contagem = 0;
                      } catch (e) {
                        txt_filtrado =
                            "Sempre no inicio de cada arquivo de conter a palavra CIDADE";
                      }
                    });
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search,
                          size: sizeW * 0.025,
                        ),
                        Text(
                          ' Filtrar',
                          style: TextStyle(
                              fontSize: sizeW * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ),
              Container(
                width: sizeW * 0.2,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controleExcel == 0) {
                      int numero_arquivos = txt_lista.length;
                      int contagem = 0;
                      try {
                        while (contagem < numero_arquivos) {
                          String valor = causa_mt_lista[contagem].toString();

                          FeedbackTest formsnback = FeedbackTest(
                              contratante_txt[contagem].toString(),
                              graul_txtx[contagem].toString(),
                              cpf_lista[contagem].toString(),
                              rg_lista[contagem].toString(),
                              cel_lista[contagem].toString(),
                              end_lista[contagem].toString(),
                              falecido_lista[contagem].toString(),
                              data_ob[contagem].toString(),
                              valor.toString(),
                              nome_real[contagem].toString());
                          FromController fromcontroller =
                              FromController((String response) {
                            print(response);
                            setState(() {
                              resultado = response;
                            });
                            if (response == FromController.STATUS_SUCCESS) {
                            } else {}
                          });
                          fromcontroller.submitForm(formsnback);
                          // await Future.delayed(Duration(milliseconds: 114));
                          contagem++;
                        }
                        setState(() {});
                      } catch (e) {
                        setState(() {
                          resultado = e.toString();
                        });
                      }
                    }
                    if (controleExcel == 1) {
                      try {
                        int numero_arquivos = txt_lista.length;
                        int contagem = 0;

                        while (contagem < numero_arquivos) {
                          String valor = causa_mt_lista[contagem].toString();
                          FeedbackPerfilSTS formsnback = FeedbackPerfilSTS(
                              nome_real[contagem].toString(),
                              contratante_txt[contagem].toString(),
                              graul_txtx[contagem].toString(),
                              cpf_lista[contagem].toString(),
                              rg_lista[contagem].toString(),
                              cel_lista[contagem].toString(),
                              end_lista[contagem].toString(),
                              falecido_lista[contagem].toString(),
                              data_ob[contagem].toString(),
                              valor.toString());
                          ControlePerfilSTS fromcontroller =
                              ControlePerfilSTS((String response) {
                            print(response);
                            setState(() {
                              resultado = response;
                            });
                            if (response == FromController.STATUS_SUCCESS) {
                            } else {}
                          });
                          fromcontroller.submitForm(formsnback);
                          //await Future.delayed(Duration(milliseconds: 114));
                          setState(() {});
                        }
                      } catch (e) {
                        setState(() {
                          resultado = e.toString();
                        });
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.save,
                        size: sizeW * 0.025,
                      ),
                      Text(
                        ' Salvar',
                        style: TextStyle(
                            fontSize: sizeW * 0.02,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
        body: Container(
          width: sizeW,
          height: sizeH,
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: sizeW * 0.485,
                    height: sizeH,
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.red[600], width: 4),
                    ),
                    child: TextField(
                      controller: value_txt,
                      decoration: InputDecoration(
                        hintText: "Digite aqui...",
                      ),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  SizedBox(width: sizeW * 0.02),
                  Container(
                    width: sizeW * 0.485,
                    height: sizeH,
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.green[600], width: 4),
                    ),
                    child: StyledText.selectable(
                      showCursor: false,
                      cursorWidth: 15,
                      cursorColor: Colors.blue.shade200,
                      newLineAsBreaks: true,
                      text: txt_filtrado,
                      styles: {
                        'bold': TextStyle(fontWeight: FontWeight.bold),
                        'vermelho': TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
