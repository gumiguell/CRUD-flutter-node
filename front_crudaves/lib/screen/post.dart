import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_crudaves/functions/getAves.dart';
import 'package:front_crudaves/main.dart';
import 'package:front_crudaves/functions/postAves.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/get.dart';

class POST extends StatelessWidget {
  POST({Key? key}) : super(key: key);

  final TextEditingController _id = TextEditingController();
  final TextEditingController _nomeCientifico = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _apelido = TextEditingController();
  final TextEditingController _link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _id,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              label: const Text(
                'Id ave',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _nomeCientifico,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              label: const Text(
                'Nome científico da ave',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _nome,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              label: const Text(
                'Nome da ave',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _apelido,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              label: const Text(
                'Apelido da ave',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextField(
            keyboardType: TextInputType.url,
            controller: _link,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              label: const Text(
                'Link da imagem da ave',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Ave novaAve = Ave(
                        id: int.parse(_id.text),
                        nomeCientifico: _nomeCientifico.text,
                        nome: _nome.text,
                        apelido: _apelido.text,
                        link: _link.text);
                    postAves(novaAve.toJson());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ave adicionada com sucesso')),
                    );
                  },
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              SizedBox(height: 16), // Espaço vertical entre os botões
              SizedBox(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
