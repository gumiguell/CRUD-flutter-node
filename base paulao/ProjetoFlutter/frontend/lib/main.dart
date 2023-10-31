import 'package:flutter/material.dart';

import 'Telas/TelaInicio.dart';

void main() {
  runApp(const ProjetoFlutter());
}

class ProjetoFlutter extends StatelessWidget{
  const ProjetoFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: TelaInicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}