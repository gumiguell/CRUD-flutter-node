import 'package:flutter/material.dart';
import 'package:frontend/Telas/TelaInicio.dart';
import 'package:frontend/functions/deleteSeries.dart';
import 'package:frontend/models/Serie.dart';

class TelaVerSerie extends StatelessWidget {
  TelaVerSerie({Key? key, required this.serieJson}) : super(key: key);

  Map<String, dynamic> serieJson;
  late Serie serie;

  @override
  Widget build(BuildContext context) {
    serie = Serie(
        titulo: serieJson['titulo'],
        genero: serieJson['genero'],
        temporadas: serieJson['temporadas'],
        emissora: serieJson['emissora'],
        sinopse: serieJson['sinopse'],
        imagem: serieJson['imagem']);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(serie.imagem),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              color: Colors.black,
            ),

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.375,
                    top: MediaQuery.of(context).size.height * 0.05
                  ),
                  child: FloatingActionButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                    backgroundColor: Colors.black.withOpacity(0),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.60
                ),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Text(
                            serie.titulo,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.025
                            ),
                          ),
                    
                          Text(
                            (serie.temporadas > 1) ? '${serie.temporadas} temporadas' : '${serie.temporadas} temporada',
                            style: const TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 1),

                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Emissora: ${serie.emissora}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
                
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.003,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.10,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'Sinopse: ${serie.sinopse}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.001,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      
                    },
                
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
                
                    child: Text(
                      'Atulizar série',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.02
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      deleteSeries(serie.titulo);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TelaInicio(),
                      ));
                    },
                
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
                
                    child: Text(
                      'Excluir série',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.02
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },

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
                    'Voltar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ),
              )
              ],
            )
          ),
        ],
      ),
    );
  }
}
