import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/models/motel.dart';

void main() {
  group('Suite', () {
    test('Deve criar um objeto Suite a partir do JSON corretamente', () {
      final json = {
        'nome': 'Suite Premium',
        'preco': 150.0,
        'qtd': 2,
        'fotos': ['foto1.jpg', 'foto2.jpg'],
        'categoriaItens': [
          {'icone': 'icone1.png'},
          {'icone': 'icone2.png'}
        ],
        'periodos': [
          {'tempoFormatado': '1 hora', 'valorTotal': 100.0},
          {'tempoFormatado': '2 horas', 'valorTotal': 150.0}
        ]
      };

      final suite = Suite.fromJson(json);

      expect(suite.nome, 'Suite Premium');
      expect(suite.preco, 150.0);
      expect(suite.qtd, 2);
      expect(suite.fotos, ['foto1.jpg', 'foto2.jpg']);
      expect(suite.itensCategoria.length, 2);
      expect(suite.itensCategoria[0].iconeUrl, 'icone1.png');
      expect(suite.periodos.length, 2);
      expect(suite.periodos[0].tempoFormatado, '1 hora');
      expect(suite.periodos[0].valorTotal, 100.0);
    });

    test('Deve lidar com valores ausentes no JSON', () {
      final json = {
        'nome': 'Suite Básica',
        'preco': 100.0,
      };

      final suite = Suite.fromJson(json);

      expect(suite.nome, 'Suite Básica');
      expect(suite.preco, 100.0);
      expect(suite.qtd, 0);
      expect(suite.fotos.isEmpty, true);
      expect(suite.itensCategoria.isEmpty, true);
      expect(suite.periodos.isEmpty, true);
    });
  });
}
