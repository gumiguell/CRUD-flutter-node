import 'package:flutter/material.dart';
import 'package:frontend/Telas/TelaInicio.dart';
import 'package:frontend/functions/postSerie.dart';
import 'package:frontend/models/Serie.dart';

class TelaIncluir extends StatelessWidget {
  TelaIncluir({Key? key}) : super(key: key);

  final TextEditingController _tituloDaSerie = TextEditingController();
  final TextEditingController _generoDaSerie = TextEditingController();
  final TextEditingController _temporadasDaSerie = TextEditingController();
  final TextEditingController _emissoraDaSerie = TextEditingController();
  final TextEditingController _sinopseDaSerie = TextEditingController();
  final TextEditingController _imagemDaSerie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Column(children: [
            TextField(
              controller: _tituloDaSerie,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  label: const Text(
                    'Título da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _generoDaSerie,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  label: const Text(
                    'Gênero da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              style: const TextStyle(color: Colors.white),
              controller: _temporadasDaSerie,
              decoration: InputDecoration(
                  label: const Text(
                    'Temporadas da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _emissoraDaSerie,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  label: const Text(
                    'Emissora da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _sinopseDaSerie,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  label: const Text(
                    'Sinopse da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _imagemDaSerie,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  label: const Text(
                    'imagem da série',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.white))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Serie novaSerie = Serie(
                      titulo: _tituloDaSerie.text,
                      genero: _generoDaSerie.text,
                      temporadas: int.parse(_temporadasDaSerie.text),
                      emissora: _emissoraDaSerie.text,
                      sinopse: _sinopseDaSerie.text,
                      imagem: _imagemDaSerie.text);
                  postSeries(novaSerie.toJson());
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TelaInicio();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Voltar',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
