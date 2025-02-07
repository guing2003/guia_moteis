import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/models/motel.dart';

void main() {
  group('Motel', () {
    test('Deve criar um objeto Motel a partir do JSON corretamente', () {
      final json = {
        'fantasia': 'Motel A',
        'logo': 'logoA.png',
        'bairro': 'Bairro A',
        'distancia': 10.0,
        'qtdFavoritos': 5,
        'suites': [],
        'media': 4.5,
        'qtdAvaliacoes': 10,
      };

      final motel = Motel.fromJson(json);

      expect(motel.fantasia, 'Motel A');
      expect(motel.logo, 'logoA.png');
      expect(motel.bairro, 'Bairro A');
      expect(motel.distancia, 10.0);
      expect(motel.qtdFavoritos, 5);
      expect(motel.suites.isEmpty, true);
      expect(motel.media, 4.5);
      expect(motel.qtdAvaliacoes, 10);
    });

    test('Deve lidar com valores ausentes no JSON', () {
      final json = {
        'fantasia': 'Motel B',
        'logo': 'logoB.png',
      };

      final motel = Motel.fromJson(json);

      expect(motel.fantasia, 'Motel B');
      expect(motel.logo, 'logoB.png');
      expect(motel.bairro, '');
      expect(motel.distancia, 0.0);
      expect(motel.qtdFavoritos, 0);
      expect(motel.suites.isEmpty, true);
      expect(motel.media, 0.0);
      expect(motel.qtdAvaliacoes, 0);
    });
  });
}
