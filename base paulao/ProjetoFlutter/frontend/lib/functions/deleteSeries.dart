import 'dart:convert';

import 'package:frontend/models/Serie.dart';
import 'package:http/http.dart' as http;

Future<http.Response> deleteSeries(String titulo) async {
    var url = Uri.parse('http://177.220.18.46:2008/series/deletar/${titulo}');

    var response = await http.delete(url);
    <String, String>{'Content-Type': 'application/json;',
    };

  return response;
}
