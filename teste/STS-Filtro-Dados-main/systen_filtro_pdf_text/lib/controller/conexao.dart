import 'package:systen_filtro_pdf_text/controller/parametros.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FromController {
  final void Function(String) callbeck;
  var url =
      "https://script.google.com/macros/s/AKfycbyOyolr6jePkpf76W3jVBtxwKSsvkfiOZ2AF2hiB2C2BU_J3Vdd/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  FromController(this.callbeck);
  void submitForm(FeedbackTest feedback) async {
    try {
      await http.get(url + feedback.toParams()).then((reponse) {
        callbeck(convert.jsonDecode(reponse.body)['status']);
      });
    } catch (e) {}
  }
}

class ControlePerfilSTS {
  final void Function(String) callback;
  var url =
      "https://script.google.com/macros/s/AKfycbyOyolr6jePkpf76W3jVBtxwKSsvkfiOZ2AF2hiB2C2BU_J3Vdd/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  ControlePerfilSTS(this.callback);
  void submitForm(FeedbackPerfilSTS feedback) async {
    try {
      await http.get(url + feedback.toParams()).then((reponse) {
        callback(convert.jsonDecode(reponse.body)['status']);
      });
    } catch (e) {}
  }
}
