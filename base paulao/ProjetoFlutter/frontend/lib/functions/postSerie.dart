import 'dart:convert';

import 'package:frontend/models/Serie.dart';
import 'package:http/http.dart' as http;

Future<String> postSeries(Map<String, dynamic> serieJson) async {
  var url = Uri.parse('http://177.220.18.46:2008/series/incluir');

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(serieJson));

  if (response.statusCode == 200) {
    return json.decode(response.body).toString();
  }

  throw Exception(json.decode(response.body).toString());
}
