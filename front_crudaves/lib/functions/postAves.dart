import 'dart:convert';
import 'package:front_crudaves/model/Ave.dart';
import 'package:http/http.dart' as http;

Future<String> postAves(Map<String, dynamic> aveJson) async{
  var url = Uri.parse('http://localhost:3306/aves/incluir');

  var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode(aveJson));

  if(response.statusCode == 200){
    return json.decode(response.body).toString();
  }

  throw Exception(json.decode(response.body).toString());
}
