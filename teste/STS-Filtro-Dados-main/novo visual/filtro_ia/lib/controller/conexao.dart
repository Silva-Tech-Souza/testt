import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'parametros.dart';

class FromController {
  final void Function(String) callbeck;
  var url =
      "https://script.google.com/macros/s/AKfycbyOyolr6jePkpf76W3jVBtxwKSsvkfiOZ2AF2hiB2C2BU_J3Vdd/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  FromController(this.callbeck);
  Future<String> submitForm(FeedbackTest feedback) async {
    try {
      await http.get(url + feedback.toParams()).then((reponse) {
        callbeck(convert.jsonDecode(reponse.body)['status']);
      });
      return "foi";
    } catch (e) {
      return "nao foi";
    }
  }
}

class ControlePerfilSTS {
  final void Function(String) callback;
  var url =
      "https://script.google.com/macros/s/AKfycbw9n5FHQKd1q-QuEC1CZ5PyVCFnuIdqcoMG2O7EAyHZ-PSDdZQ/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  ControlePerfilSTS(this.callback);
  Future<String> submitForm(FeedbackPerfilSTS feedback) async {
    try {
      await http.get(url + feedback.toParams()).then((reponse) {
        callback(convert.jsonDecode(reponse.body)['status']);
      });
      return "foi";
    } catch (e) {
      return "nao foi";
    }
  }
}
