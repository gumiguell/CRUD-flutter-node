import 'dart:convert';
import 'package:front_crudaves/model/Ave.dart';
import 'package:http/http.dart' as http;

Future<String> putAves(Map<String, dynamic> aveJson, int id) async{
  var url = Uri.parse('http://localhost:3306/aves/${id}');

  var response = await http.put(url, body: json.encode(aveJson), headers: {"Content-Type": "application/json"});

  if(response.statusCode == 200){
    return json.decode(response.body).toString();
  }

  throw Exception(json.decode(response.body).toString());
}