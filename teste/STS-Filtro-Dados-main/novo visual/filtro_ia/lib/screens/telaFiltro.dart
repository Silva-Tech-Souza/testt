import 'package:decorated_icon/decorated_icon.dart';
import 'package:filtro_ia/controller/filtro_interno.dart';
import 'package:filtro_ia/controller/parametros.dart';
import 'package:filtro_ia/screens/telaLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:html';
import 'dart:io' as html;
import 'package:http/http.dart' as https;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '/controller/arrumar_palavra.dart';
import '/controller/conexao.dart';
import 'dart:convert';
import 'dart:convert' show utf8;
import 'dart:typed_data';

class TelaFiltro extends StatefulWidget {
  @override
  _TelaFiltroState createState() => _TelaFiltroState();
}

class _TelaFiltroState extends State<TelaFiltro> {
  var arrayJson = ["0", "1"];
  var array_json_ty = ["0", "1"], um = ["0", "0"];
  bool carrengando = false;
  List<String> contratante_txt1 = ["0", "1"],
      graul_txtx1 = ["0", "1"],
      cpf_lista1 = ["0", "1"],
      rg_lista1 = ["0", "1"],
      cel_lista1 = ["0", "1"],
      end_lista1 = ["0", "1"],
      falecido_lista1 = ["0", "1"],
      data_ob1 = ["0", "1"],
      causa_mt_lista1 = ["0", "1"];
  int erros = 0;
  ArrumerErros erros_palavras = ArrumerErros();
  List<String> nome_aqv = ["0", "1"],
      _aqv = [],
      contratante_txt = ["0", "1"],
      graul_txtx = ["0", "1"],
      cpf_lista = ["0", "1"],
      rg_lista = ["0", "1"],
      cel_lista = ["0", "1"],
      end_lista = ["0", "1"],
      falecido_lista = ["0", "1"],
      data_ob = ["0", "1"],
      causa_mt_lista = ["0", "1"];

  int quantidade_arquivos = 0;
  int quantidade_erros = 0;
  var valor_teste_contratante = ["0"];
  var valor_teste_rg = ["0"];
  var valor_teste_cpf = ["0"];
  var valor_teste_cel = ["0"];
  var valor_teste_parentesco = ["0"];
  var valor_teste_causa = ["0"];
  var valor_teste_end = ["0"];
  var valor_teste_data = ["0"];
  List<Color> corFundo = [Color(0xff2981D2)];
  String resultado = "ainda não ";
  ArrumerPalavra _arrumerPalavra = ArrumerPalavra();
  Uint8List _bytesData0;
  TextEditingController _controller_cel = TextEditingController();
  TextEditingController _controller_contratante = TextEditingController();
  TextEditingController _controller_cpf = TextEditingController();
  TextEditingController _controller_endereco = TextEditingController();
  TextEditingController _controller_falecido = TextEditingController();
  TextEditingController _controller_morte = TextEditingController();
  TextEditingController _controller_nomeaqv = TextEditingController();
  TextEditingController _controller_parenteco = TextEditingController();
  TextEditingController _controller_rg = TextEditingController();
  TextEditingController _controller_obito = TextEditingController();
  int _numeros_arq = 0, _numeros_page = 0;
  List<int> _selectedFile0;
  String _txt_pdf_txt = "", tipo_aqv = "", _txt_txt0 = "", _pdf_txt0 = "";
  int valor_lista = 0;
  TextEditingController _value_txt = TextEditingController();

  limpar() async {
    _value_txt.text = "";

    _txt_pdf_txt = "";
    um = ["1"];
    contratante_txt1 = ["0", "0"];
    graul_txtx1 = ["0", "0"];
    cpf_lista1 = ["0", "0"];
    rg_lista1 = ["0", "0"];
    cel_lista1 = ["0", "0"];
    end_lista1 = ["0", "0"];
    falecido_lista1 = ["0", "0"];
    erros = 0;
    data_ob1 = ["0", "0"];
    causa_mt_lista1 = ["0", "0"];
  }

  Future startWebFilePicker() async {
    //funçaõ que pega arquivos
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.accept = ".txt,.pdf,.TXT,.PDF,.pdf*,.PDF*";
    uploadInput.click();
    //limpo as variaveis para não correre o risco de chugeira
    limpar();
    try {
      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        _numeros_arq = files.length;
        for (int i = 0; i < _numeros_arq; i++) {
          final file = files[i];
          final reader = new FileReader(); //crio o cara q vai rrenderizar
          tipo_aqv = file.name.toString().substring(file.name.length - 3);
          setState(() {
            nome_aqv[i] = file.name;
          });
          reader.onLoadEnd.listen((e) async {
            //aqui vai ser acionado assim que ele terminar de renderizrar

            await _handleResultTXT(reader.result, i).then((value) async {
              String err = await DuplaAnalize(i);
              print(err);
              if (err == "erros") {
                if (erros != _numeros_arq) {
                  erros++;
                  setState(() {});
                }
              }
            });

            setState(() {});
            if (i + 1 == _numeros_arq) {
              await Future.delayed(Duration(seconds: 4));
              carrengando = false;
              valor_lista = _numeros_arq;
              setState(() {});
            }
          });
          reader.onError.listen((event) {
            carrengando = false;
          });
          if (tipo_aqv == "txt" || tipo_aqv == "TXT") {
            reader.readAsText(file, 'ISO-8859-1');
          } else {
            reader.readAsDataUrl(file);
          }
        }
      });
    } catch (x) {}
    return "";
  }

