import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front_crudaves/model/Ave.dart';
import 'package:front_crudaves/screen/post.dart';
import 'package:front_crudaves/functions/getAves.dart';
import 'package:front_crudaves/screen/verAve.dart';
import 'package:http/http.dart' as http;

class GET extends StatefulWidget {
  const GET({Key? key}) : super(key: key);

  @override
  State<GET> createState() => _GETState();
}

class _GETState extends State<GET> {
  late Future<List> aves;

  @override
  void initState() {
    super.initState();
    aves = getAves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CRUD Aves')),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => POST()),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: FutureBuilder<List>(
          future: aves,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${snapshot.data![index]['nome']} ${snapshot.data![index]['apelido']}'),
                    subtitle: Text(snapshot.data![index]['nomeCientifico']),
                    trailing: Text('${snapshot.data![index]['id']}'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(snapshot.data![index]['link']),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return VerAve(aveJson: snapshot.data![index]);
                          },
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {}
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
