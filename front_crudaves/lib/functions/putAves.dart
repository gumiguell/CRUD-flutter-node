import 'package:flutter/material.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> putAves(int id, String nomeCientifico, String nome, String apelido, String link) async {
  final url = Uri.parse('http://177.220.18.53:3306/aves/$id');
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  final ave = Ave(id: id, nomeCientifico: nomeCientifico, nome: nome, apelido: apelido, link: link);
  final aveJson = jsonEncode(ave);

  try {
    final response = await http.put(url, headers: headers, body: aveJson);

    if (response.statusCode == 200) 
      print('Ave atualizada com sucesso');
    else 
      print('Erro na atualização da ave. Código de status: ${response.statusCode}');

  } catch (e) {
    print('Erro durante a atualização da ave: $e');
  }
}

