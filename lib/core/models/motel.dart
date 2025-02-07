class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<Suite> suites;
  final double media;
  final int qtdAvaliacoes;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.media,
    required this.qtdAvaliacoes,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'] ?? '',
      logo: json['logo'] ?? '',
      bairro: json['bairro'] ?? '',
      distancia: (json['distancia'] is num) ? (json['distancia'] as num).toDouble() : 0.0,
      qtdFavoritos: json['qtdFavoritos'] is int ? json['qtdFavoritos'] : 0,
      suites: (json['suites'] as List?)?.map((item) => Suite.fromJson(item)).toList() ?? [],
      media: (json['media'] is num) ? (json['media'] as num).toDouble() : 0.0,
      qtdAvaliacoes: json['qtdAvaliacoes'] is int ? json['qtdAvaliacoes'] : 0,
    );
  }
}


class Suite {
  final String nome;
  final double preco;
  final int qtd;
  final List<String> fotos;
  final List<ItensCategoria> itensCategoria;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.preco,
    required this.qtd,
    required this.fotos,
    required this.itensCategoria,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'] ?? '',
      preco: (json['preco'] is num) ? (json['preco'] as num).toDouble() : 0.0,
      qtd: json['qtd'] is int ? json['qtd'] : 0,
      fotos: (json['fotos'] as List?)?.map((f) => f.toString()).toList() ?? [],
      itensCategoria: (json['categoriaItens'] as List?)?.map((item) => ItensCategoria.fromJson(item)).toList() ?? [],
      periodos: (json['periodos'] as List?)?.map((item) => Periodo.fromJson(item)).toList() ?? [],
    );
  }
}

class Periodo {
  final String tempoFormatado;
  final double valorTotal;

  Periodo({required this.tempoFormatado, required this.valorTotal});

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'] ?? '',
      valorTotal: (json['valorTotal'] is num) ? (json['valorTotal'] as num).toDouble() : 0.0,
    );
  }
}

class ItensCategoria {
  final String iconeUrl;

  ItensCategoria({required this.iconeUrl});

  factory ItensCategoria.fromJson(Map<String, dynamic> json) {
    return ItensCategoria(
      iconeUrl: json['icone'] ?? '',
    );
  }
}
