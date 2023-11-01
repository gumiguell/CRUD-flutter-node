import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:http/http.dart' as http;

Future<List> getAves() async {
  var url = Uri.parse('http://177.220.18.53:3306/aves');
  var response = await http.get(url);
  if (kDebugMode) {
    print("aaaa");
  }
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    if (kDebugMode) {
      print("entrou no else");
    }
    throw Exception('Erro no getAves');
  }
}
