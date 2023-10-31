import 'dart:convert';

import 'package:frontend/models/Serie.dart';
import 'package:http/http.dart' as http;

Future<List> getSeries() async {
  var url = Uri.parse('http://177.220.18.47:2008/series');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    print(json.decode(response.body).map((serie) => serie).toList());
    return json.decode(response.body).map((serie) => serie).toList();
  }

  throw Exception('Erro ao carregar série');
}
