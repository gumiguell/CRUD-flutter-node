import 'package:flutter/material.dart';
import 'package:front_crudaves/functions/deleteAves.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/get.dart';

class verAve extends StatelessWidget {
  verAve({Key? key, required this.aveJson, required Ave ave}) : super(key: key);

  Map<String, dynamic> aveJson;
  late Ave ave;

  @override
  Widget build(BuildContext context) {
    ave = Ave(
        id: aveJson['id'],
        nomeCientifico: aveJson['nomeCientifico'],
        nome: aveJson['nome'],
        apelido: aveJson['apelido'],
        link: aveJson['link']);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ave.link),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.375,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                    backgroundColor: Colors.black.withOpacity(0),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.60),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Text(
                            ave.id.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                          ),
                          Text(
                            ave.nomeCientifico,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        ave.nome,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.003,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        ave.apelido,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'Atulizar Ave',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      deleteAves(ave.id.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GET(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'Excluir Ave',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
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
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
