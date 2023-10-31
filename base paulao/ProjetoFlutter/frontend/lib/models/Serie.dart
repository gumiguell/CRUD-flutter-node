class Serie{
  String titulo;
  String genero;
  int temporadas;
  String emissora;
  String sinopse;
  String imagem;

  Serie({
    required this.titulo,
    required this.genero,
    required this.temporadas,
    required this.emissora,
    required this.sinopse,
    required this.imagem,
  });

  Serie.fromJson(Map<String, dynamic> json):
  titulo = json['titulo'],
  genero = json['genero'],
  temporadas = json['temporadas'],
  emissora = json['emissora'],
  sinopse = json['sinopse'],
  imagem = json['imagem'];

  Map<String, dynamic> toJson(){
    return {
      "titulo": titulo,
      "genero": genero,
      "temporadas": temporadas,
      "emissora": emissora,
      "sinopse": sinopse,
      "imagem": imagem,
    };
  }
}