//IA
  Future<String> conexao(texto, int tipo) async {
    try {
      //AO RETORNA ALGO ELA FAZ OQ ESTA NO THEN
      texto = "$texto";
      var url = Uri.parse(
          "https://f9ddb2dc.us-south.apigw.appdomain.cloud/api_rest_system_filter_pdf/action_system_filter_pdf");
      final response = await https
          .post(url,
              headers: {
                "accept": "application/json",
                "X-IBM-Client-Id": "298528e6-dfd6-45c4-bacf-cb0a00e927a2",
                "content-type": "application/json"
              },
              body: json.encode({
                "text": "${texto.toString()}",
                "features": json.encode({
                  "entities": json
                      .encode({"model": "27c7b3f9-565d-4ca9-b3e3-dce675039e74"})
                })
              }))
          .then((value) async {
        try {
          var variavel;
          var jsonTxt;
          var length1;
          int len;

          variavel = jsonDecode(utf8.decode(value.bodyBytes));
          jsonTxt = variavel['result'];
          length1 = jsonTxt['entities'];
          len = length1.length;

          for (int i = 0; i <= len; i++) {
            arrayJson[i] = jsonTxt['entities'][i]['text'].toString();
            array_json_ty[i] = jsonTxt['entities'][i]['type'].toString();

            if (array_json_ty[i] == "contratante") {
              contratante_txt1[tipo] = arrayJson[i].toString();
              if (contratante_txt1[tipo].length < 13) {
                contratante_txt1[tipo] =
                    await erros_palavras.palavraContratante(texto.toString());
              }
              setState(() {});
            } else if (array_json_ty[i] == "grau_parentesco") {
              graul_txtx1[tipo] = arrayJson[i].toString();
              setState(() {});
            } else if (array_json_ty[i] == "cpf") {
              cpf_lista1[tipo] = arrayJson[i].toString();
              setState(() {});
              if (cpf_lista1[tipo].length < 18) {
                cpf_lista1[tipo] =
                    await erros_palavras.palavraCPF(_aqv[tipo].toString());
              }
            } else if (array_json_ty[i] == "rg") {
              rg_lista1[tipo] = arrayJson[i].toString();
              setState(() {});
              if (rg_lista1[tipo].length < 15) {
                rg_lista1[tipo] =
                    await erros_palavras.palavraRG(_aqv[tipo].toString());
              }
            } else if (array_json_ty[i] == "cel") {
              cel_lista1[tipo] = arrayJson[i].toString();
              cel_lista1[tipo] =
                  cel_lista1[tipo].toString().replaceAll(":", "");
              setState(() {});
              if (cel_lista1[tipo].length < 17) {
                cel_lista1[tipo] =
                    await erros_palavras.palavraCel(_aqv[tipo].toString());
              }
            } else if (array_json_ty[i] == "endereco") {
              end_lista1[tipo] = arrayJson[i].toString();
              setState(() {});
            } else if (array_json_ty[i] == "falecido") {
              falecido_lista1[tipo] = arrayJson[i].toString();
              setState(() {});
            } else if (array_json_ty[i] == "causa_morte") {
              causa_mt_lista1[tipo] = arrayJson[i].toString();
              setState(() {});
            } else if (array_json_ty[i] == "data_obito") {
              data_ob1[tipo] = arrayJson[i].toString();
              data_ob1[tipo] = data_ob1[tipo].replaceAll("Data de óbito:", "");
              setState(() {});
            }
          }
        } catch (e) {}
      });

      setState(() {});
      return "";
    } catch (e) {
      setState(() {});
      return e.toString();
    }
  }

  Future _handleResultTXT(Object result, int tipo) async {
    try {
      //função de filtragem
      if (tipo_aqv == "txt" || tipo_aqv == "TXT") {
        _txt_txt0 = result;
        _txt_txt0 = _txt_txt0.toString().replaceAll("	", "\n");
        _txt_txt0 = await _arrumerPalavra.palavraArrumada(_txt_txt0.toString());
        setState(() {});
      } else {
        _bytesData0 =
            Base64Decoder().convert(result.toString().split(",").last);
        _selectedFile0 = _bytesData0;
        PdfDocument document = PdfDocument(inputBytes: _selectedFile0);
        _txt_txt0 = PdfTextExtractor(document).extractText(layoutText: true);
        setState(() {});
        _txt_txt0 = await _arrumerPalavra.palavraArrumada(_txt_txt0);
        document.dispose();
        setState(() {});
      }

      try {
        _aqv[tipo] = _txt_txt0.toString();
        String foi = await conexao(_aqv[tipo].toString(), tipo);
        print(foi);
        setState(() {});
      } catch (e) {
        _aqv[tipo] = e.toString();
      }
      setState(() {});
      await confereIaInterna(_aqv[tipo].toString(), tipo);

      setState(() {});
      if (rg_lista1[tipo] == null ||
          falecido_lista1[tipo] == null ||
          causa_mt_lista1[tipo] == null ||
          data_ob1[tipo] == null ||
          cel_lista1[tipo] == null ||
          graul_txtx1[tipo] == null ||
          contratante_txt1[tipo] == null ||
          end_lista1[tipo] == null ||
          cpf_lista1[tipo] == null ||
          rg_lista1[tipo].toString() == "erros" ||
          falecido_lista1[tipo].toString() == "erros" ||
          causa_mt_lista1[tipo].toString() == "erros" ||
          data_ob1[tipo].toString() == "erros" ||
          cel_lista1[tipo].toString() == "erros" ||
          end_lista1[tipo].toString() == "erros" ||
          graul_txtx1[tipo].toString() == "erros" ||
          contratante_txt1[tipo].toString() == "erros" ||
          cpf_lista1[tipo].toString() == "erros" ||
          rg_lista1[tipo].toString() == "0" ||
          falecido_lista1[tipo].toString() == "0" ||
          causa_mt_lista1[tipo].toString() == "0" ||
          data_ob1[tipo].toString() == "0" ||
          cel_lista1[tipo].toString() == "0" ||
          end_lista1[tipo].toString() == "0" ||
          graul_txtx1[tipo].toString() == "0" ||
          contratante_txt1[tipo].toString() == "0" ||
          cpf_lista1[tipo].toString() == "0" ||
          rg_lista1[tipo].toString() == "1" ||
          falecido_lista1[tipo].toString() == "1" ||
          causa_mt_lista1[tipo].toString() == "1" ||
          data_ob1[tipo].toString() == "1" ||
          cel_lista1[tipo].toString() == "1" ||
          end_lista1[tipo].toString() == "1" ||
          graul_txtx1[tipo].toString() == "1" ||
          contratante_txt1[tipo].toString() == "1" ||
          cpf_lista1[tipo].toString() == "1" ||
          causa_mt_lista1[tipo].isEmpty ||
          causa_mt_lista1[tipo].toString() == "null" ||
          causa_mt_lista1[tipo].toString() == "Não encontrada" ||
          causa_mt_lista1[tipo].toString() == "undefined" ||
          data_ob1[tipo].isEmpty ||
          data_ob1[tipo].toString() == "null" ||
          data_ob1[tipo].toString() == "Não encontrada" ||
          data_ob1[tipo].toString() == "undefined" ||
          falecido_lista1[tipo].isEmpty ||
          falecido_lista1[tipo].toString() == "null" ||
          falecido_lista1[tipo].toString() == "Não encontrada" ||
          falecido_lista1[tipo].toString() == "undefined" ||
          end_lista1[tipo].isEmpty ||
          end_lista1[tipo].toString() == "null" ||
          end_lista1[tipo].toString() == "Não encontrada" ||
          end_lista1[tipo].toString() == "undefined" ||
          cel_lista1[tipo].isEmpty ||
          cel_lista1[tipo] == "" ||
          cel_lista1[tipo].toString() == "Cel." ||
          cel_lista1[tipo].toString() == "null" ||
          cel_lista1[tipo].toString() == "Não encontrada" ||
          cel_lista1[tipo].toString() == "undefined" ||
          cpf_lista1[tipo].isEmpty ||
          cpf_lista1[tipo].toString() == "null" ||
          cpf_lista1[tipo].toString() == "Não encontrada" ||
          cpf_lista1[tipo].toString() == "undefined" ||
          graul_txtx1[tipo].isEmpty ||
          graul_txtx1[tipo].toString() == "null" ||
          graul_txtx1[tipo].toString() == "Não encontrada" ||
          graul_txtx1[tipo] == "undefined" ||
          rg_lista1[tipo].isEmpty ||
          rg_lista1[tipo].toString() == "null" ||
          rg_lista1[tipo].toString() == "Não encontrada" ||
          rg_lista1[tipo].toString() == "undefined" ||
          contratante_txt1[tipo].isEmpty ||
          contratante_txt1[tipo].toString() == "null" ||
          contratante_txt1[tipo].toString() == "Não encontrada" ||
          contratante_txt1[tipo].toString() == "undefined") {
        String foi = await conexao(_aqv[tipo].toString(), tipo);
        print(foi);
        setState(() {});
        await confereIaInterna(_aqv[tipo].toString(), tipo);

        setState(() {});
        if (rg_lista1[tipo] == null ||
            falecido_lista1[tipo] == null ||
            causa_mt_lista1[tipo] == null ||
            data_ob1[tipo] == null ||
            cel_lista1[tipo] == null ||
            graul_txtx1[tipo] == null ||
            end_lista1[tipo] == null ||
            contratante_txt1[tipo] == null ||
            cpf_lista1[tipo] == null ||
            rg_lista1[tipo].toString() == "erros" ||
            falecido_lista1[tipo].toString() == "erros" ||
            causa_mt_lista1[tipo].toString() == "erros" ||
            data_ob1[tipo].toString() == "erros" ||
            cel_lista1[tipo].toString() == "erros" ||
            end_lista1[tipo].toString() == "erros" ||
            graul_txtx1[tipo].toString() == "erros" ||
            contratante_txt1[tipo].toString() == "erros" ||
            cpf_lista1[tipo].toString() == "erros" ||
            rg_lista1[tipo].toString() == "0" ||
            falecido_lista1[tipo].toString() == "0" ||
            causa_mt_lista1[tipo].toString() == "0" ||
            data_ob1[tipo].toString() == "0" ||
            cel_lista1[tipo].toString() == "0" ||
            end_lista1[tipo].toString() == "0" ||
            graul_txtx1[tipo].toString() == "0" ||
            contratante_txt1[tipo].toString() == "0" ||
            cpf_lista1[tipo].toString() == "0" ||
            rg_lista1[tipo].toString() == "1" ||
            falecido_lista1[tipo].toString() == "1" ||
            causa_mt_lista1[tipo].toString() == "1" ||
            data_ob1[tipo].toString() == "1" ||
            cel_lista1[tipo].toString() == "1" ||
            end_lista1[tipo].toString() == "1" ||
            graul_txtx1[tipo].toString() == "1" ||
            contratante_txt1[tipo].toString() == "1" ||
            cpf_lista1[tipo].toString() == "1" ||
            causa_mt_lista1[tipo].isEmpty ||
            causa_mt_lista1[tipo].toString() == "null" ||
            causa_mt_lista1[tipo].toString() == "Não encontrada" ||
            causa_mt_lista1[tipo].toString() == "undefined" ||
            data_ob1[tipo].isEmpty ||
            data_ob1[tipo].toString() == "null" ||
            data_ob1[tipo].toString() == "Não encontrada" ||
            data_ob1[tipo].toString() == "undefined" ||
            falecido_lista1[tipo].isEmpty ||
            falecido_lista1[tipo].toString() == "null" ||
            falecido_lista1[tipo].toString() == "Não encontrada" ||
            falecido_lista1[tipo].toString() == "undefined" ||
            end_lista1[tipo].isEmpty ||
            end_lista1[tipo].toString() == "null" ||
            end_lista1[tipo].toString() == "Não encontrada" ||
            end_lista1[tipo].toString() == "undefined" ||
            cel_lista1[tipo].isEmpty ||
            cel_lista1[tipo] == "" ||
            cel_lista1[tipo].toString() == "Cel." ||
            cel_lista1[tipo].toString() == "null" ||
            cel_lista1[tipo].toString() == "Não encontrada" ||
            cel_lista1[tipo].toString() == "undefined" ||
            cpf_lista1[tipo].isEmpty ||
            cpf_lista1[tipo].toString() == "null" ||
            cpf_lista1[tipo].toString() == "Não encontrada" ||
            cpf_lista1[tipo].toString() == "undefined" ||
            graul_txtx1[tipo].isEmpty ||
            graul_txtx1[tipo].toString() == "null" ||
            graul_txtx1[tipo].toString() == "Não encontrada" ||
            graul_txtx1[tipo] == "undefined" ||
            rg_lista1[tipo].isEmpty ||
            rg_lista1[tipo].toString() == "null" ||
            rg_lista1[tipo].toString() == "Não encontrada" ||
            rg_lista1[tipo].toString() == "undefined" ||
            contratante_txt1[tipo].isEmpty ||
            contratante_txt1[tipo].toString() == "null" ||
            contratante_txt1[tipo].toString() == "Não encontrada" ||
            contratante_txt1[tipo].toString() == "undefined") {
          String foi = await conexao(_aqv[tipo].toString(), tipo);
          print(foi);
          await confereIaInterna(_aqv[tipo].toString(), tipo);
          setState(() {});
        } else {
          setState(() {});
        }
      } else {}
      setState(() {});
      return "erros";
    } catch (z) {
      return "";
    }
  }

  Future<String> DuplaAnalize(tipo) async {
    try {
      if (rg_lista1[tipo] == null ||
          falecido_lista1[tipo] == null ||
          causa_mt_lista1[tipo] == null ||
          data_ob1[tipo] == null ||
          cel_lista1[tipo] == null ||
          end_lista1[tipo] == null ||
          graul_txtx1[tipo] == null ||
          contratante_txt1[tipo] == null ||
          cpf_lista1[tipo] == null ||
          rg_lista1[tipo].toString() == "erros" ||
          falecido_lista1[tipo].toString() == "erros" ||
          causa_mt_lista1[tipo].toString() == "erros" ||
          data_ob1[tipo].toString() == "erros" ||
          cel_lista1[tipo].toString() == "erros" ||
          end_lista1[tipo].toString() == "erros" ||
          graul_txtx1[tipo].toString() == "erros" ||
          contratante_txt1[tipo].toString() == "erros" ||
          cpf_lista1[tipo].toString() == "erros" ||
          rg_lista1[tipo].toString() == "0" ||
          falecido_lista1[tipo].toString() == "0" ||
          causa_mt_lista1[tipo].toString() == "0" ||
          data_ob1[tipo].toString() == "0" ||
          cel_lista1[tipo].toString() == "0" ||
          end_lista1[tipo].toString() == "0" ||
          graul_txtx1[tipo].toString() == "0" ||
          contratante_txt1[tipo].toString() == "0" ||
          cpf_lista1[tipo].toString() == "0" ||
          rg_lista1[tipo].toString() == "1" ||
          falecido_lista1[tipo].toString() == "1" ||
          causa_mt_lista1[tipo].toString() == "1" ||
          data_ob1[tipo].toString() == "1" ||
          cel_lista1[tipo].toString() == "1" ||
          end_lista1[tipo].toString() == "1" ||
          graul_txtx1[tipo].toString() == "1" ||
          contratante_txt1[tipo].toString() == "1" ||
          cpf_lista1[tipo].toString() == "1" ||
          causa_mt_lista1[tipo].isEmpty ||
          causa_mt_lista1[tipo].toString() == "null" ||
          causa_mt_lista1[tipo].toString() == "Não encontrada" ||
          causa_mt_lista1[tipo].toString() == "undefined" ||
          data_ob1[tipo].isEmpty ||
          data_ob1[tipo].toString() == "null" ||
          data_ob1[tipo].toString() == "Não encontrada" ||
          data_ob1[tipo].toString() == "undefined" ||
          falecido_lista1[tipo].isEmpty ||
          falecido_lista1[tipo].toString() == "null" ||
          falecido_lista1[tipo].toString() == "Não encontrada" ||
          falecido_lista1[tipo].toString() == "undefined" ||
          end_lista1[tipo].isEmpty ||
          end_lista1[tipo].toString() == "null" ||
          end_lista1[tipo].toString() == "Não encontrada" ||
          end_lista1[tipo].toString() == "undefined" ||
          cel_lista1[tipo].isEmpty ||
          cel_lista1[tipo] == "" ||
          cel_lista1[tipo].toString() == "Cel." ||
          cel_lista1[tipo].toString() == "null" ||
          cel_lista1[tipo].toString() == "Não encontrada" ||
          cel_lista1[tipo].toString() == "undefined" ||
          cpf_lista1[tipo].isEmpty ||
          cpf_lista1[tipo].toString() == "null" ||
          cpf_lista1[tipo].toString() == "Não encontrada" ||
          cpf_lista1[tipo].toString() == "undefined" ||
          graul_txtx1[tipo].isEmpty ||
          graul_txtx1[tipo].toString() == "null" ||
          graul_txtx1[tipo].toString() == "Não encontrada" ||
          graul_txtx1[tipo] == "undefined" ||
          rg_lista1[tipo].isEmpty ||
          rg_lista1[tipo].toString() == "null" ||
          rg_lista1[tipo].toString() == "Não encontrada" ||
          rg_lista1[tipo].toString() == "undefined" ||
          contratante_txt1[tipo].isEmpty ||
          contratante_txt1[tipo].toString() == "null" ||
          contratante_txt1[tipo].toString() == "Não encontrada" ||
          contratante_txt1[tipo].toString() == "undefined") {
        String foi = await conexao(_aqv[tipo].toString(), tipo);
        print(foi);
        setState(() {});
        await confereIaInterna(_aqv[tipo].toString(), tipo);
        setState(() {});
        if (rg_lista1[tipo] == null ||
            falecido_lista1[tipo] == null ||
            causa_mt_lista1[tipo] == null ||
            data_ob1[tipo] == null ||
            cel_lista1[tipo] == null ||
            graul_txtx1[tipo] == null ||
            contratante_txt1[tipo] == null ||
            cpf_lista1[tipo] == null ||
            rg_lista1[tipo].toString() == "erros" ||
            falecido_lista1[tipo].toString() == "erros" ||
            causa_mt_lista1[tipo].toString() == "erros" ||
            data_ob1[tipo].toString() == "erros" ||
            cel_lista1[tipo].toString() == "erros" ||
            end_lista1[tipo].toString() == "erros" ||
            graul_txtx1[tipo].toString() == "erros" ||
            contratante_txt1[tipo].toString() == "erros" ||
            cpf_lista1[tipo].toString() == "erros" ||
            rg_lista1[tipo].toString() == "0" ||
            falecido_lista1[tipo].toString() == "0" ||
            causa_mt_lista1[tipo].toString() == "0" ||
            data_ob1[tipo].toString() == "0" ||
            cel_lista1[tipo].toString() == "0" ||
            end_lista1[tipo].toString() == "0" ||
            graul_txtx1[tipo].toString() == "0" ||
            contratante_txt1[tipo].toString() == "0" ||
            cpf_lista1[tipo].toString() == "0" ||
            rg_lista1[tipo].toString() == "1" ||
            falecido_lista1[tipo].toString() == "1" ||
            causa_mt_lista1[tipo].toString() == "1" ||
            data_ob1[tipo].toString() == "1" ||
            cel_lista1[tipo].toString() == "1" ||
            end_lista1[tipo].toString() == "1" ||
            graul_txtx1[tipo].toString() == "1" ||
            contratante_txt1[tipo].toString() == "1" ||
            cpf_lista1[tipo].toString() == "1" ||
            causa_mt_lista1[tipo].isEmpty ||
            causa_mt_lista1[tipo].toString() == "null" ||
            causa_mt_lista1[tipo].toString() == "Não encontrada" ||
            causa_mt_lista1[tipo].toString() == "undefined" ||
            data_ob1[tipo].isEmpty ||
            data_ob1[tipo].toString() == "null" ||
            data_ob1[tipo].toString() == "Não encontrada" ||
            data_ob1[tipo].toString() == "undefined" ||
            falecido_lista1[tipo].isEmpty ||
            falecido_lista1[tipo].toString() == "null" ||
            falecido_lista1[tipo].toString() == "Não encontrada" ||
            falecido_lista1[tipo].toString() == "undefined" ||
            end_lista1[tipo].isEmpty ||
            end_lista1[tipo].toString() == "null" ||
            end_lista1[tipo].toString() == "Não encontrada" ||
            end_lista1[tipo].toString() == "undefined" ||
            cel_lista1[tipo].isEmpty ||
            cel_lista1[tipo] == "" ||
            cel_lista1[tipo].toString() == "Cel." ||
            cel_lista1[tipo].toString() == "null" ||
            cel_lista1[tipo].toString() == "Não encontrada" ||
            cel_lista1[tipo].toString() == "undefined" ||
            cpf_lista1[tipo].isEmpty ||
            cpf_lista1[tipo].toString() == "null" ||
            cpf_lista1[tipo].toString() == "Não encontrada" ||
            cpf_lista1[tipo].toString() == "undefined" ||
            graul_txtx1[tipo].isEmpty ||
            graul_txtx1[tipo].toString() == "null" ||
            graul_txtx1[tipo].toString() == "Não encontrada" ||
            graul_txtx1[tipo] == "undefined" ||
            rg_lista1[tipo].isEmpty ||
            rg_lista1[tipo].toString() == "null" ||
            rg_lista1[tipo].toString() == "Não encontrada" ||
            rg_lista1[tipo].toString() == "undefined" ||
            contratante_txt1[tipo].isEmpty ||
            contratante_txt1[tipo].toString() == "null" ||
            contratante_txt1[tipo].toString() == "Não encontrada" ||
            contratante_txt1[tipo].toString() == "undefined") {
          String foi = await conexao(_aqv[tipo].toString(), tipo);
          print(foi);
          setState(() {});
          await confereIaInterna(_aqv[tipo].toString(), tipo);
          setState(() {});

          return "erros";
        } else {
          return "";
        }
      } else {
        return "";
      }
    } catch (x) {
      setState(() {});
      return "";
    }
  }

  Future<String> confereIaInterna(String txt, int tipo) async {
    try {
      if (contratante_txt1[tipo].isEmpty ||
          contratante_txt1[tipo].toString() == "null" ||
          contratante_txt1[tipo].toString() == "0" ||
          contratante_txt1[tipo].toString() == "1" ||
          contratante_txt1[tipo].toString() == "Não encontrada" ||
          contratante_txt1[tipo].toString() == "undefined") {
        contratante_txt1[tipo] =
            await erros_palavras.palavraContratante(_aqv[tipo].toString());
        setState(() {});
      }
      if (graul_txtx1[tipo].isEmpty ||
          graul_txtx1[tipo].toString() == "null" ||
          graul_txtx1[tipo].toString() == "0" ||
          graul_txtx1[tipo].toString() == "1" ||
          graul_txtx1[tipo].toString() == "Não encontrada" ||
          graul_txtx1[tipo] == "undefined") {
        graul_txtx1[tipo] =
            await erros_palavras.palavraGral(_aqv[tipo].toString());
        setState(() {});
      }
      if (cpf_lista1[tipo].isEmpty ||
          cpf_lista1[tipo].toString() == "null" ||
          cpf_lista1[tipo].toString() == "0" ||
          cpf_lista1[tipo].toString() == "1" ||
          cpf_lista1[tipo].toString() == "Não encontrada" ||
          cpf_lista1[tipo].toString() == "undefined") {
        cpf_lista1[tipo] =
            await erros_palavras.palavraCPF(_aqv[tipo].toString());
        setState(() {});
      }
      if (rg_lista1[tipo].isEmpty ||
          rg_lista1[tipo] == "" ||
          rg_lista1[tipo] == null ||
          rg_lista1[tipo].toString() == "null" ||
          rg_lista1[tipo].toString() == "0" ||
          rg_lista1[tipo].toString() == "1" ||
          rg_lista1[tipo].toString() == "Não encontrada" ||
          rg_lista1[tipo].toString() == "undefined") {
        rg_lista1[tipo] = await erros_palavras.palavraRG(_aqv[tipo].toString());
        setState(() {});
      }
      if (cel_lista1[tipo].isEmpty ||
          cel_lista1[tipo] == "" ||
          cel_lista1[tipo].toString() == "0" ||
          cel_lista1[tipo].toString() == "1" ||
          cel_lista1[tipo].toString() == "Cel." ||
          cel_lista1[tipo].toString() == "null" ||
          cel_lista1[tipo].toString() == "Não encontrada" ||
          cel_lista1[tipo].toString() == "undefined") {
        cel_lista1[tipo] =
            await erros_palavras.palavraCel(_aqv[tipo].toString());
        cel_lista1[tipo] = cel_lista1[tipo].toString().replaceAll(":", "");
        setState(() {});
      }
      if (end_lista1[tipo].isEmpty ||
          end_lista1[tipo] == "" ||
          end_lista1[tipo] == null ||
          end_lista1[tipo].toString() == "0" ||
          end_lista1[tipo].toString() == "1" ||
          end_lista1[tipo].toString() == "null" ||
          end_lista1[tipo].toString() == "Não encontrada" ||
          end_lista1[tipo].toString() == "undefined") {
        end_lista1[tipo] =
            await erros_palavras.palavrasEND(_aqv[tipo].toString());
        setState(() {});
      }
      if (falecido_lista1[tipo].isEmpty ||
          falecido_lista1[tipo].toString() == "0" ||
          falecido_lista1[tipo].toString() == "1" ||
          falecido_lista1[tipo].toString() == "null" ||
          falecido_lista1[tipo].toString() == "Não encontrada" ||
          falecido_lista1[tipo].toString() == "undefined") {
        falecido_lista1[tipo] =
            await erros_palavras.palavraFalecido(_aqv[tipo].toString());
        setState(() {});
      }
      if (data_ob1[tipo].isEmpty ||
          data_ob1[tipo].toString() == "0" ||
          data_ob1[tipo].toString() == "1" ||
          data_ob1[tipo].toString() == "null" ||
          data_ob1[tipo].toString() == "Não encontrada" ||
          data_ob1[tipo].toString() == "undefined") {
        data_ob1[tipo] =
            await erros_palavras.palavrasdata(_aqv[tipo].toString());
        setState(() {});
      }
      if (causa_mt_lista1[tipo].isEmpty ||
          causa_mt_lista1[tipo].toString() == "null" ||
          causa_mt_lista1[tipo].toString() == "0" ||
          causa_mt_lista1[tipo].toString() == "1" ||
          causa_mt_lista1[tipo].toString() == "Não encontrada" ||
          causa_mt_lista1[tipo].toString() == "undefined") {
        causa_mt_lista1[tipo] =
            await erros_palavras.palavracausa(_aqv[tipo].toString());
        setState(() {});
      }

      return txt.toString();
    } catch (e) {
      return "erros";
    }
  }

  void initState() {
    super.initState();

    um = [];
    contratante_txt1 = ["0", "1"];
    graul_txtx1 = ["0", "1"];
    cpf_lista1 = ["0", "1"];
    rg_lista1 = ["0", "1"];
    cel_lista1 = ["0", "1"];
    end_lista1 = ["0", "1"];
    falecido_lista1 = ["0", "1"];
    data_ob1 = ["0", "1"];
    causa_mt_lista1 = ["0", "1"];
    _controller_cel.text = "";
    _controller_contratante.text = "";
    _controller_cpf.text = "";
    _controller_endereco.text = "";
    _controller_falecido.text = "";
    _controller_morte.text = "";
    _controller_nomeaqv.text = "";
    _controller_parenteco.text = "";
    _controller_rg.text = "";
    _controller_obito.text = "";
  }

  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    final uploadButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff0B467C)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {
          carrengando = true;
        });
        var vari = await startWebFilePicker();
        print(vari);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(sizeW * 0.03, 10, sizeW * 0.03, 10),
        child: Icon(Icons.upload_file, size: sizeW * 0.025),
      ),
    );

    final saveButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff0D579B)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {
          carrengando = true;
        });
        if (controleExcel == 0) {
          try {
            for (int i = 0; i < _numeros_arq; i++) {
              FeedbackTest formsnback = FeedbackTest(
                  contratante_txt1[i].toString().replaceAll("Contratante:", ""),
                  graul_txtx1[i]
                      .toString()
                      .replaceAll("Grau de Parentesco:", ""),
                  cpf_lista1[i].toString().replaceAll("CPF:", ""),
                  rg_lista1[i].toString().replaceAll("RG:", ""),
                  cel_lista1[i].toString().replaceAll("Cel.:", ""),
                  end_lista1[i].toString().replaceAll("Endereço:", ""),
                  falecido_lista1[i].toString().replaceAll("Falecido:", ""),
                  data_ob1[i].toString().replaceAll("Data de óbito:", ""),
                  causa_mt_lista1[i]
                      .toString()
                      .replaceAll("Causa da Morte:", ""),
                  nome_aqv[i].toString());
              FromController fromcontroller = FromController((String response) {
                print(response);
                setState(() {
                  resultado = response;
                });
                if (response == FromController.STATUS_SUCCESS) {
                } else {}
              });
              await fromcontroller.submitForm(formsnback);
              // await Future.delayed(Duration(milliseconds: 114));
            }
            await Future.delayed(Duration(milliseconds: 100));
            setState(() {
              carrengando = false;
            });
          } catch (e) {
            await Future.delayed(Duration(milliseconds: 100));
            setState(() {
              resultado = e.toString();
              carrengando = false;
            });
          }
        }
        if (controleExcel == 1) {
          try {
            for (int i = 0; i < _numeros_arq; i++) {
              FeedbackPerfilSTS formsnback = FeedbackPerfilSTS(
                  nome_aqv[i].toString(),
                  contratante_txt1[i].toString().replaceAll("Contratante:", ""),
                  graul_txtx1[i]
                      .toString()
                      .replaceAll("Grau de Parentesco:", ""),
                  cpf_lista1[i].toString().replaceAll("CPF:", ""),
                  rg_lista1[i].toString().replaceAll("RG:", ""),
                  cel_lista1[i].toString().replaceAll("Cel.:", ""),
                  end_lista1[i].toString().replaceAll("Endereço:", ""),
                  falecido_lista1[i].toString().replaceAll("Falecido:", ""),
                  data_ob1[i].toString().replaceAll("Data de óbito:", ""),
                  causa_mt_lista1[i]
                      .toString()
                      .replaceAll("Causa da Morte:", ""));
              ControlePerfilSTS fromcontroller =
                  ControlePerfilSTS((String response) {
                print(response);
                setState(() {
                  resultado = response;
                });
                if (response == FromController.STATUS_SUCCESS) {
                } else {}
              });
              await fromcontroller.submitForm(formsnback);
              //

            }
            await Future.delayed(Duration(milliseconds: 114));
            setState(() {
              carrengando = false;
            });
          } catch (e) {
            setState(() {
              resultado = e.toString();
              setState(() {
                carrengando = false;
              });
            });
          }
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(sizeW * 0.03, 10, sizeW * 0.03, 10),
        child: Icon(Icons.save, size: sizeW * 0.025),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage("imagens/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff365775),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: sizeW * 0.05,
                height: sizeH,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    IconButton(
                      iconSize: sizeW * 0.030,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TelaLogin()),
                        );
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      iconSize: sizeW * 0.035,
                      onPressed: () {},
                      icon: DecoratedIcon(
                        MdiIcons.formatListBulletedSquare,
                        color: Color(0xFF6886A3),
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
                    SizedBox(
                      height: sizeH * 0.66,
                    ),
                    IconButton(
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
                              onPressed: () => Navigator.pop(context, 'FECHAR'),
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
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                width: sizeW * 0.95,
                height: sizeH,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      width: sizeW * 0.95,
                      height: sizeH * 0.1,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            width: (sizeW * 0.95) * 0.5,
                            height: sizeH * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      sizeW * 0.02, 0, sizeW * 0.02, 0),
                                  child: uploadButton,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      sizeW * 0.02, 0, sizeW * 0.03, 0),
                                  child: saveButton,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            width: (sizeW * 0.95) * 0.5,
                            height: sizeH * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      sizeW * 0.01, 0, sizeW * 0.01, 0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xff29D259),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  width: sizeW * 0.1,
                                  height: sizeH * 0.08,
                                  child: carrengando
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          _numeros_arq.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: sizeW * 0.03),
                                        ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      sizeW * 0.02, 0, sizeW * 0.03, 0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE74343),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  width: sizeW * 0.1,
                                  height: sizeH * 0.08,
                                  child: carrengando
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          erros.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: sizeW * 0.03),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: sizeW * 0.8,
                      height: sizeH * 0.9,
                      child:
                          /* ListView(
                        children: [
                          Text(rg_lista1[0].toString() +
                              "\n" +
                              falecido_lista1[0].toString() +
                              "\n" +
                              causa_mt_lista1[0].toString() +
                              "\n" +
                              data_ob1[0].toString() +
                              "\n" +
                              cel_lista1[0].toString() +
                              "\n" +
                              graul_txtx1[0].toString() +
                              "\n" +
                              contratante_txt1[0].toString() +
                              "\n" +
                              cpf_lista1[0].toString() +
                              "\n" +
                              end_lista1[0].toString()),
                        ],
                      ), */
                          carrengando
                              ? SizedBox(
                                  width: 0.0,
                                  height: 0.0,
                                )
                              : GridView.count(
                                  crossAxisCount: 2,
                                  children: List.generate(valor_lista, (index) {
                                    if (rg_lista1[index] == null ||
                                        falecido_lista1[index] == null ||
                                        causa_mt_lista1[index] == null ||
                                        data_ob1[index] == null ||
                                        cel_lista1[index] == null ||
                                        graul_txtx1[index] == null ||
                                        end_lista1[index] == null ||
                                        contratante_txt1[index] == null ||
                                        cpf_lista1[index] == null ||
                                        rg_lista1[index].toString() ==
                                            "erros" ||
                                        falecido_lista1[index].toString() ==
                                            "erros" ||
                                        causa_mt_lista1[index].toString() ==
                                            "erros" ||
                                        data_ob1[index].toString() == "erros" ||
                                        cel_lista1[index].toString() ==
                                            "erros" ||
                                        end_lista1[index].toString() ==
                                            "erros" ||
                                        graul_txtx1[index].toString() ==
                                            "erros" ||
                                        contratante_txt1[index].toString() ==
                                            "erros" ||
                                        cpf_lista1[index].toString() ==
                                            "erros" ||
                                        rg_lista1[index].toString() == "0" ||
                                        falecido_lista1[index].toString() ==
                                            "0" ||
                                        causa_mt_lista1[index].toString() ==
                                            "0" ||
                                        data_ob1[index].toString() == "0" ||
                                        cel_lista1[index].toString() == "0" ||
                                        end_lista1[index].toString() == "0" ||
                                        graul_txtx1[index].toString() == "0" ||
                                        contratante_txt1[index].toString() ==
                                            "0" ||
                                        cpf_lista1[index].toString() == "0" ||
                                        rg_lista1[index].toString() == "1" ||
                                        falecido_lista1[index].toString() ==
                                            "1" ||
                                        causa_mt_lista1[index].toString() ==
                                            "1" ||
                                        data_ob1[index].toString() == "1" ||
                                        cel_lista1[index].toString() == "1" ||
                                        end_lista1[index].toString() == "1" ||
                                        graul_txtx1[index].toString() == "1" ||
                                        contratante_txt1[index].toString() ==
                                            "1" ||
                                        cpf_lista1[index].toString() == "1" ||
                                        causa_mt_lista1[index].isEmpty ||
                                        causa_mt_lista1[index].toString() ==
                                            "null" ||
                                        causa_mt_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        causa_mt_lista1[index].toString() ==
                                            "undefined" ||
                                        data_ob1[index].isEmpty ||
                                        data_ob1[index].toString() == "null" ||
                                        data_ob1[index].toString() ==
                                            "Não encontrada" ||
                                        data_ob1[index].toString() ==
                                            "undefined" ||
                                        falecido_lista1[index].isEmpty ||
                                        falecido_lista1[index].toString() ==
                                            "null" ||
                                        falecido_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        falecido_lista1[index].toString() ==
                                            "undefined" ||
                                        end_lista1[index].isEmpty ||
                                        end_lista1[index].toString() ==
                                            "null" ||
                                        end_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        end_lista1[index].toString() ==
                                            "undefined" ||
                                        cel_lista1[index].isEmpty ||
                                        cel_lista1[index] == "" ||
                                        cel_lista1[index].toString() ==
                                            "Cel." ||
                                        cel_lista1[index].toString() ==
                                            "null" ||
                                        cel_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        cel_lista1[index].toString() ==
                                            "undefined" ||
                                        cpf_lista1[index].isEmpty ||
                                        cpf_lista1[index].toString() ==
                                            "null" ||
                                        cpf_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        cpf_lista1[index].toString() ==
                                            "undefined" ||
                                        graul_txtx1[index].isEmpty ||
                                        graul_txtx1[index].toString() ==
                                            "null" ||
                                        graul_txtx1[index].toString() ==
                                            "Não encontrada" ||
                                        graul_txtx1[index] == "undefined" ||
                                        rg_lista1[index].isEmpty ||
                                        rg_lista1[index].toString() == "null" ||
                                        rg_lista1[index].toString() ==
                                            "Não encontrada" ||
                                        rg_lista1[index].toString() ==
                                            "undefined" ||
                                        contratante_txt1[index].isEmpty ||
                                        contratante_txt1[index].toString() ==
                                            "null" ||
                                        contratante_txt1[index].toString() ==
                                            "Não encontrada" ||
                                        contratante_txt1[index].toString() ==
                                            "undefined") {
                                      corFundo[index] = Color(0xFF812929);
                                      setState(() {});
                                    } else {
                                      corFundo[index] = Color(0xff2981D2);
                                      setState(() {});
                                    }
                                    setState(() {});
                                    try {
                                      _controller_contratante =
                                          new TextEditingController(
                                              text: contratante_txt1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_nomeaqv =
                                          new TextEditingController(
                                              text: nome_aqv[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_rg =
                                          new TextEditingController(
                                              text: rg_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_cpf =
                                          new TextEditingController(
                                              text: cpf_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_cel =
                                          new TextEditingController(
                                              text: cel_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada")
                                                  .replaceAll(":", ""));
                                      _controller_endereco =
                                          new TextEditingController(
                                              text: end_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_parenteco =
                                          new TextEditingController(
                                              text: graul_txtx1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_obito =
                                          new TextEditingController(
                                              text: data_ob1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_morte =
                                          new TextEditingController(
                                              text: causa_mt_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                      _controller_falecido =
                                          new TextEditingController(
                                              text: falecido_lista1[index]
                                                  .toString()
                                                  .replaceAll(
                                                      "null", "Não encontada"));
                                    } catch (y) {}
                                    corFundo[index] = Color(0xff2981D2);
                                    _controller_contratante.text =
                                        "Nome: Lucas Souza";
                                    _controller_cpf.text =
                                        "CPF: 000.000.000-00";
                                    _controller_cel.text =
                                        "CEL: (11) 11111-1111";
                                    _controller_parenteco.text =
                                        "RG: 123.55.856-9";
                                    _controller_rg.text =
                                        "Endereço: AV dos Palmares, 111, 07810-050";
                                    return Container(
                                      height: sizeH * 0.4,
                                      padding: EdgeInsets.fromLTRB(
                                          sizeW * 0.02,
                                          sizeW * 0.025,
                                          sizeW * 0.02,
                                          sizeW * 0.025),
                                      margin: EdgeInsets.fromLTRB(
                                          sizeW * 0.02,
                                          sizeW * 0.025,
                                          sizeW * 0.02,
                                          sizeW * 0.025),
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(3,
                                                7), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: corFundo[index],
                                      ),
                                      child: ListView(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller:
                                                      _controller_nomeaqv,
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o nome'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller:
                                                      _controller_contratante,
                                                  onChanged: (novoValor) {
                                                    valor_teste_contratante[
                                                        index] = novoValor;

                                                    contratante_txt1[index] =
                                                        valor_teste_contratante[
                                                                index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Contratante'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller: _controller_cpf,
                                                  onChanged: (novoValor) {
                                                    valor_teste_cpf[index] =
                                                        novoValor;

                                                    cpf_lista1[index] =
                                                        valor_teste_cpf[index]
                                                            .toString();
                                                    _controller_cpf.selection =
                                                        TextSelection.fromPosition(
                                                            TextPosition(
                                                                offset:
                                                                    _controller_cpf
                                                                        .text
                                                                        .length));
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o CPF'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller: _controller_cel,
                                                  onChanged: (novoValor) {
                                                    valor_teste_cel[index] =
                                                        novoValor;

                                                    cel_lista1[index] =
                                                        valor_teste_cel[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Cel'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller:
                                                      _controller_parenteco,
                                                  onChanged: (novoValor) {
                                                    valor_teste_parentesco[
                                                        index] = novoValor;

                                                    graul_txtx1[index] =
                                                        valor_teste_parentesco[
                                                                index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Parentesco'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller: _controller_rg,
                                                  onChanged: (novoValor) {
                                                    valor_teste_rg[index] =
                                                        novoValor;

                                                    rg_lista1[index] =
                                                        valor_teste_rg[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Informe o RG'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          /* Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller:
                                                      _controller_endereco,
                                                  onChanged: (novoValor) {
                                                    valor_teste_end[index] =
                                                        novoValor;

                                                    end_lista1[index] =
                                                        valor_teste_end[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Endereço'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller: _controller_morte,
                                                  onChanged: (novoValor) {
                                                    valor_teste_causa[index] =
                                                        novoValor;

                                                    causa_mt_lista1[index] =
                                                        valor_teste_causa[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Causa da Morte'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller:
                                                      _controller_falecido,
                                                  onChanged: (novoValor) {
                                                    valor_teste_data[index] =
                                                        novoValor;

                                                    falecido_lista1[index] =
                                                        valor_teste_data[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Falecido'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: TextField(
                                                  controller: _controller_obito,
                                                  onChanged: (novoValor) {
                                                    valor_teste_data[index] =
                                                        novoValor;

                                                    data_ob1[index] =
                                                        valor_teste_data[index]
                                                            .toString();
                                                  },
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Informe o Data de Óbito'),
                                                ),
                                              ),
                                            ],
                                          ),*/
                                          /* Row(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: Text(
                                                  _aqv[index].toString(),
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: sizeW * 0.015),
                                                ),
                                              ),
                                            ],
                                          ),*/
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
