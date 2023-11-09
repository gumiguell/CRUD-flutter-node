import 'package:flutter/material.dart';
import 'package:front_crudaves/functions/deleteAves.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/get.dart';
import 'package:front_crudaves/functions/putAves.dart';

class VerAve extends StatefulWidget {
  VerAve({Key? key, required this.aveJson}) : super(key: key);

  final Map<String, dynamic> aveJson;
  late Ave ave;

  @override
  _VerAveState createState() => _VerAveState();
}

class _VerAveState extends State<VerAve> {
  late TextEditingController nomeCientificoController;
  late TextEditingController nomeController;
  late TextEditingController apelidoController;
  late TextEditingController linkController;

  @override
  void initState() {
    super.initState();
    widget.ave = Ave(
      id: widget.aveJson['id'],
      nomeCientifico: widget.aveJson['nomeCientifico'],
      nome: widget.aveJson['nome'],
      apelido: widget.aveJson['apelido'],
      link: widget.aveJson['link'],
    );

    // Inicialize os controladores com os valores atuais da ave
    nomeCientificoController =
        TextEditingController(text: widget.ave.nomeCientifico);
    nomeController = TextEditingController(text: widget.ave.nome);
    apelidoController = TextEditingController(text: widget.ave.apelido);
    linkController = TextEditingController(text: widget.ave.link);
  }

  @override
  void dispose() {
    nomeCientificoController.dispose();
    nomeController.dispose();
    apelidoController.dispose();
    linkController.dispose();
    super.dispose();
  }

  void atualizarAve() {
    // Atualize os dados da ave com base nos controladores
    widget.ave.nomeCientifico = nomeCientificoController.text;
    widget.ave.nome = nomeController.text;
    widget.ave.apelido = apelidoController.text;
    widget.ave.link = linkController.text;

    putAves(widget.ave.id, widget.ave.nomeCientifico, widget.ave.nome,
        widget.ave.apelido, widget.ave.link);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ave atualizada com sucesso')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Ave'),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network(
              widget.ave.link,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "ID: ${widget.ave.id}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: nomeCientificoController,
                    decoration:
                        InputDecoration(labelText: 'Nome Cientifico da Ave'),
                  ),
                  // Use TextField para permitir a edição do Nome da Ave
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: 'Nome da Ave'),
                  ),
                  // Use TextField para permitir a edição do Apelido da Ave
                  TextField(
                    controller: apelidoController,
                    decoration: InputDecoration(labelText: 'Apelido da Ave'),
                  ),
                  TextField(
                    controller: linkController,
                    decoration:
                        InputDecoration(labelText: 'Link da imagem da Ave'),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 16),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: atualizarAve,
                          child: const Text(
                            'Atualizar Ave',
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
                            deleteAves(widget.ave.id.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Ave deletada com sucesso')),
                            );
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Excluir Ave',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
