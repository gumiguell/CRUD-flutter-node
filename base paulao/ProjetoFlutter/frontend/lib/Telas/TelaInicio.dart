import 'package:flutter/material.dart';
import 'package:frontend/Telas/TelaIncluir.dart';
import 'package:frontend/Telas/TelaVerSerie.dart';
import 'package:frontend/functions/getSeries.dart';

import '../models/Serie.dart';

class TelaInicio extends StatefulWidget{
  TelaInicio({Key? key}) : super(key: key);

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  late Future<List> series;

  @override
  void initState() {
    super.initState();
    series = getSeries();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000000),

        body: Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List>(
                  future: series,
               
                  builder: (context, snapshot){
              
                    if(snapshot.hasData){
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.55
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return TelaVerSerie(serieJson: snapshot.data![index]);
                                  }
                                )
                              );
                            },
                            child: Column(
                              children: [
                                Image.network(snapshot.data![index]['imagem'].toString()),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    snapshot.data![index]['titulo'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }else if(snapshot.hasError){
                      return const Center(
                        child: Text(
                          'Erro ao carregar séries',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      );
                    }
              
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),

                  child: const Text(
                    'Adicionar série',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return TelaIncluir();
                        }
                      )
                    );
                  },
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}