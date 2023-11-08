import 'package:flutter/material.dart';
import 'package:front_crudaves/functions/deleteAves.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/get.dart';

class VerAve extends StatelessWidget {
  VerAve({Key? key, required this.aveJson}) : super(key: key);

  final Map<String, dynamic> aveJson;
  late Ave ave;

  @override
  Widget build(BuildContext context) {
    ave = Ave(
      id: aveJson['id'],
      nomeCientifico: aveJson['nomeCientifico'],
      nome: aveJson['nome'],
      apelido: aveJson['apelido'],
      link: aveJson['link'],
    );

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Image.network(
              ave.link,
              height: 200, // Altura da imagem
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "ID: ${ave.id}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  ave.nomeCientifico,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Nome: ${ave.nome}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Apelido: ${ave.apelido}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Atualizar Ave'),
          ),
          ElevatedButton(
            onPressed: () {
              deleteAves(ave.id.toString());
              Navigator.pop(context);
            },
            child: Text('Excluir Ave'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
