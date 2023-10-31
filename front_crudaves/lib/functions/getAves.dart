import 'dart:convert';
import 'package:front_crudaves/model/Ave.dart';
import 'package:http/http.dart' as http;

Future<List<Ave>> getAves() async {
  var url = Uri.parse('http://localhost:3306/aves');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> avesJson = json.decode(response.body);
    List<Ave> aves = avesJson.map((aveJson) => Ave.fromJson(aveJson)).toList();
    return aves;
  }

  throw Exception('Erro ao carregar aves');
}
