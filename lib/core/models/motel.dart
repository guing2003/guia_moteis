class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    var suiteList = (json['suites'] as List)
        .map((item) => Suite.fromJson(item))
        .toList();
    return Motel(
      fantasia: json['fantasia'] ?? '',
      logo: json['logo'] ?? '',
      bairro: json['bairro'] ?? '',
      distancia: json['distancia']?.toDouble() ?? 0.0,
      qtdFavoritos: json['qtdFavoritos'] ?? 0,
      suites: suiteList,
    );
  }
}

class Suite {
  final String nome;
  final double preco;  // Adicionando o campo preço
  final List<String> fotos;

  Suite({
    required this.nome,
    required this.preco,
    required this.fotos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'] ?? '',
      preco: json['preco']?.toDouble() ?? 0.0,  // Ajustando para pegar o preço
      fotos: List<String>.from(json['fotos'] ?? []),
    );
  }
}
