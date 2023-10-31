import 'package:flutter/material.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/post.dart';
import 'package:front_crudaves/functions/getAves.dart';
import 'package:front_crudaves/screen/verAve.dart';
import 'package:http/http.dart' as http;

class GET extends StatefulWidget {
  GET({Key? key}) : super(key: key);

  @override
  State<GET> createState() => _GETState();
}

class _GETState extends State<GET> {
  late Future<List<Ave>> aves; // Alterar o tipo para List<Ave>

  @override
  void initState() {
    super.initState();
    aves = getAves();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Ave>>(
                  // Alterar o tipo para List<Ave>
                  future: aves,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.55,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (_) {
                                //     return verAve(ave: snapshot.data![index]); // Passar o objeto Ave
                                //   }),
                                // );
                              },
                              child: Column(
                                children: [
                                  Image.network(snapshot
                                      .data![index].link), // Usar link da Ave
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      snapshot.data![index]
                                          .nome, // Usar nome da Ave
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            'Erro ao carregar aves',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        );
                      }
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => POST()),
                  );
                },
                child: Icon(Icons.add), // Ícone de adição
              ),
            ],
          ),
        ),
      ),
    );
  }
}
