import 'package:flutter/material.dart';
import 'package:front_crudaves/functions/putAves.dart'; // Importe a função para atualizar as aves
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/get.dart';

class PUT extends StatelessWidget {
  PUT({Key? key, required this.ave}) : super(key: key);

  final Ave ave;

  final TextEditingController _nomeCientifico = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _apelido = TextEditingController();
  final TextEditingController _link = TextEditingController();

  @override
  void initState() {
    // Preencha os controladores com os detalhes atuais da ave
    _nomeCientifico.text = ave.nomeCientifico;
    _nome.text = ave.nome;
    _apelido.text = ave.apelido;
    _link.text = ave.link;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        // Atualize a ave com os dados dos controladores
                        Ave aveAtualizada = Ave(
                          id: ave.id,
                          nomeCientifico: _nomeCientifico.text,
                          nome: _nome.text,
                          apelido: _apelido.text,
                          link: _link.text,
                        );
                        putAves(
                          ave.id, // id da ave
                          _nomeCientifico.text,
                          _nome.text,
                          _apelido.text,
                          _link.text,
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return GET();
                        }));
                      },
                      child: const Text(
                        'Atualizar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
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
                        'Cancelar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
