import 'dart:convert';
import 'package:front_crudaves/model/Ave.dart';
import 'package:http/http.dart' as http;

Future<http.Response> deleteAves(String id) async {
  var url = Uri.parse('http://177.220.18.53:3306/aves/${id}');

  var response = await http.delete(url);
  <String, String>{'Content-Type':'application/json;',
  };

  return response;

}