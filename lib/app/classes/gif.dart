class Gif {
  String url = "";
  String autor = "";
  String titulo = "";
 

  Gif({
    this.url,
    this.autor,
    this.titulo,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'autor': autor,
      'titulo': titulo,
    };
  }
}

