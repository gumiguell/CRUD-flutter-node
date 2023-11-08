// class Ave {
//   final int id;
//   final String nomeCientifico;
//   final String nome;
//   final String apelido;
//   final String link;

//   Ave(this.id, this.nomeCientifico, this.nome, this.apelido, this.link);
// }
class Ave {
  int id;
  String nomeCientifico;
  String nome;
  String apelido;
  String link;

  Ave({
    required this.id,
    required this.nomeCientifico,
    required this.nome,
    required this.apelido,
    required this.link,
  });

  Ave.fromJson(Map<String, dynamic> aveJson)
      : id = aveJson['id'],
        nomeCientifico = aveJson['nomeCientifico'],
        nome = aveJson['nome'],
        apelido = aveJson['apelido'],
        link = aveJson['link'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nomeCientifico": nomeCientifico,
      "nome": nome,
      "apelido": apelido,
      "link": link,
    };
  }
}
